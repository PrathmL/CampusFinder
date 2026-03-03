package com.campusportal.controller;

import com.campusportal.model.Claim;
import com.campusportal.model.Item;
import com.campusportal.model.User;
import com.campusportal.repository.ItemRepository;
import com.campusportal.service.ClaimService;
import com.campusportal.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@Controller
public class ClaimController {

    @Autowired
    private ClaimService claimService;

    @Autowired
    private UserService userService;

    @Autowired
    private ItemRepository itemRepository;

    @GetMapping("/claim-item/{itemId}")
    public String showClaimForm(@PathVariable Long itemId, Model model, Authentication authentication) {
        Optional<Item> itemOpt = itemRepository.findById(itemId);
        
        if (authentication != null && authentication.isAuthenticated()) {
            Optional<User> userOpt = userService.findByEmail(authentication.getName());
            userOpt.ifPresent(u -> model.addAttribute("loggedInUser", u));
        }
        
        if (itemOpt.isPresent()) {
            model.addAttribute("item", itemOpt.get());
            return "claim_item";
        }
        return "redirect:/items?error=Item not found";
    }

    @PostMapping("/claim-item")
    public String submitClaim(@RequestParam Long itemId,
                              @RequestParam String proofOfOwnership,
                              Authentication authentication) {
        
        Optional<User> userOpt = userService.findByEmail(authentication.getName());
        Optional<Item> itemOpt = itemRepository.findById(itemId);

        if (userOpt.isPresent() && itemOpt.isPresent()) {
            Claim claim = new Claim();
            claim.setUser(userOpt.get());
            claim.setItem(itemOpt.get());
            claim.setProofOfOwnership(proofOfOwnership);
            claim.setStatus("PENDING");
            
            claimService.saveClaim(claim);
            return "redirect:/dashboard?success=Claim submitted for review";
        }
        
        return "redirect:/items?error=Could not submit claim";
    }
}
