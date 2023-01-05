package com.moyada.myblog.admin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.moyada.myblog.admin.domain.Admin;
import com.moyada.myblog.admin.service.AdminService;

@Controller
@RequestMapping
public class AdminLoginController {
	@Autowired
	AdminService service;

	@GetMapping("/login/admin")
	public String getAdminLogin() {
		return "admin/adminLogin";
	}

	@PostMapping("/login/admin")
	public String postAdminLogin(Admin loginData, Model model, HttpSession session) {
		model.addAttribute("result", service.adminLogin(loginData, session));
		return "admin/adminLoginComplete";
	}
}
