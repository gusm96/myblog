package com.moyada.myblog.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.moyada.myblog.domain.AdminDTO;
import com.moyada.myblog.exception.LoginInvalidException;
import com.moyada.myblog.service.AdminService;


@Controller
public class AdminLoginController {
	@Autowired
	AdminService service;

	@GetMapping("/login/admin")
	public String getAdminLogin(HttpSession session) {
		if (session.getAttribute("admin") != null) {
			return "admin/adminPage";
		}
		return "admin/adminLogin";
	}

	@PostMapping("/login/admin")
	public String postAdminLogin(AdminDTO loginData, HttpSession session)throws LoginInvalidException {
		return service.adminLogin(loginData, session);
	}
	@ExceptionHandler(LoginInvalidException.class)
	public String loginFail(LoginInvalidException e) {
		return "error/loginFail";
	}
	@GetMapping("/logout/admin")
	public String adminLogout(HttpSession session) {
		session.invalidate();
		return "admin/adminLogout";
	}
}
