package kr.co.korogom.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import kr.co.korogom.domain.PetDAO;

@Service
public class PetServiceImpl implements PetService {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "kr.co.korogom.member";
	
	@Override
	public List<PetDAO> petMine(int mno) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".petMine", mno);
	}


}
