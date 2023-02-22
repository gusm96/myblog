package com.moyada.myblog.admin.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moyada.myblog.admin.dao.BoardDao;
import com.moyada.myblog.admin.domain.BoardDTO;
import com.moyada.myblog.admin.domain.BoardListDTO;
import com.moyada.myblog.admin.domain.PaginationVO;

@Service
public class BoardService {

	private BoardDao dao;

	@Autowired
	private SqlSessionTemplate template;

	public BoardListDTO getBoardList(String type, int nowPage) {
		BoardListDTO board = new BoardListDTO();
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
		int totalBoard = dao.countBoard(boardTypeNum);
		PaginationVO pn = new PaginationVO(nowPage, totalBoard, boardTypeNum);
		board.setPage(pn);
		board.setList(dao.selectBoard(board.getPage()));
		return board;
	}

	public int uploadBoard(BoardDTO board) {
		int result = 0;
		dao = template.getMapper(BoardDao.class);
		result = dao.uploadBoard(board);
		return result;
	}

	public BoardDTO getBoardDetail(int bidx) {
		BoardDTO board = null;
		dao = template.getMapper(BoardDao.class);
		
		board = dao.getBoard(bidx);
		
		return board;
	}
}
