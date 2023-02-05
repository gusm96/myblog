package com.moyada.myblog.admin.dao;

import java.util.List;

import com.moyada.myblog.admin.domain.Board;
import com.moyada.myblog.admin.domain.Pagination;

public interface BoardDao {
	public int uploadBoard(Board board);

	public List<Board> getAllBoardList(int type);

	public int countBoard(int board_type);

	public List<Board> selectBoard(Pagination pn);

}
