package com.campusportal.controller;

import com.campusportal.model.User;
import com.campusportal.model.Item;
import com.campusportal.model.Claim;
import com.campusportal.repository.UserRepository;
import com.campusportal.service.UserService;
import com.campusportal.service.ItemService;
import com.campusportal.service.ClaimService;
import com.campusportal.model.ContactMessage;
import com.campusportal.repository.ContactMessageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

@Controller
public class AdminController {

    @Autowired
    private UserService userService;

    @Autowired
    private ItemService itemService;

    @Autowired
    private ClaimService claimService;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ContactMessageRepository contactMessageRepository;

    @GetMapping("/admin/dashboard")
    public String adminDashboard(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        Optional<User> admin = userService.findByEmail(auth.getName());
        admin.ifPresent(u -> model.addAttribute("adminUser", u));
        
        List<Item> allItems = itemService.getAllItems();
        List<User> allUsers = userRepository.findAll();
        List<Claim> allClaims = claimService.getAllClaims();
        
        // Basic Stats
        model.addAttribute("totalUsers", allUsers.size());
        model.addAttribute("totalItems", allItems.size());
        model.addAttribute("pendingClaims", claimService.getPendingClaims().size());
        model.addAttribute("totalMessages", contactMessageRepository.count());
        
        // Aggregate Activities
        List<Map<String, Object>> activities = new java.util.ArrayList<>();
        
        // Add recent items
        allItems.stream().limit(5).forEach(item -> {
            Map<String, Object> activity = new java.util.HashMap<>();
            activity.put("time", item.getCreatedAt());
            activity.put("action", "New item reported - " + item.getTitle());
            activity.put("user", item.getUser() != null ? item.getUser().getEmail() : "System");
            activity.put("status", item.getStatus());
            activity.put("type", "item");
            activities.add(activity);
        });
        
        // Add recent users
        allUsers.stream().filter(u -> u.getCreatedAt() != null).limit(5).forEach(user -> {
            Map<String, Object> activity = new java.util.HashMap<>();
            activity.put("time", user.getCreatedAt());
            activity.put("action", "New user registered");
            activity.put("user", user.getEmail());
            activity.put("status", "COMPLETED");
            activity.put("type", "user");
            activities.add(activity);
        });
        
        // Add recent claims
        allClaims.stream().limit(5).forEach(claim -> {
            Map<String, Object> activity = new java.util.HashMap<>();
            activity.put("time", claim.getCreatedAt());
            activity.put("action", "New claim submitted for " + claim.getItem().getTitle());
            activity.put("user", claim.getUser().getEmail());
            activity.put("status", claim.getStatus());
            activity.put("type", "claim");
            activities.add(activity);
        });
        
        // Sort by time desc and limit to 10
        List<Map<String, Object>> sortedActivities = activities.stream()
                .sorted((a, b) -> ((java.time.LocalDateTime)b.get("time")).compareTo((java.time.LocalDateTime)a.get("time")))
                .limit(10)
                .collect(Collectors.toList());
        
        model.addAttribute("activities", sortedActivities);
        
        // Chart Data: Status Distribution
        long lostCount = allItems.stream().filter(i -> "LOST".equals(i.getStatus())).count();
        long foundCount = allItems.stream().filter(i -> "FOUND".equals(i.getStatus())).count();
        long claimedCount = allItems.stream().filter(i -> "CLAIMED".equals(i.getStatus())).count();
        
        model.addAttribute("lostCount", lostCount);
        model.addAttribute("foundCount", foundCount);
        model.addAttribute("claimedCount", claimedCount);
        
        // Chart Data: Category Breakdown
        Map<String, Long> categoryData = allItems.stream()
                .collect(Collectors.groupingBy(Item::getCategory, Collectors.counting()));
        
        model.addAttribute("categoryLabels", categoryData.keySet());
        model.addAttribute("categoryValues", categoryData.values());
        
        // Trend Data: Last 7 Days
        java.time.LocalDate today = java.time.LocalDate.now();
        java.util.List<String> trendLabels = new java.util.ArrayList<>();
        java.util.List<Long> trendValues = new java.util.ArrayList<>();
        
        for (int i = 6; i >= 0; i--) {
            java.time.LocalDate date = today.minusDays(i);
            trendLabels.add(date.format(java.time.format.DateTimeFormatter.ofPattern("MMM dd")));
            long count = allItems.stream()
                .filter(item -> item.getCreatedAt().toLocalDate().equals(date))
                .count();
            trendValues.add(count);
        }
        
        model.addAttribute("trendLabels", trendLabels);
        model.addAttribute("trendValues", trendValues);
        
        return "admin_dashboard";
    }

    @GetMapping("/admin/messages")
    public String viewMessages(Model model) {
        model.addAttribute("messages", contactMessageRepository.findAllByOrderByCreatedAtDesc());
        
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        Optional<User> admin = userService.findByEmail(auth.getName());
        admin.ifPresent(u -> model.addAttribute("adminUser", u));
        
        return "admin_messages";
    }

    @GetMapping("/admin/messages/delete/{id}")
    public String deleteMessage(@PathVariable Long id) {
        contactMessageRepository.deleteById(id);
        return "redirect:/admin/messages?success=Message deleted successfully";
    }

