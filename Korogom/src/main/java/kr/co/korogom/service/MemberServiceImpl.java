package kr.co.korogom.service;

import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import kr.co.korogom.domain.MemberDAO;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService{
		
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "kr.co.korogom.member";
			
	@Override
	public int mregister(MemberDAO memberDAO) {		//회원가입
		// TODO Auto-generated method stub
		return sqlSession.insert(namespace+".mregister", memberDAO);
	}

	@Override
	public MemberDAO MidCheck(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".MidCheck", id);
	}

	@Override
	public MemberDAO MnickCheck(String nick) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".MnickCheck", nick);
	}

	@Override
	public Map login(Map<String,Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".login", map);
	}

	@Override
	public String mypage(MemberDAO memberDAO) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".mypage", memberDAO);
	}

//	@Override
//	public int passChk(MemberDAO memberDAO) {
//		// TODO Auto-generated method stub
//		int result = sqlSession.selectOne(namespace+".passChk", memberDAO);
//		return result;
//	}
}
