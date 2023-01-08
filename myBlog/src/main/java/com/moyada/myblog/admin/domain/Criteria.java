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
	private int totalPage; // 총 페이지 수
	private int[] pageNum; // 시작 페이지
	private int boardType;
	private int viewCnt = 15; // 페이지 당 표시할 게시글의 수
	private int viewPageCnt = 5; // 표시할 페이지의 수

	public Criteria(int page, int totalBoardCnt, int boardType) {
		this.startNum = calcStartNum(page);
		this.totalPage = (int) Math.ceil((double) totalBoardCnt / (double) this.viewCnt);
		this.pageNum = calcPageNum(page, this.totalPage);
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

	public int[] calcPageNum(int page, int totalPage) {
		int[] pageNum = null;
		int n = page;

		if (totalPage < 5) {
			pageNum = new int[totalPage];
			for (int i = 0; i < pageNum.length; i++) {
				pageNum[i] = i + 1;
			}
		} else if (totalPage >= 5) { // 총 페이지 수가 5보다 크거나 같을 때
			pageNum = new int[this.viewPageCnt];
			if (page > 3) {
				for (int i = 0; i < pageNum.length; i++) {
					if (i < 2) {
						pageNum[i] = (n + i + 1) - 3;
					} else if (i > 2) {
						pageNum[i] = n += 1;
					} else {
						pageNum[i] = n;
					}
				}
			} else {
				for (int i = 0; i < pageNum.length; i++) {
					pageNum[i] = i + 1;
				}
			}
		}

		return pageNum;
	}
}