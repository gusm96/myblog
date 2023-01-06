package com.moyada.myblog.admin.domain;

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
	private int nowPage; // 현재 페이지
	private int startPage; // 시작 페이지
	private int endPage;// 끝 페이지
	private int total; // 게시글 총 갯수
	private int cntPerPage; // 페이지당 글 갯수
	private int lastPage; // 마지막 페이지
	private int start; // Query start
	private int end; // Query end
	private int cntPage = 15;

	public Criteria(int total, int nowPage, int cntPerPage) {
		setNowPage(nowPage);
		setCntPerPage(cntPerPage);
		setTotal(total);
		calcLastPage(getTotal(), getCntPerPage());
		calcStartEndPage(getNowPage(), cntPage);
		calcStartEnd(getNowPage(), getCntPerPage());
	}

	// 제일 마지막 페이지 계산
	// 게시글 총 갯수 / 페이지당 글 갯수 ex) (int) Math.ceil((double)37 / (double)15) = 3
	public void calcLastPage(int total, int cntPerPage) {
		setLastPage((int) Math.ceil((double) total / (double) cntPerPage));
	}

	// 시작, 끝 페이지 계산
	// 
	public void calcStartEndPage(int nowPage, int cntPage) {
		setEndPage(((int) Math.ceil((double) nowPage / (double) cntPage)) * cntPage);
		if(getLastPage() < getEndPage()) {
			setEndPage(getLastPage());
		}
		setStartPage(getEndPage() - cntPage + 1);
		if (getStartPage() < 1) {
			setStartPage(1);
		}
	}

	// DB query 에서 사용할 start, end값 계산
	public void calcStartEnd(int nowPage, int cntPerPage) {
		setEnd(nowPage * cntPerPage);
		setStart(getEnd() - cntPerPage + 1);
	}
}
