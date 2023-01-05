package com.moyada.myblog.admin.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@ToString
public class Board {
	private int bidx;
	@Setter
	private String title;
	@Setter
	private String content;
	private String upload_date;
	@Setter
	private String edit_date;
	private int views;
	private int like;
	@Setter
	private int board_type;
}
