package kr.co.korogom.mapper;

import kr.co.korogom.domain.MemberDAO;

public interface MemberMapper {

	public int mregister(MemberDAO memberDAO);		//회원가입
	public MemberDAO MidCheck(String id);			//아이디 중복 체크
	public MemberDAO MnickCheck(String nick);		//별명 중복체크
}
