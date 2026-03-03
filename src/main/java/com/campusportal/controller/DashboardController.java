package com.campusportal.controller;

import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.campusportal.model.Claim;
import com.campusportal.model.Item;
import com.campusportal.model.User;
import com.campusportal.repository.ItemRepository;
import com.campusportal.service.ClaimService;
import com.campusportal.service.ItemService;
import com.campusportal.service.UserService;

@Controller
public class DashboardController {

    @Autowired
    private UserService userService;

    @Autowired
    private ItemService itemService;

    @Autowired
    private ClaimService claimService;
    
    @Autowired
    private ItemRepository itemRepository;

    @GetMapping("/dashboard")
    public String dashboard(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        Optional<User> userOpt = userService.findByEmail(auth.getName());
        
        if (userOpt.isPresent()) {
            User user = userOpt.get();
            model.addAttribute("loggedInUser", user);
            
            List<Item> myItems = itemRepository.findByUser(user);
            long lostCount = myItems.stream().filter(i -> "LOST".equals(i.getStatus())).count();
            long foundCount = myItems.stream().filter(i -> "FOUND".equals(i.getStatus())).count();
            List<Claim> myClaims = claimService.getClaimsByUser(user);
            
            model.addAttribute("lostCount", lostCount);
            model.addAttribute("foundCount", foundCount);
            model.addAttribute("claimCount", myClaims.size());

            // Aggregate Recent Activity for the User
            List<Map<String, Object>> activities = new java.util.ArrayList<>();
            
            // Add user's recently reported items
            myItems.stream().limit(5).forEach(item -> {
                Map<String, Object> activity = new java.util.HashMap<>();
                activity.put("time", item.getCreatedAt());
                activity.put("description", "You reported: " + item.getTitle());
                activity.put("type", item.getStatus()); // LOST or FOUND
                activities.add(activity);
            });
            
            // Add user's recent claims
            myClaims.stream().limit(5).forEach(claim -> {
                Map<String, Object> activity = new java.util.HashMap<>();
                activity.put("time", claim.getCreatedAt());
                activity.put("description", "Claim submitted for: " + claim.getItem().getTitle());
                activity.put("type", "CLAIM");
                activities.add(activity);
            });
            
            // Sort by time descending and limit to 5
            List<Map<String, Object>> sortedActivities = activities.stream()
                    .sorted((a, b) -> ((java.time.LocalDateTime)b.get("time")).compareTo((java.time.LocalDateTime)a.get("time")))
                    .limit(5)
                    .collect(Collectors.toList());
            
            model.addAttribute("recentActivities", sortedActivities);
        }
        
        return "dashboard";
    }

    @GetMapping("/my-items")
    public String myItems(@RequestParam String status, Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        Optional<User> userOpt = userService.findByEmail(auth.getName());
        
        if (userOpt.isPresent()) {
            User user = userOpt.get();
            model.addAttribute("loggedInUser", user);
            List<Item> items = itemRepository.findByUser(user).stream()
                    .filter(i -> status.equals(i.getStatus()))
                    .collect(Collectors.toList());
            model.addAttribute("items", items);
            model.addAttribute("statusType", status);
        }
        return "my_items";
    }

    @GetMapping("/my-claims")
    public String myClaims(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        Optional<User> userOpt = userService.findByEmail(auth.getName());
        
        if (userOpt.isPresent()) {
            User user = userOpt.get();
            model.addAttribute("loggedInUser", user);
            List<Claim> claims = claimService.getClaimsByUser(user);
            model.addAttribute("claims", claims);
            
            // Fetch items reported as LOST by the user directly from repository
            List<Item> myLostItems = itemRepository.findByUserAndStatus(user, "LOST");
            model.addAttribute("myLostItems", myLostItems);
            
            model.addAttribute("pendingCount", claims.stream().filter(c -> "PENDING".equalsIgnoreCase(c.getStatus())).count());
            model.addAttribute("approvedCount", claims.stream().filter(c -> "APPROVED".equalsIgnoreCase(c.getStatus())).count());
            model.addAttribute("rejectedCount", claims.stream().filter(c -> "REJECTED".equalsIgnoreCase(c.getStatus())).count());
        }	
        return "my_claims";
    }

    @GetMapping("/profile")
    public String profile(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        Optional<User> userOpt = userService.findByEmail(auth.getName());
        userOpt.ifPresent(u -> model.addAttribute("loggedInUser", u));
        return "profile";
    }

    @PostMapping("/profile/update")
    public String updateProfile(@ModelAttribute User user, Authentication authentication) {
        Optional<User> existingUserOpt = userService.findByEmail(authentication.getName());
        if (existingUserOpt.isPresent()) {
            User existingUser = existingUserOpt.get();
            existingUser.setFullName(user.getFullName());
            userService.updateUser(existingUser);
        }
        return "redirect:/profile?success=Profile updated successfully";
    }
}
