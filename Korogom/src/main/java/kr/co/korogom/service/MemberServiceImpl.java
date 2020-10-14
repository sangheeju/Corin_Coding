package kr.co.korogom.service;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import kr.co.korogom.domain.MemberDAO;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService{
		
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "kr.co.korogom";
	
	@Override
	public int mregister(MemberDAO memberDAO) {		//회원가입
		// TODO Auto-generated method stub
		return sqlSession.insert(namespace+".member.mregister", memberDAO);
	}
}
