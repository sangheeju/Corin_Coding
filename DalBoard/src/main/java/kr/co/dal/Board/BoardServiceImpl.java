package kr.co.dal.Board;

import java.util.List;
import java.util.Map;

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

	@Override
	public int register(BoardDTO boardDTO) {
		// TODO Auto-generated method stub
		return boardDAO.register(boardDTO);
	}

	@Override
	public int update(BoardDTO boardDTO) {
		// TODO Auto-generated method stub
		return boardDAO.update(boardDTO);
	}

	@Override
	public int delete(int bno) {
		// TODO Auto-generated method stub
		return boardDAO.delete(bno);
	}

	@Override
	public int addreply(ReplyDTO replyDTO) {
		// TODO Auto-generated method stub
		return boardDAO.addreply(replyDTO);
	}

	@Override
	public List<ReplyDTO> listreply(int bno) {
		// TODO Auto-generated method stub
		return boardDAO.listreply(bno);
	}

	@Override
	public int editreply(ReplyDTO replyDTO) {
		// TODO Auto-generated method stub
		return boardDAO.editreply(replyDTO);
	}

	@Override
	public int delreply(int reno) {
		// TODO Auto-generated method stub
		return boardDAO.delreply(reno);
	}

}
