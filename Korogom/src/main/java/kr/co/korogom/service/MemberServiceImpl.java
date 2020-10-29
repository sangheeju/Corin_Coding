package kr.co.korogom.service;

import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.korogom.domain.MemberDAO;
import kr.co.korogom.domain.PetDAO;
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
	public Map login(Map<String,Object> map) {		//로그인
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".login", map);
	}

	@Override
	public int midCheck(MemberDAO memberDAO) {		//아이디 중복검사
		// TODO Auto-generated method stub
		int result = sqlSession.selectOne(namespace+".midCheck", memberDAO);
		return result;
	}

	@Override
	public int mnickCheck(MemberDAO memberDAO) {	//별명 중복검사
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".mnickCheck", memberDAO);
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

	@Override
	public Map find_userid(Map<String, Object> user) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".find_userid", user);
	}

	@Override
	public String petInfo(MemberDAO memberDAO) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".petInfo", memberDAO);
	}

	@Override
	public int pregister(PetDAO petDAO) {
		// TODO Auto-generated method stub
		return sqlSession.insert(namespace+".pregister", petDAO);
	}

	@Override
	public Map find_pass(Map<String, Object> user) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".find_pass", user);
	}

	
}
