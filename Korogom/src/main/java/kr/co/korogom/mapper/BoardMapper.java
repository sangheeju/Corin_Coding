package kr.co.korogom.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import kr.co.korogom.domain.BoardDAO;
import kr.co.korogom.domain.Criteria;
import kr.co.korogom.domain.SearchCriteria;

public interface BoardMapper {

//	@Select("select * from k_board where bsort = 1")
	public List<BoardDAO> resvlist();
	public List<BoardDAO> resvlistPage(int page);
	public int resvcountPaging(SearchCriteria cri);
	public List<BoardDAO> resvlistSearch(SearchCriteria cri);
	public int resvlistSearchCount(SearchCriteria cri);
	public void resvinsert(BoardDAO board);
	public BoardDAO resvread(int bno);
	public int resvdelete(int bno);
	public int resvupdate(BoardDAO board);
	public int resvAttach();
	
}
