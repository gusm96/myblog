package com.moyada.myblog.admin.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moyada.myblog.admin.dao.BoardDao;
import com.moyada.myblog.admin.domain.Board;
import com.moyada.myblog.admin.domain.Criteria;

@Service
public class BoardService {

	private BoardDao dao;

	@Autowired
	private SqlSessionTemplate template;

	public List<Board> getBoardList(int type, int nowPage, int cntPerPage) {
		List<Board> boards = null;
		Criteria cri = null;
		dao = template.getMapper(BoardDao.class);
		// board_type에 해당하는 총 게시글의 수
		int totalCount = dao.coutBoard(type);
		cri = new Criteria(totalCount, nowPage, cntPerPage);
		boards = dao.selectBoard(cri, type);
		return boards;
	}

	public int uploadBoard(Board board) {
		int result = 0;
		dao = template.getMapper(BoardDao.class);
		result = dao.uploadBoard(board);
		return result;
	}
}
