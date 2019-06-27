package com.good.service;

import java.util.List;

import com.good.dto.NoticeBoardVO;

public interface NoticeBoardService {

	// 게시물 목록
//	public List<NoticeBoardVO> listAll() throws Exception;

	// 게시물 상세보기
	public NoticeBoardVO view(int boardId) throws Exception;
	
	// 게시물 총 갯수
	public int count() throws Exception;
	
	// 페이징
	public List<NoticeBoardVO> listPage(int displayPost, int postNum) throws Exception;

	//글 쓰기
	public void insertNoticeBoard(NoticeBoardVO vo) throws Exception;
	
	//수정
	public void updateNoticeBoard(NoticeBoardVO vo) throws Exception;
	
	//삭제
	public void deleteNoticeBoard(int boardId) throws Exception;
	
}
