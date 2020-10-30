package kr.co.korogom.service;

import java.util.Map;

import org.springframework.ui.Model;

import kr.co.korogom.domain.MemberDAO;
import kr.co.korogom.domain.PetDAO;

public interface MemberService {
	
	public int mregister(MemberDAO memberDAO);		//회원가입
	public int midCheck(MemberDAO memberDAO);		//아이디 중복 체크
	public int mnickCheck(MemberDAO memberDAO);		//별명 중복체크
	
	public Map login(Map<String,Object> map);		//로그인
	public Map find_userid(Map<String,Object> user);	//아이디 찾기
	public Map find_pass(Map<String,Object> user);		//비밀번호 찾기
	
	public String mypage(MemberDAO memberDAO);		//마이페이지 출력
	public String petInfo(MemberDAO memberDAO);		//반려동물 페이지 출력
	
	public int pregister(PetDAO petDAO);			//반려동물 등록
}
