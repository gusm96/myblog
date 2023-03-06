package com.moyada.myblog.service;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moyada.myblog.dao.AdminDao;
import com.moyada.myblog.domain.AdminDTO;
import com.moyada.myblog.exception.LoginInvalidException;

@Service
public class AdminService {
	private AdminDao dao;
	@Autowired
	private SqlSessionTemplate template;

	public String adminLogin(AdminDTO loginData, HttpSession session)throws LoginInvalidException {
		String url = "";
		AdminDTO admin = null;
		dao = template.getMapper(AdminDao.class);
		admin = dao.getAdmin(loginData.getAdmin_id());
		if (admin == null) {
			throw new LoginInvalidException("아이디 또는 비밀번호가 틀립니다.");
		} else if (!loginData.getAdmin_pw().contentEquals(admin.getAdmin_pw())) {
			throw new LoginInvalidException("아이디 또는 비밀번호가 틀립니다.");
		}
		
		session.setAttribute("admin", admin);
		url = "redirect:/manage";
		
		return url;
	}
}