    @GetMapping("/admin/users")
    public String manageUsers(Model model) {
        List<User> users = userRepository.findAll();
        model.addAttribute("users", users);
        
        // Stats for cards
        long adminCount = users.stream().filter(u -> "ROLE_ADMIN".equals(u.getRole())).count();
        model.addAttribute("totalUsers", users.size());
        model.addAttribute("adminCount", adminCount);
        model.addAttribute("activeToday", users.size()); 
        
        // Chart 1: Role Distribution
        model.addAttribute("roleLabels", java.util.Arrays.asList("Students", "Administrators"));
        model.addAttribute("roleValues", java.util.Arrays.asList(users.size() - adminCount, adminCount));
        
        // Chart 2: Registration Trend (Last 7 Days)
        java.time.LocalDate today = java.time.LocalDate.now();
        java.util.List<String> userTrendLabels = new java.util.ArrayList<>();
        java.util.List<Long> userTrendValues = new java.util.ArrayList<>();
        for (int i = 6; i >= 0; i--) {
            java.time.LocalDate date = today.minusDays(i);
            userTrendLabels.add(date.format(java.time.format.DateTimeFormatter.ofPattern("MMM dd")));
            long count = users.stream()
                .filter(u -> u.getCreatedAt() != null && u.getCreatedAt().toLocalDate().equals(date))
                .count();
            userTrendValues.add(count);
        }
        model.addAttribute("userTrendLabels", userTrendLabels);
        model.addAttribute("userTrendValues", userTrendValues);
        
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        Optional<User> admin = userService.findByEmail(auth.getName());
        admin.ifPresent(u -> model.addAttribute("adminUser", u));
        
        return "admin_users";
    }

    @GetMapping("/admin/items")
    public String manageItems(@RequestParam(required = false) String status, Model model) {
        List<Item> items;
        if (status != null && !status.isEmpty()) {
            items = itemService.getItemsByStatus(status.toUpperCase());
        } else {
            items = itemService.getAllItems();
        }
        model.addAttribute("items", items);
        
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        Optional<User> admin = userService.findByEmail(auth.getName());
        admin.ifPresent(u -> model.addAttribute("adminUser", u));
        
        return "admin_items";
    }

    @GetMapping("/admin/claims")
    public String manageClaims(Model model) {
        List<Claim> claims = claimService.getAllClaims();
        model.addAttribute("claims", claims);
        
        long pending = claims.stream().filter(c -> "PENDING".equals(c.getStatus())).count();
        long approved = claims.stream().filter(c -> "APPROVED".equals(c.getStatus())).count();
        long rejected = claims.stream().filter(c -> "REJECTED".equals(c.getStatus())).count();
        
        model.addAttribute("totalClaims", claims.size());
        model.addAttribute("pendingCount", pending);
        model.addAttribute("approvedCount", approved);
        model.addAttribute("rejectedCount", rejected);
        
        // Chart 1: Claim Status Distribution
        model.addAttribute("claimStatusLabels", java.util.Arrays.asList("Pending", "Approved", "Rejected"));
        model.addAttribute("claimStatusValues", java.util.Arrays.asList(pending, approved, rejected));
        
        // Chart 2: Claim Resolution Trend
        java.time.LocalDate today = java.time.LocalDate.now();
        java.util.List<String> claimTrendLabels = new java.util.ArrayList<>();
        java.util.List<Long> claimTrendValues = new java.util.ArrayList<>();
        for (int i = 6; i >= 0; i--) {
            java.time.LocalDate date = today.minusDays(i);
            claimTrendLabels.add(date.format(java.time.format.DateTimeFormatter.ofPattern("MMM dd")));
            long count = claims.stream()
                .filter(c -> c.getCreatedAt().toLocalDate().equals(date))
                .count();
            claimTrendValues.add(count);
        }
        model.addAttribute("claimTrendLabels", claimTrendLabels);
        model.addAttribute("claimTrendValues", claimTrendValues);
        
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        Optional<User> admin = userService.findByEmail(auth.getName());
        admin.ifPresent(u -> model.addAttribute("adminUser", u));
        
        return "admin_claims";
    }

    @PostMapping("/admin/claims/process")
    public String processClaim(@RequestParam Long claimId, @RequestParam String status) {
        claimService.processClaim(claimId, status);
        return "redirect:/admin/claims?success=Claim processed successfully";
    }

    @GetMapping("/admin/users/edit/{id}")
    public String editUserForm(@PathVariable Long id, Model model) {
        userRepository.findById(id).ifPresent(user -> model.addAttribute("user", user));
        return "admin_edit_user";
    }

    @Autowired
    private org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder passwordEncoder;

    @PostMapping("/admin/users/update")
    public String updateUser(@ModelAttribute User user) {
        userRepository.findById(user.getId()).ifPresent(existingUser -> {
            existingUser.setFullName(user.getFullName());
            existingUser.setEmail(user.getEmail());
            // Encode and update the new password
            if (user.getPassword() != null && !user.getPassword().isEmpty()) {
                existingUser.setPassword(passwordEncoder.encode(user.getPassword()));
            }
            // Role is preserved as we removed it from the form
            userRepository.save(existingUser);
        });
        return "redirect:/admin/users?success=User account updated successfully";
    }

    @GetMapping("/admin/users/delete/{id}")
    public String deleteUser(@PathVariable Long id) {
        userRepository.deleteById(id);
        return "redirect:/admin/users?success=User deleted successfully";
    }

    @GetMapping("/admin/items/delete/{id}")
    public String deleteItem(@PathVariable Long id) {
        itemService.deleteItem(id);
        return "redirect:/admin/items?success=Item deleted successfully";
    }
}
