package com.moyada.myblog.admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.moyada.myblog.admin.domain.Admin;
import com.moyada.myblog.admin.exception.LoginInvalidException;
import com.moyada.myblog.admin.service.AdminService;

@Controller
@RequestMapping
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
	public String postAdminLogin(Admin loginData, HttpSession session)throws LoginInvalidException {
		return service.adminLogin(loginData, session);
	}
	@ExceptionHandler(LoginInvalidException.class)
	public String loginFail(LoginInvalidException e) {
		return "error/loginFail";
	}
}
