package com.good.dao;

import java.util.List;

import com.good.dto.ReplyVO;

public interface ReplyDAO {

	public List<ReplyVO> listAll(int boardId) throws Exception;
	public List<ReplyVO> reList(int replyCommentId) throws Exception;

	public void insert(ReplyVO vo) throws Exception;
	public void reInsert(ReplyVO vo) throws Exception;
	public int isReReply(ReplyVO vo) throws Exception;

	public void delete(ReplyVO vo) throws Exception;
	
	public void update(ReplyVO vo) throws Exception;
}
