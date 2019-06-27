package com.good.dao;

import java.util.List;

import com.good.dto.NoticeBoardVO;
import com.good.dto.Pagination;

public interface NoticeBoardDAO {

	// 게시물 목록
	public List<NoticeBoardVO> listAll(Pagination pagination) throws Exception;

	// 게시물 상세보기
	public NoticeBoardVO view(int boardId) throws Exception;

	// 게시물 총 개수
	public int getBoardListCnt() throws Exception;

	// 페이징
//	public List<NoticeBoardVO> listPage(int displayPost, int postNum);

	// 글 쓰기
	public void insertNoticeBoard(NoticeBoardVO vo) throws Exception;

	// 수정
	public void updateNoticeBoard(NoticeBoardVO vo) throws Exception;

	// 삭제
	public void deleteNoticeBoard(int boardId) throws Exception;

}
