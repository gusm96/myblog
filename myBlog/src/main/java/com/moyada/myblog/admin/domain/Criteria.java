package com.moyada.myblog.admin.domain;

import java.util.List;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

// Board 페이징 처리를 위한  Criteria

@Getter
@Setter
@ToString
@NoArgsConstructor // 기본 생성자
public class Criteria {

	private int startNum; // 해당 페이지에 표시할 게시글의 순서?
	private int nowPage; // 현재 페이지
	private int totalPage; // 총 페이지 수
	private int totalBoardCnt; // 총 게시글 수
	private int boardType; // 게시글 종류
	private int viewCnt = 15; // 페이지 당 표시할 게시글의 수
	private int viewPageCnt = 10;// 한 화면에 보여줄 페이지 수 

	public Criteria(int page, int totalBoardCnt, int boardType) {
		this.nowPage = page;
		this.startNum = calcStartNum(page);
		this.totalBoardCnt = totalBoardCnt;
		this.totalPage = (int) Math.ceil((double) totalBoardCnt / (double) this.viewCnt);
		this.boardType = boardType;
	}

	public int calcStartNum(int page) {
		this.startNum = 1;
		if (page != 1) {
			for (int i = 1; i < page; i++) {
				this.startNum += viewCnt;
			}
		}
		return this.startNum;
	}

}