package com.campusportal.controller;

import com.campusportal.model.ContactMessage;
import com.campusportal.repository.ContactMessageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HomeController {

    @Autowired
    private ContactMessageRepository contactMessageRepository;

    @GetMapping("/")
    public String index() {
        return "index";
    }

    @GetMapping("/privacy-policy")
    public String privacyPolicy() {
        return "privacy_policy";
    }

    @GetMapping("/terms-conditions")
    public String termsConditions() {
        return "terms_conditions";
    }

    @GetMapping("/how-it-works")
    public String howItWorks() {
        return "how_it_works";
    }

    @GetMapping("/faq")
    public String faq() {
        return "faq";
    }

    @GetMapping("/help-center")
    public String helpCenter() {
        return "help_center";
    }

    @GetMapping("/contact")
    public String contact() {
        return "contact";
    }

    @GetMapping("/about-us")
    public String aboutUs() {
        return "about_us";
    }

    @PostMapping("/contact")
    public String handleContact(@ModelAttribute ContactMessage message) {
        contactMessageRepository.save(message);
        return "redirect:/contact?success=true";
    }

    @GetMapping("/ping")
    @ResponseBody
    public String ping() {
        return "Server is UP! If you see this, the issue is ONLY with JSP resolution.";
    }
}
