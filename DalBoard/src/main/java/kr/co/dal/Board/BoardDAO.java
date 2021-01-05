package kr.co.dal.Board;

import java.util.List;
import java.util.Map;

public interface BoardDAO {
	
	//전체 보기
	public List<BoardDTO> boardList();	
	
	//조회수 증가
	public int readCnt(int bno);
	//상세보기
	public BoardDTO detail(int bno);
//	public BoardDTO detail(Map<String,Object> map);
	
	//글쓰기
	public int register(BoardDTO boardDTO);
	
	//글 수정
	public int update(BoardDTO boardDTO);
	
	//글 삭제
	public int delete(int bno);
	
}
