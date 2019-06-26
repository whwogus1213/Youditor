package com.good.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.good.dao.NoticeBoardDAO;
import com.good.dto.NoticeBoardVO;

@Service
public class NoticeBoardServiceImpl implements NoticeBoardService {

	@Inject
	NoticeBoardDAO noticeBoardDAO;
	
	// 게시물 목록
	@Override
	public List<NoticeBoardVO> listAll() throws Exception {
		return noticeBoardDAO.listAll();
	}
	
	// 게시물 상세보기
	@Override
	public NoticeBoardVO view(int boardId) throws Exception {
		return noticeBoardDAO.view(boardId);
	}
	
	// 게시물 총 개수
	@Override
	public int count() throws Exception {
		return noticeBoardDAO.count();
	}
	
	// 페이징
	@Override
	public List<NoticeBoardVO> listPage(int displayPost, int postNum) throws Exception {
		return noticeBoardDAO.listPage(displayPost, postNum);
	}
	

}
