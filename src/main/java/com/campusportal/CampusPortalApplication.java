package com.campusportal;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = "com.campusportal")
public class CampusPortalApplication {

	public static void main(String[] args) {
		SpringApplication.run(CampusPortalApplication.class, args);
	}

}
