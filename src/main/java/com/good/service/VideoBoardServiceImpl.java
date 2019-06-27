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
	public void deleteVideoBoard(int boardId) throws Exception {
		videoBoardDAO.deleteVideoBoard(boardId);
	}

}
