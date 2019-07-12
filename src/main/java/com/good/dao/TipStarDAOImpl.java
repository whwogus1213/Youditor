package com.good.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.good.dto.TipStarVO;

@Repository
public class TipStarDAOImpl implements TipStarDAO {
	
	// 주입
	@Inject
	private SqlSession sqlSession;

	private static final String NAMESPACE = "com.good.mapper.tipStarMapper";
	
	@Override
	public List<TipStarVO> listAll() throws Exception {
		System.out.println("daoimpl test");
		return sqlSession.selectList(NAMESPACE + ".listAll");
	}
	
	//평점
	@Override
	public void insert(TipStarVO vo) throws Exception {
		sqlSession.insert(NAMESPACE + ".insert", vo);
	}
	
	//평점
	@Override
	public void update(TipStarVO vo) throws Exception {
		sqlSession.update(NAMESPACE + ".update", vo);
	}
	

	@Override
	public int starload(TipStarVO vo) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".starload", vo);
	}

	@Override
	public int starSum(TipStarVO vo) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".starSum", vo);
	}

	@Override
	public int starCheck(int accountId, int boardId) throws Exception {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("accountId", accountId);
		map.put("boardId", boardId);
		return sqlSession.selectOne(NAMESPACE + ".starCheck", map);
	}

}