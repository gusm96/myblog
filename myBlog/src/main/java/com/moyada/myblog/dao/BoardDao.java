package com.moyada.myblog.dao;

import java.util.List;

import com.moyada.myblog.domain.BoardDTO;
import com.moyada.myblog.domain.PaginationVO;

public interface BoardDao {
	public int uploadBoard(BoardDTO board);

	public int countBoard(int board_type);

	public List<BoardDTO> selectBoard(PaginationVO pn);

	public BoardDTO getBoard(int bidx);

	public List<BoardDTO> getLatestBoards();

}
