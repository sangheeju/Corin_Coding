package kr.co.dal.Member;

import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO{

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "kr.co.dal.Member";
	
	@Override
	public MemberDTO login(Map<String, Object>map) {
		return sqlSession.selectOne(namespace+".login", map);
	}

}
