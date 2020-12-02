package kr.co.dal.Member;

import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class MemberSeviceImpl implements MemberService {

	@Inject
	private MemberDAO memberDAO;
	
	@Override
	public Map login(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return memberDAO.login(map);
	}

}
