package kr.co.korogom.mapper;

import java.util.Map;

import kr.co.korogom.domain.MemberDAO;

public interface MemberMapper {

	public int mregister(MemberDAO memberDAO);		//회원가입
	public MemberDAO midCheck(String id);			//아이디 중복 체크
//	public int passChk(MemberDAO memberDAO);		//패스워드 체크
	public MemberDAO mnickCheck(String nick);		//별명 중복체크
	public Map login(Map<String,Object> map);		//로그인
	public String mypage(MemberDAO memberDAO);		//마이페이지 출력
	
}
