package com.good.dao;

import java.util.List;

import com.good.dto.NoticeBoardVO;

public interface NoticeBoardDAO {

	// 게시물 목록
	public List<NoticeBoardVO> listAll() throws Exception;

	// 게시물 보기
	public NoticeBoardVO view(int boardId) throws Exception;

	//글 쓰기
	public void insertNoticeBoard(NoticeBoardVO vo) throws Exception;

	//수정
	public void updateNoticeBoard(NoticeBoardVO vo) throws Exception;

	//삭제
	public void deleteNoticeBoard(int boardId) throws Exception;

}
