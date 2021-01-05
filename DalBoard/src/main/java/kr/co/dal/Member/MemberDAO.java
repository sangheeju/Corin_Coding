package kr.co.dal.Member;

import java.util.Map;

public interface MemberDAO {

	//회원 로그인
	public MemberDTO login(Map<String,Object>map);
		
}
