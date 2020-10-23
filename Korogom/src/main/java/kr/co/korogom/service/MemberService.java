package kr.co.korogom.service;

import java.util.Map;

import org.springframework.ui.Model;

import kr.co.korogom.domain.MemberDAO;

public interface MemberService {
	
	public int mregister(MemberDAO memberDAO);		//회원가입
	public int midCheck(MemberDAO memberDAO);		//아이디 중복 체크
	public MemberDAO find_userid(MemberDAO memberDAO);	//아이디 찾기
//	public int passChk(MemberDAO memberDAO);		//패스워드 체크
	public int mnickCheck(MemberDAO memberDAO);		//별명 중복체크
	public Map login(Map<String,Object> map);		//로그인
	public String mypage(MemberDAO memberDAO);		//마이페이지 출력
}
