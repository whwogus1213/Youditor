package com.good.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.good.dto.NoticeCategoryVO;
import com.good.dto.RecruitCategoryVO;
import com.good.dto.TipCategoryVO;
import com.good.dto.VideoCategoryVO;

@Repository
public class HomeDAOImpl implements HomeDAO {
	
	@Inject
	private SqlSession session;

	private static final String NAMESPACE = "com.good.mapper.homeMapper";
	
	// 새로운 메세지 수 감지
	@Override
	public int newMessageCnt(int accountId) throws Exception {
		return session.selectOne(NAMESPACE + ".newMessageCnt", accountId);
	}
	
	// 새로운 팔로워 수 감지
	@Override
	public int newFollowerCnt(int accountId) throws Exception {
		return session.selectOne(NAMESPACE + ".newFollowerCnt", accountId);
	}

	// 공지 카테고리 가져오기
	@Override
	public List<NoticeCategoryVO> bringNoticeCategory() throws Exception {
		return session.selectList(NAMESPACE + ".bringNoticeCategory");
	}
	
	// 비디오 카테고리 가져오기
	@Override
	public List<VideoCategoryVO> bringVideoCategory() throws Exception {
		return session.selectList(NAMESPACE + ".bringVideoCategory");
	}
	
	// 팁 카테고리 가져오기
	@Override
	public List<TipCategoryVO> bringTipCategory() throws Exception {
		return session.selectList(NAMESPACE + ".bringTipCategory");
	}
	
	// 구인구직 카테고리 가져오기
	@Override
	public List<RecruitCategoryVO> bringRecruitCategory() throws Exception {
		return session.selectList(NAMESPACE + ".bringRecruitCategory");
	}
	
}
