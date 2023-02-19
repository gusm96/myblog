package com.moyada.myblog.admin.domain;

import java.util.List;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class BoardListDTO {
	private List<BoardDTO> list;
	private PaginationVO page;
}
