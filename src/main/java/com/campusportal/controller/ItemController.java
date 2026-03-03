package com.campusportal.controller;

import com.campusportal.model.Item;
import com.campusportal.model.User;
import com.campusportal.service.ItemService;
import com.campusportal.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.security.core.context.SecurityContextHolder;
import java.io.IOException;
import java.util.Optional;

@Controller
public class ItemController {

    @Autowired
    private ItemService itemService;

    @Autowired
    private UserService userService;

    @GetMapping("/report-item")
    public String showReportForm(@RequestParam String type, Model model, Authentication authentication) {
        model.addAttribute("type", type.toUpperCase()); // "LOST" or "FOUND"
        return "report_item";
    }

    @PostMapping("/report-item")
    public String reportItem(@ModelAttribute Item item,
                             @RequestParam("image") MultipartFile image,
                             Authentication authentication) throws IOException {
        
        Optional<User> currentUser = userService.findByEmail(authentication.getName());
        currentUser.ifPresent(item::setUser);
        
        // Ensure status is uppercase
        if (item.getStatus() != null) {
            item.setStatus(item.getStatus().toUpperCase());
        }
        
        itemService.saveItem(item, image);
        
        return "redirect:/dashboard?success=Item reported successfully";
    }

    @GetMapping("/items")
    public String listItems(@RequestParam(required = false) String status, Model model, Authentication authentication) {
        if (status != null && !status.isEmpty()) {
            model.addAttribute("items", itemService.getItemsByStatus(status.toUpperCase()));
        } else {
            model.addAttribute("items", itemService.getActiveItems());
        }
        
        if (authentication != null && authentication.isAuthenticated()) {
            Optional<User> userOpt = userService.findByEmail(authentication.getName());
            if (userOpt.isPresent()) {
                User user = userOpt.get();
                model.addAttribute("loggedInUser", user);
                
                // Robustly fetch categories of items this user has reported as LOST
                // Check both uppercase and lowercase for safety
                java.util.List<Item> allItems = itemService.getAllItems();
                java.util.Set<String> userLostCategories = allItems.stream()
                        .filter(i -> "LOST".equalsIgnoreCase(i.getStatus()))
                        .filter(i -> i.getUser() != null && i.getUser().getId().equals(user.getId()))
                        .map(i -> i.getCategory() != null ? i.getCategory().trim() : "")
                        .collect(java.util.stream.Collectors.toSet());
                
                model.addAttribute("userLostCategories", userLostCategories);
            }
        }
        
        return "items";
    }

    @GetMapping("/api/items/match")
    @ResponseBody
    public java.util.List<Item> matchItems(@RequestParam String category, @RequestParam String status) {
        // Find items with opposite status in same category
        String targetStatus = status.equals("LOST") ? "FOUND" : "LOST";
        return itemService.getItemsByCategoryAndStatus(category, targetStatus);
    }
}
