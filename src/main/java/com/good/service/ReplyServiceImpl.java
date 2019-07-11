package com.good.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.good.dao.ReplyDAO;
import com.good.dto.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Inject
	ReplyDAO dao;
	
	// 게시물 목록
	@Override
	public List<ReplyVO> listAll(ReplyVO vo) throws Exception {
		return dao.listAll(vo);
	}

	@Override
	public void insert(ReplyVO vo) throws Exception {
		dao.insert(vo);

	}

	@Override
	public void delete(ReplyVO vo) throws Exception {
		dao.delete(vo);
		
	}

	@Override
	public void update(ReplyVO vo) throws Exception {
		dao.update(vo);
		
	}

	@Override
	public void reInsert(ReplyVO vo) throws Exception {
		dao.reInsert(vo);
	}

	@Override
	public int isReReply(ReplyVO vo) throws Exception {
		return dao.isReReply(vo);
	}

	@Override
	public List<ReplyVO> reList(ReplyVO vo) throws Exception {
		return dao.reList(vo);
	}

}
