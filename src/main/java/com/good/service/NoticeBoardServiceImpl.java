package com.good.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.good.dao.NoticeBoardDAO;
import com.good.dto.NoticeBoardVO;

@Service
public class NoticeBoardServiceImpl implements NoticeBoardService {

	// 주입
	@Inject
	NoticeBoardDAO noticeBoardDAO;

	// 게시물 목록
	@Override
	public List<NoticeBoardVO> listAll() throws Exception {
		return noticeBoardDAO.listAll();
	}

	// 게시물 읽기
	@Override
	public NoticeBoardVO view(int boardId) throws Exception {
		return noticeBoardDAO.view(boardId);
	}

	//글쓰기
	@Override
	public void insertNoticeBoard(NoticeBoardVO vo) throws Exception {
		noticeBoardDAO.insertNoticeBoard(vo);
	}

	 // 수정
	 @Override
	 public void updateNoticeBoard(NoticeBoardVO vo) throws Exception {
		 noticeBoardDAO.updateNoticeBoard(vo);
	 }

	 // 삭제
	 @Override
	 public void deleteNoticeBoard(int boardId) throws Exception {
		 noticeBoardDAO.deleteNoticeBoard(boardId);
	 }

}
