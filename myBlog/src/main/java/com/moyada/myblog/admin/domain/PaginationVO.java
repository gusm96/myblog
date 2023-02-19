package com.moyada.myblog.admin.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PaginationVO {
	final private int BOARD_NUM = 15; // 한번에 표시할 최대 게시글 수
	private int totalBoard; // 총 게시글 수
	private int totalPage; // 총 페이지 수
	private int boardCnt; // 페이지당 보여줄 게시글
	private int nowPage;// 현재 페이지
	private int boardType; // 게시글 종류


	public PaginationVO(int nowPage, int totalBoard, int boardType) {
		this.nowPage = nowPage;
		this.totalBoard = totalBoard;
		this.boardType = boardType;
		this.totalPage = (int) Math.ceil((double) totalBoard / (double) BOARD_NUM);
		this.boardCnt = calStartPage(nowPage);
	}

	// 해당 페이지 게시글 시작
	public int calStartPage(int nowPage) {
		this.boardCnt = 1;
		if (nowPage != 1) {
			for (int i = 1; i < nowPage; i++) {
				this.boardCnt += BOARD_NUM;
			}
		}
		return this.boardCnt;
	}
}
