package kr.co.korogom.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.korogom.domain.BoardDAO;
import kr.co.korogom.mapper.BoardMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
@AllArgsConstructor
public class BoardServiceimpl implements BoardService {@Override
	public List<BoardDAO> resvlist() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BoardDAO resvget(int bno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void resvinsert(BoardDAO board) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean resvmodify(BoardDAO board) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean resvremove(int bno) {
		// TODO Auto-generated method stub
		return false;
	}

	

}
