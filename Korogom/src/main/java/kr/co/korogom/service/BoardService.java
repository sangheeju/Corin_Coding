package kr.co.korogom.service;

import java.util.List;

import kr.co.korogom.domain.BoardAttachVO;
import kr.co.korogom.domain.BoardDAO;
import kr.co.korogom.domain.SearchCriteria;

public interface BoardService {

//	Common Element
	public BoardDAO get(int bno);
	public boolean modify(BoardDAO board);
	public boolean remove(int bno);
	public List<BoardAttachVO> getAttachList(int bno);
	
//	Reservation
	public List<BoardDAO> resvlist();
	public List<BoardDAO> resvlistPage(int page);
	public int resvcountPaging(SearchCriteria cri);
	public List<BoardDAO> resvlistSearch(SearchCriteria cri);
	public int resvlistSearchCount(SearchCriteria cri);
	public void resvinsert(BoardDAO board);
	
//	Petsitter
	public List<BoardDAO> petslist();
	public List<BoardDAO> petslistPage(int page);
	public int petscountPaging(SearchCriteria cri);
	public List<BoardDAO> petslistSearch(SearchCriteria cri);
	public int petslistSearchCount(SearchCriteria cri);
	public void petsinsert(BoardDAO board);
	
//	Notice
	public List<BoardDAO> noticelist();
	public List<BoardDAO> noticelistPage(int page);
	public int noticecountPaging(SearchCriteria cri);
	public List<BoardDAO> noticelistSearch(SearchCriteria cri);
	public int noticelistSearchCount(SearchCriteria cri);
	public void noticeinsert(BoardDAO board);
	
//	Q&A
	public List<BoardDAO> qnalist();
	public List<BoardDAO> qnalistPage(int page);
	public int qnacountPaging(SearchCriteria cri);
	public List<BoardDAO> qnalistSearch(SearchCriteria cri);
	public int qnalistSearchCount(SearchCriteria cri);
	public void qnainsert(BoardDAO board);
	
	
}
