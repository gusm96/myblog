package com.moyada.myblog.admin.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class Pagination {
	static private int PAGE_NUM = 10; // 한번에 표시할 최대 페이지 수
	static private int BOARD_NUM = 15; // 한번에 표시할 최대 게시글 수
	private int totalBoard; // 총 게시글 수
	private int totalPage; // 총 페이지 수
	private int startPage; // 시작 페이지
	private int nowPage; // 현재 페이지
	private int boardType; // 게시글 종류

	public Pagination(int nowPage, int totalBoard, int boardType) {
		this.nowPage = nowPage;
		this.totalBoard = totalBoard;
		this.boardType = boardType;
		this.totalPage = (int) Math.ceil((double) totalBoard / (double) BOARD_NUM);
		this.startPage = calStartPage(nowPage);
	}

	public int calStartPage(int nowPage) {
		this.startPage = 1;
		if (nowPage != 1) {
			for (int i = 1; i < nowPage; i++) {
				this.startPage += BOARD_NUM;
			}
		}
		return this.startPage;
	}
}
