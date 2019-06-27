package com.good.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.good.dao.NoticeBoardDAO;
import com.good.dto.NoticeBoardVO;
import com.good.dto.Pagination;

@Service
public class NoticeBoardServiceImpl implements NoticeBoardService {

	// 주입
	@Inject
	NoticeBoardDAO noticeBoardDAO;

	// 게시물 목록
	@Override
	public List<NoticeBoardVO> listAll(Pagination pagination) throws Exception {
		return noticeBoardDAO.listAll(pagination);
	}

	// 게시물 상세보기
	@Override
	public NoticeBoardVO view(int boardId) throws Exception {
		return noticeBoardDAO.view(boardId);
	}

	// 게시물 총 개수
	@Override
	public int getBoardListCnt() throws Exception {
		return noticeBoardDAO.getBoardListCnt();
	}

//	// 페이징
//	@Override
//	public List<NoticeBoardVO> listPage(int displayPost, int postNum) throws Exception {
//		return noticeBoardDAO.listPage(displayPost, postNum);
//	}

	// 글쓰기
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
