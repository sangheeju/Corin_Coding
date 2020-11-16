package kr.co.korogom.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.korogom.controller.MemberController;
import kr.co.korogom.domain.MemberDAO;
import kr.co.korogom.domain.PetDAO;
import kr.co.korogom.domain.PhotoFileDAO;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@AllArgsConstructor
@Service
public class MemberServiceImpl implements MemberService{
		
	@Inject
	private SqlSession sqlSession;
	
//	@Setter(onMethod_= @Autowired)
//	@Autowired
//	private MemberMapper mapper;
	
//	@Setter(onMethod_= @Autowired)
//	@Autowired
//	private PhotoFileMapper photoMapper;
	
	public static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	private static final String namespace = "kr.co.korogom.member";
			
	@Override
	public int mregister(MemberDAO memberDAO) {		//회원가입
		// TODO Auto-generated method stub
		return sqlSession.insert(namespace+".mregister", memberDAO);
	}

	@Override
	public int midCheck(MemberDAO memberDAO) {		//아이디 중복검사
		// TODO Auto-generated method stub
		int result = sqlSession.selectOne(namespace+".midCheck", memberDAO);
		return result;
	}

	@Override
	public int mnickCheck(MemberDAO memberDAO) {	//별명 중복검사
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".mnickCheck", memberDAO);
	}
	
	@Override
	public String find_userid(Map<String, Object> user) {	//아이디 찾기
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".find_userid", user);
	}
	
	@Override						
	public String find_password(Map<String, Object> user) {		//비밀번호 찾기
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".find_password", user);
	}

	@Override
	public MemberDAO login(Map<String,Object> map) {		//로그인
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".login", map);
	}

	@Override
	public List<MemberDAO> memberPage() {					//회원정보
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".memberPage");
	}
	
	@Override
	public MemberDAO myPage(int mno) {						//개인정보
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".myPage", mno);
	}

	@Override
	public int memberUpdate(MemberDAO memberDAO) {			//회원정보 수정
		// TODO Auto-generated method stub
		return sqlSession.update(namespace+".memberUpdate", memberDAO);
	}

	@Override
	public int memberDelete(int mno) {						//회원정보 삭제
		// TODO Auto-generated method stub
		return sqlSession.update(namespace+".memberDelete", mno);
	}

	@Transactional
	@Override
	public void insertPic(PhotoFileDAO photoDAO) {
		// 반려동물 사진 등록
		sqlSession.insert(namespace+".insertPic", photoDAO);
		sqlSession.delete(namespace+".deletePic", photoDAO.getUuid());
	}

	@Override
	public void deletePic(String uuid) {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace+".deletePic", uuid);
	}

	@Override
	public PhotoFileDAO findByUuid(String uuid) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".findByUuid", uuid);
	}
	
		
//	@Transactional
	@Override
	public int pregister(PetDAO petDAO) {					//반려동물 등록
		// TODO Auto-generated method stub	
		return sqlSession.insert(namespace+".pregister", petDAO);
	}
		
	@Override
	public List<PetDAO> petInfo() {							//반려동물 리스트
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".petInfo");
	}
	
	@Override
	public PetDAO petPage(int pno) {						//반려동물 정보 페이지
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".petPage", pno);
	}
	
	@Override
	public int petUpdate(PetDAO petDAO) {					//반려동물 수정
		// TODO Auto-generated method stub
		return sqlSession.update(namespace+".petUpdate", petDAO);
	}

	@Override
	public int petDelete(int pno) {							//반려동물 삭제
		// TODO Auto-generated method stub
		return sqlSession.update(namespace+".petDelete", pno);
	}
	
}
