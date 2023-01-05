package com.moyada.myblog.admin.service;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moyada.myblog.admin.dao.AdminDao;
import com.moyada.myblog.admin.domain.Admin;

@Service
public class AdminService {
	private AdminDao dao;
	@Autowired
	private SqlSessionTemplate template;

	public int adminLogin(Admin loginData, HttpSession session) {
		int result = 0;
		Admin admin = null;
		dao = template.getMapper(AdminDao.class);
		admin = dao.getAdmin(loginData.getAdmin_id());
		if (admin != null) {
			if (admin.getAdmin_pw().equals(loginData.getAdmin_pw())) {
				result = 1;
				session.setAttribute("admin", admin);
			}
		} else {
			result = 0;
		}
		return result;
	}
}
