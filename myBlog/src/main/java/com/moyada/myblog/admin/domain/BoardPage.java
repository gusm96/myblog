package com.moyada.myblog.admin.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
public class BoardPage {
	private Criteria cri;
	private List<Board> board;
}
