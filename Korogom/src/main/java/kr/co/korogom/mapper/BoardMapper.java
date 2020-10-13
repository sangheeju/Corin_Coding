package kr.co.korogom.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import kr.co.korogom.domain.BoardDAO;

public interface BoardMapper {

//	@Select("select * from k_board where bsort = 1")
	public List<BoardDAO> resvlist();
	public void resvinsert(BoardDAO board);
	public BoardDAO resvread(int bno);
	public int resvdelete(int bno);
	public int resvupdate(BoardDAO board); 
}
