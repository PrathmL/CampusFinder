package com.campusportal.controller;

import com.campusportal.model.User;
import com.campusportal.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Optional;

@Controller
public class RegisterController {

    private final UserService userService;

    @Autowired
    public RegisterController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/register")
    public String showRegistrationPage() {
        return "register";
    }

    @PostMapping("/register")
    public String handleUserRegistration(@ModelAttribute("user") User user, 
                                        @RequestParam("confirmPassword") String confirmPassword,
                                        Model model) {
        
        if (user.getPassword() == null || !user.getPassword().equals(confirmPassword)) {
            model.addAttribute("error", "Passwords do not match.");
            return "register";
        }

        Optional<User> existingUser = userService.findByEmail(user.getEmail());
        if (existingUser.isPresent()) {
            model.addAttribute("error", "Email already registered.");
            return "register";
        }

        user.setRole("ROLE_USER");
        userService.saveUser(user);

        return "redirect:/login?message=Registration successful! Please login.";
    }
}
