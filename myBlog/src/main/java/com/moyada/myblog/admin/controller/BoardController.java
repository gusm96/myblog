package com.moyada.myblog.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.moyada.myblog.admin.domain.Board;
import com.moyada.myblog.admin.service.BoardService;

@Controller
@RequestMapping("/admin")
public class BoardController {
	@Autowired
	BoardService service;

	@GetMapping("/board/upload")
	public String getUploadBoard() {
		return "uploadBoard";
	}

	@PostMapping("/board/upload")
	public String postUploadBoard(Board board, Model model) {
		model.addAttribute("result", service.uploadBoard(board));
		return "uploadBoardComplete";
	}
}
