package com.springSecurtiy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AppController {
	
	@GetMapping("/")
	public String homePage() {
		return "home";
	}
	
	@GetMapping("/leaders")
	public String toLeadersPage() {
		return "leaders";
	}
	
	@GetMapping("/systems")
	public String toAdminPage() {
		return "admins";
	}
}
