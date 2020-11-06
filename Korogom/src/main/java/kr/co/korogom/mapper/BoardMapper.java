package kr.co.korogom.mapper;

import java.util.List;


import kr.co.korogom.domain.BoardDAO;
import kr.co.korogom.domain.SearchCriteria;

public interface BoardMapper {
	
//	Common Element
	public void insert(BoardDAO board);
	public BoardDAO read(int bno);
	public int delete(int bno);
	public int update(BoardDAO board);
	public int hits(int bno);
	
//	Reservation
	public List<BoardDAO> resvlist();
	public List<BoardDAO> resvlistPage(int page);
	public int resvcountPaging(SearchCriteria cri);
	public List<BoardDAO> resvlistSearch(SearchCriteria cri);
	public int resvlistSearchCount(SearchCriteria cri);
	public int resvAttach();
	
//	Petsitter
	public List<BoardDAO> petslist();
	public List<BoardDAO> petslistPage(int page);
	public int petscountPaging(SearchCriteria cri);
	public List<BoardDAO> petslistSearch(SearchCriteria cri);
	public int petslistSearchCount(SearchCriteria cri);
	public int petsAttach();
	
//	Notice
	public List<BoardDAO> noticelist();
	public List<BoardDAO> noticelistPage(int page);
	public int noticecountPating(SearchCriteria cri);
	public List<BoardDAO> noticelistSearch(SearchCriteria cri);
	public int noticelistSearchCount(SearchCriteria cri);
	public int noticeAttach();
	
//	Q&A
	public List<BoardDAO> qnalist();
	public List<BoardDAO> qnalistPage(int page);
	public int qnacountPaging(SearchCriteria cri);
	public List<BoardDAO> qnalistSearch(SearchCriteria cri);
	public int qnalistSearchCount(SearchCriteria cri);
	public int qnaAttach();
	

}
