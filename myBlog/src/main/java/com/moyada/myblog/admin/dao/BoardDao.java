package com.moyada.myblog.admin.dao;

import java.util.List;

import com.moyada.myblog.admin.domain.BoardDTO;
import com.moyada.myblog.admin.domain.PaginationVO;

public interface BoardDao {
	public int uploadBoard(BoardDTO board);

	public int countBoard(int board_type);

	public List<BoardDTO> selectBoard(PaginationVO pn);

	public BoardDTO getBoard(int bidx);

}
