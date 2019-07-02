package com.good.dao;

import java.util.List;

import com.good.dto.NoticeBoardVO;
import com.good.dto.Pagination;
import com.good.dto.Search;

public interface NoticeBoardDAO {

	// 게시물 목록 + 페이징 + 검색
	public List<NoticeBoardVO> listAll(Search search) throws Exception;

	// 게시물 상세보기
	public NoticeBoardVO view(int boardId) throws Exception;

	// 게시물 총 개수
	public int getBoardListCnt(Search search) throws Exception;

	// 글 쓰기
	public void insertNoticeBoard(NoticeBoardVO vo) throws Exception;

	// 수정
	public void updateNoticeBoard(NoticeBoardVO vo) throws Exception;

	// 삭제
	public void deleteNoticeBoard(NoticeBoardVO vo) throws Exception;

	//조회수
	public void viewCount(int boardId) throws Exception;
}
