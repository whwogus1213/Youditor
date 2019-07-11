package com.good.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.good.dao.NoticeBoardDAO;
import com.good.dto.NoticeBoardVO;
import com.good.dto.Pagination;
import com.good.dto.Search;

@Service
public class NoticeBoardServiceImpl implements NoticeBoardService {

	// 주입
	@Inject
	NoticeBoardDAO noticeBoardDAO;

	// 게시물 목록 + 페이징 + 검색
	@Override
	public List<NoticeBoardVO> listAll(Search search) throws Exception {
		return noticeBoardDAO.listAll(search);
	}

	// 게시물 상세보기
	@Override
	public NoticeBoardVO view(int boardId) throws Exception {
		noticeBoardDAO.viewCount(boardId);
		return noticeBoardDAO.view(boardId);
	}

	// 게시물 총 개수
	@Override
	public int getBoardListCnt(Search search) throws Exception {
		return noticeBoardDAO.getBoardListCnt(search);
	}

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
	public void deleteNoticeBoard(NoticeBoardVO vo) throws Exception {
		noticeBoardDAO.deleteNoticeBoard(vo);
	}

	// 조회수
	@Override
	public void viewCount(int boardId) throws Exception {
		noticeBoardDAO.viewCount(boardId);
	}
}
