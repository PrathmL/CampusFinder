package com.campusportal.config;

import com.campusportal.model.User;
import com.campusportal.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import java.util.Optional;

@Component
public class AdminSeeder implements CommandLineRunner {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    @Override
    @Transactional
    public void run(String... args) throws Exception {
        String adminEmail = "admin@gmail.com";
        String adminPass = "admin123";
        
        // NUCLEAR OPTION: Delete and Recreate to ensure clean state
        userRepository.findByEmail(adminEmail).ifPresent(user -> {
            userRepository.delete(user);
            userRepository.flush();
        });

        User admin = new User();
        
        admin.setFullName("System Admin");
        admin.setEmail(adminEmail);
        admin.setPassword(passwordEncoder.encode(adminPass));
        admin.setRole("ROLE_ADMIN");
        userRepository.save(admin);
        
        System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        System.out.println("!!! ADMIN USER HARD RESET SUCCESSFUL            !!!");
        System.out.println("!!! EMAIL: " + adminEmail);
        System.out.println("!!! PASS:  " + adminPass);
        System.out.println("!!! ROLE:  ROLE_ADMIN");
        System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    }
}
