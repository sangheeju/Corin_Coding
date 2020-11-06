package kr.co.korogom.service;

import java.util.List;
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
	public MemberDAO login(Map<String,Object> map) {		//로그인
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
	public List<MemberDAO> mypage() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".mypage");
	}
//	@Override
//	public int passChk(MemberDAO memberDAO) {
//		// TODO Auto-generated method stub
//		int result = sqlSession.selectOne(namespace+".passChk", memberDAO);
//		return result;
//	}

	@Override
	public String find_userid(Map<String, Object> user) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".find_userid", user);
	}

	@Override
	public List<PetDAO> petInfo() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".petInfo");
	}

	@Override
	public int pregister(PetDAO petDAO) {
		// TODO Auto-generated method stub
		return sqlSession.insert(namespace+".pregister", petDAO);
	}
	
}
