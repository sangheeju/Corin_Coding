package kr.co.dal.Board;

import java.util.List;

public interface BoardService {

	//전체 보기
	public List<BoardDTO> boardList();	
	
	//조회수 증가
	public int readCnt(int bno);
	//상세보기
	public BoardDTO detail(int bno);
	
	
}
