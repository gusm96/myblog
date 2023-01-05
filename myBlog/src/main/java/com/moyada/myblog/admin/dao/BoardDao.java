package com.moyada.myblog.admin.dao;

import java.util.List;

import com.moyada.myblog.admin.domain.Board;

public interface BoardDao {
	public int uploadBoard(Board board);

	public List<Board> getAllBoardList(int type);

}
