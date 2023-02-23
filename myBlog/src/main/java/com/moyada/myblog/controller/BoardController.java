package com.moyada.myblog.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.moyada.myblog.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired
	BoardService service;
	
	@GetMapping("{bidx}")
	public String getBoardDetail(@PathVariable("bidx") int bidx, Model model) {
		model.addAttribute("board", service.getBoardDetail(bidx));
		return "board/boardDetail";
	}
}
