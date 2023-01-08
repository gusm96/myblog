package com.moyada.myblog.admin.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moyada.myblog.admin.dao.BoardDao;
import com.moyada.myblog.admin.domain.Board;
import com.moyada.myblog.admin.domain.BoardPage;
import com.moyada.myblog.admin.domain.Criteria;

@Service
public class BoardService {

	private BoardDao dao;

	@Autowired
	private SqlSessionTemplate template;

	public BoardPage getBoardList(String type, int nowPage) {
		BoardPage bp = null;
		String[] boardType = { "java", "js", "sql" };
		int boardTypeNum = 0;
		for (int i = 0; i < boardType.length; i++) {
			if (boardType[i].equals(type)) {
				boardTypeNum = i + 1;
			}
		}
		List<Board> boards = null;
		Criteria cri = null;
		dao = template.getMapper(BoardDao.class);
		// board_type에 해당하는 총 게시글의 수
		int totalCount = dao.countBoard(boardTypeNum);
		cri = new Criteria(nowPage, totalCount , boardTypeNum);
		boards = dao.selectBoard(cri);
		bp = new BoardPage(cri, boards);
		return bp;
	}

	public int uploadBoard(Board board) {
		int result = 0;
		dao = template.getMapper(BoardDao.class);
		result = dao.uploadBoard(board);
		return result;
	}
}
