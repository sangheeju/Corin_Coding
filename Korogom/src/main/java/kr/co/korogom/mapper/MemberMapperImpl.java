package kr.co.korogom.mapper;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public abstract class MemberMapperImpl implements MemberMapper{
	
	@Inject
	private SqlSession sqlSession;

	private static final String namespace = "kr.co.korogom.member";
	
	@Override
	public int GetKey(String mid, String mkey) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace+".GetKey", mkey);
	}
	
	@Override
	public int alter_mKey(String mid, String mkey) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace+".alter_mKey", mkey);
	}

}
