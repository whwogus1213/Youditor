package com.good.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.good.dao.VideoBoardDAO;
import com.good.dto.VideoBoardVO;

@Service
public class VideoBoardServiceImpl implements VideoBoardService {

	// 주입
	@Inject
	VideoBoardDAO videoBoardDAO;

	// 게시물 목록
	@Override
	public List<VideoBoardVO> listAll() throws Exception {
		return videoBoardDAO.listAll();
	}

	// 게시물 읽기
	@Override
	public VideoBoardVO view(int boardId) throws Exception {
		videoBoardDAO.viewCount(boardId);
		return videoBoardDAO.view(boardId);
	}

	// 글쓰기
	@Override
	public void insertVideoBoard(VideoBoardVO vo) throws Exception {
		videoBoardDAO.insertVideoBoard(vo);
	}

	// 수정
	@Override
	public void updateVideoBoard(VideoBoardVO vo) throws Exception {
		videoBoardDAO.updateVideoBoard(vo);
	}

	// 삭제
	@Override
	public void deleteVideoBoard(VideoBoardVO vo) throws Exception {
		videoBoardDAO.deleteVideoBoard(vo);
	}
	
	// 조회수
	@Override
	public void viewCount(int boardId) throws Exception {
		videoBoardDAO.viewCount(boardId);
	}

}
