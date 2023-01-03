package com.moyada.myblog.admin.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moyada.myblog.admin.dao.BoardDao;
import com.moyada.myblog.admin.domain.Board;

@Service
public class BoardService {

	private BoardDao dao;

	@Autowired
	private SqlSessionTemplate template;

	public int uploadBoard(Board board) {
		int result = 0;
		// BoardDao 로 결과 값 (작성 성공시 1, 실패시 0 + Error code)
		dao = template.getMapper(BoardDao.class);

		result = dao.uploadBoard(board);

		return result;
	}
}
