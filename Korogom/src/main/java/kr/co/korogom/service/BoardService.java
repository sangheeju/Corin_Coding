package kr.co.korogom.service;

import java.util.List;

import kr.co.korogom.domain.BoardAttachVO;
import kr.co.korogom.domain.BoardDAO;
import kr.co.korogom.domain.Criteria;
import kr.co.korogom.domain.SearchCriteria;

public interface BoardService {

	public List<BoardDAO> resvlist();
	public List<BoardDAO> resvlistPage(int page);
	public int resvcountPaging(SearchCriteria cri);
	public List<BoardDAO> resvlistSearch(SearchCriteria cri);
	public int resvlistSearchCount(SearchCriteria cri);
	public BoardDAO resvget(int bno);
	public void resvinsert(BoardDAO board);
	public boolean resvmodify(BoardDAO board);
	public boolean resvremove(int bno);
	public List<BoardAttachVO> getAttachList(int bno);
}
