package com.moyada.myblog;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.moyada.myblog.service.BoardService;

@Controller
@RequestMapping("/")
public class HomeController {
	@Autowired
	BoardService boardService;

	@GetMapping
	public String home(Model model) {
		// 최근 작성된 10개의 게시글 리스트
		model.addAttribute("board", boardService.getLatestBoards());
		return "home";
	}
}
