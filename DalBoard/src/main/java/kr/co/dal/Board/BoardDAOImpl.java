package kr.co.dal.Board;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Inject
	private SqlSession sqlSession;
	private static final String namespace = "kr.co.dal.Board";
	
	@Override
	public List<BoardDTO> boardList() {
		return sqlSession.selectList(namespace+".boardList");
	}

	@Override
	public int readCnt(int bno) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace+".readCnt", bno);
	}

	@Override
	public BoardDTO detail(int bno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".detail", bno);
	}

	@Override
	public int register(BoardDTO boardDTO) {
		// TODO Auto-generated method stub
		return sqlSession.insert(namespace+".register", boardDTO);
	}

	@Override
	public int update(BoardDTO boardDTO) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace+".update", boardDTO);
	}

	@Override
	public int delete(int bno) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace+".delete", bno);
	}

}
