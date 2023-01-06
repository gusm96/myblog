package com.moyada.myblog.admin.dao;

import java.util.List;

import com.moyada.myblog.admin.domain.Board;
import com.moyada.myblog.admin.domain.Criteria;

public interface BoardDao {
	public int uploadBoard(Board board);

	public List<Board> getAllBoardList(int type);

	public int coutBoard(int board_type);

	public List<Board> selectBoard(Criteria cri, int type);

}
