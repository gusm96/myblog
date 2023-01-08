package com.moyada.myblog.admin.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Board {
	private int bidx;
	private String title;
	private String content;
	private String upload_date;
	private String edit_date;
	private int views;
	private int like;
	private int board_type;
}
