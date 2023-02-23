package com.moyada.myblog.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.moyada.myblog.domain.BoardDTO;
import com.moyada.myblog.service.BoardService;

@Controller
@RequestMapping("/management")
public class AdminController {
	@Autowired
	BoardService service;

	@GetMapping
	public String getManagement() {
		return "admin/management";
	}

	@GetMapping("/boards/{type}")
	public String getBoardList(@PathVariable("type") String type,
			@RequestParam(value = "page", defaultValue = "1") int page, Model model) {
		model.addAttribute("board", service.getBoardList(type, page));
		return "admin/management";
	}

	@GetMapping("/board/upload")
	public String getUploadBoard() {
		return "admin/uploadBoard";
	}

	@PostMapping("/board/upload")
	public String postUploadBoard(BoardDTO board, Model model) {
		model.addAttribute("result", service.uploadBoard(board));
		return "admin/uploadBoardComplete";
	}
	
	// 게시글 수정 페이지
	@GetMapping("/board/{bidx}")
	public String getBoardEdit(@PathVariable("bidx") int bidx, Model model) {
		model.addAttribute("board", service.getBoardDetail(bidx));
		return "board/boardDetail";
	}

}