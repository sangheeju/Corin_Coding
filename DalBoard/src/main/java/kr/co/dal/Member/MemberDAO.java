package kr.co.dal.Member;

import java.util.Map;

public interface MemberDAO {

	//회원 로그인
	public Map login(Map<String,Object>map);
		
}
