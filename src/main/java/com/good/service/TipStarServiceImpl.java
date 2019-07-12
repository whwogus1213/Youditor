package com.good.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.good.dao.TipStarDAO;
import com.good.dto.TipStarVO;

@Service
public class TipStarServiceImpl implements TipStarService {

	// 주입
	@Inject
	TipStarDAO tipStarDAO;

	// 게시물 목록
	@Override
	public List<TipStarVO> listAll() throws Exception {

		System.out.println("serviceimpl test");
		return tipStarDAO.listAll();
	}
	
	//평점
	@Override
	public void update(TipStarVO vo) throws Exception {
		tipStarDAO.update(vo);
	}
	
	// 글쓰기
	@Override
	public void insert(TipStarVO vo) throws Exception {
		tipStarDAO.insert(vo);
	}

	@Override
	public int starload(TipStarVO vo) throws Exception {
		return tipStarDAO.starload(vo);
	}
	
	@Override
	public int starSum(TipStarVO vo) throws Exception {
		return tipStarDAO.starSum(vo);
	}

	@Override
	public int starCheck(int accountId, int boardId) throws Exception {
		return tipStarDAO.starCheck(accountId, boardId);
		
	}

}