package kr.co.korogom.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import kr.co.korogom.domain.MemberDAO;
import kr.co.korogom.domain.PetDAO;

public interface MemberMapper {

	public int mregister(MemberDAO memberDAO);		//회원가입
	public int midCheck(MemberDAO memberDAO);		//아이디 중복 체크
	public String find_userid(Map<String, Object> user);	//아이디 찾기
	public int mnickCheck(MemberDAO memberDAO);		//별명 중복체크
	public MemberDAO login(Map<String, Object> map);		//로그인
	public List<MemberDAO> mypage();		//회원정보 페이지 출력
	public MemberDAO mpage(int mno);		//개인정보 페이지 출력
	public List<PetDAO> petInfo();					//반려동물 리스트 페이지 출력
	public int pregister(PetDAO petDAO);		//반려동물 등록

}
