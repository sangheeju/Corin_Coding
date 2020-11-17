package kr.co.korogom.mapper;

import java.util.List;
import java.util.Map;

import kr.co.korogom.domain.MemberDAO;
import kr.co.korogom.domain.PetDAO;

public interface MemberMapper {

	public int mregister(MemberDAO memberDAO);				//회원가입
	public int midCheck(MemberDAO memberDAO);				//아이디 중복 체크
	public int mnickCheck(MemberDAO memberDAO);				//별명 중복체크
	public String find_userid(Map<String, Object> user);	//아이디 찾기
	public String find_password(Map<String, Object> user);	//비밀번호 찾기
	public MemberDAO login(Map<String, Object> map);		//로그인

	public List<MemberDAO> memberPage();				//회원정보 페이지 출력
	public MemberDAO myPage(int mno);					//개인정보 페이지 출력
	public int memberUpdate(MemberDAO memberDAO);		//회원 정보 수정
	public int memberDelete(int mno);					//회원 정보 삭제
	
	public int pregister(PetDAO petDAO);				//반려동물 등록
	public int petCnt(int pno);							//반려동물 보유 수 확인
	public List<PetDAO> petInfo();						//반려동물 리스트 페이지 출력
	public List<PetDAO> petRef(int mno);				//회원당 반려동물 정보 확인
	public PetDAO petPage(int pno);						//반려동물 페이지 출력	
	public int petUpdate(PetDAO petDAO);				//반려동물 정보 수정
	public int petDelete(int pno);						//반려동물 정보 삭제

	
}
