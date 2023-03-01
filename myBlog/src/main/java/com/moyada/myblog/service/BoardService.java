package com.moyada.myblog.service;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.moyada.myblog.dao.BoardDao;
import com.moyada.myblog.domain.BoardDTO;
import com.moyada.myblog.domain.BoardListDTO;
import com.moyada.myblog.domain.PaginationVO;

@Service
public class BoardService {

	private BoardDao dao;

	@Autowired
	private SqlSessionTemplate template;

	public BoardListDTO getBoardList(String type, int nowPage) {
		BoardListDTO board = new BoardListDTO();
		String[] boardType = { "java", "js", "sql" };
		int boardTypeNum = 0;
		// 게시글 종류 확인
		for (int i = 0; i < boardType.length; i++) {
			if (boardType[i].equals(type)) {
				boardTypeNum = i + 1;
			}
		}
		dao = template.getMapper(BoardDao.class);
		// board_type에 해당하는 총 게시글의 수
		int totalBoard = dao.countBoard(boardTypeNum);
		PaginationVO pn = new PaginationVO(nowPage, totalBoard, boardTypeNum);
		board.setPage(pn);
		board.setList(dao.selectBoard(board.getPage()));
		return board;
	}

	public int uploadBoard(BoardDTO board) {
		int result = 0;
		dao = template.getMapper(BoardDao.class);
		result = dao.uploadBoard(board);
		return result;
	}

	public BoardDTO getBoardDetail(int bidx) {
		BoardDTO board = null;
		dao = template.getMapper(BoardDao.class);
		board = dao.getBoard(bidx);
		return board;
	}

	public JsonObject uploadImageFile(MultipartFile multipartFile, HttpServletRequest req) throws IOException {
		JsonObject jo = new JsonObject();
		String fileRoot = "C:\\Users\\gusm9\\git\\myblog\\myBlog\\src\\main\\webapp\\resources\\images\\";
		String originalFileName = multipartFile.getOriginalFilename();
		String extesion = originalFileName.substring(originalFileName.lastIndexOf("."));
		String savedFileName = UUID.randomUUID() + extesion;
		File targetFile = new File(fileRoot + savedFileName);
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile); // 파일 저장
			jo.addProperty("url", req.getContextPath() + "/resources/images/" + savedFileName);
			jo.addProperty("fileName", savedFileName);
			jo.addProperty("responseCode", "success");
		} catch (IOException e) {
			FileUtils.deleteDirectory(targetFile); // 저장된 파일 삭제
			jo.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		return jo;
	}
}
