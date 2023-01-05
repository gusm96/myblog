package com.moyada.myblog.admin.service;

import java.util.List;

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

	public List<Board> getBoardList(int type) {
		List<Board> boards = null;
		dao = template.getMapper(BoardDao.class);
		boards = dao.getAllBoardList(type);
		return boards;
	}

	public int uploadBoard(Board board) {
		int result = 0;
		dao = template.getMapper(BoardDao.class);
		result = dao.uploadBoard(board);
		return result;
	}
}
