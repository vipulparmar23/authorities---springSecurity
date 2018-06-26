package com.springSecurtiy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {

	@GetMapping("/myLoginPage")
	public String myLoginPage() {
		return "login";
	}
	
	@GetMapping("/access-denied")
	public String toAccessDenied() {
		return "access-denied";
	}
}
