package kr.co.korogom.service;

import kr.co.korogom.domain.MemberDAO;

public interface MemberService {
	
	public int mregister(MemberDAO memberDAO);		//회원가입
	public MemberDAO MidCheck(String id);			//아이디 중복 체크
	public MemberDAO MnickCheck(String nick);		//별명 중복체크
}
