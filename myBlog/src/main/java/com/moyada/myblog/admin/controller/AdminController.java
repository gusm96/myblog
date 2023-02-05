package com.moyada.myblog.admin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.moyada.myblog.admin.domain.Board;
import com.moyada.myblog.admin.service.BoardService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	BoardService service;

	@GetMapping
	public String getAdminPage() {
		return "admin/adminPage";
	}

	@GetMapping("/board/{type}")
	public String getBoardList(@PathVariable("type") String type, @RequestParam("page") int page, Model model) {
		model.addAttribute("board", service.getBoardList(type, page));
		model.addAttribute("boardType", type);
		return "admin/adminPage";
	}

	@GetMapping("/board/upload")
	public String getUploadBoard() {
		return "admin/uploadBoard";
	}

	@PostMapping("/board/upload")
	public String postUploadBoard(Board board, Model model) {
		model.addAttribute("result", service.uploadBoard(board));
		return "admin/uploadBoardComplete";
	}

	@GetMapping("/logout")
	public String adminLogout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}
