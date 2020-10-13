package kr.co.korogom.service;

import java.util.List;

import kr.co.korogom.domain.BoardDAO;

public interface BoardService {

	public List<BoardDAO> resvlist();
	public BoardDAO resvget(int bno);
	public void resvinsert(BoardDAO board);
	public boolean resvmodify(BoardDAO board);
	public boolean resvremove(int bno);
	
}
