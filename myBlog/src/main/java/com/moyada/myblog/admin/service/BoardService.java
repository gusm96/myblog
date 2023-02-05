package com.moyada.myblog.admin.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moyada.myblog.admin.dao.BoardDao;
import com.moyada.myblog.admin.domain.Board;
import com.moyada.myblog.admin.domain.Pagination;

@Service
public class BoardService {

	private BoardDao dao;

	@Autowired
	private SqlSessionTemplate template;

	public List<Board> getBoardList(String type, int nowPage) {
		List<Board>board = null;
		String[] boardType = { "java", "js", "sql" };
		int boardTypeNum = 0;
		// 게시글 종류 확인
		for (int i = 0; i < boardType.length; i++) {
			if (boardType[i].equals(type)) {
				boardTypeNum = i + 1;
			}
		}
		dao = template.getMapper(BoardDao.class);
		// board_type에 해당하는 총 게시글의 수
		int totalBoad = dao.countBoard(boardTypeNum);
		Pagination pn = new Pagination(nowPage , totalBoad, boardTypeNum);
		board = dao.selectBoard(pn);
		return board;
	}

	public int uploadBoard(Board board) {
		int result = 0;
		dao = template.getMapper(BoardDao.class);
		result = dao.uploadBoard(board);
		return result;
	}
}
