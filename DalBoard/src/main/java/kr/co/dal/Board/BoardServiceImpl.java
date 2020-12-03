package kr.co.dal.Board;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDAO boardDAO;
	
	@Override
	public List<BoardDTO> boardList() {
		return boardDAO.boardList();
	}

	@Override
	public int readCnt(int bno) {
		// TODO Auto-generated method stub
		return boardDAO.readCnt(bno);
	}

	@Override
	public BoardDTO detail(int bno) {
		// TODO Auto-generated method stub
		return boardDAO.detail(bno);
	}

}
