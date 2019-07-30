package com.good.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.good.dto.AccountsVO;

@Repository
public class AlarmDAOImpl implements AlarmDAO {

	@Inject
	private SqlSession sqlSession;

	private static final String NAMESPACE = "com.good.mapper.alarmMapper";

	@Override
	public AccountsVO getAccount(int accountId) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getAccount", accountId);
	}


}
