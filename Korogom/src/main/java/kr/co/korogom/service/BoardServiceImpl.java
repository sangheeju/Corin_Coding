package kr.co.korogom.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.korogom.domain.BoardAttachVO;
import kr.co.korogom.domain.BoardDAO;
import kr.co.korogom.domain.SearchCriteria;
import kr.co.korogom.mapper.BoardAttachMapper;
import kr.co.korogom.mapper.BoardMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService{

	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private BoardAttachMapper attachMapper;
	
//	Common Element
	@Transactional
	@Override
	public boolean modify(BoardDAO board) {
		log.info("S_modify : "+board);
		attachMapper.deleteAll(board.getBno());
		log.info(mapper.update(board) == 1);
		log.info(board.getAttachList());
		boolean modifyResult = mapper.update(board) == 1;
		if(modifyResult && board.getAttachList() != null && board.getAttachList().size() > 0) {
			board.getAttachList().forEach(attach ->{
				attach.setBno(board.getBno());
				attachMapper.insert(attach);
			});
		}
		return modifyResult;
	}
	@Transactional
	@Override
	public boolean remove(int bno) {
		log.info("S_remove : "+bno);
		attachMapper.deleteAll(bno);
		return mapper.delete(bno) == 1;
	}
	@Override
	public List<BoardAttachVO> getAttachList(int bno) {
		log.info("get Attach list by bno" +bno);
		return attachMapper.findByBno(bno);
	}
	
	@Override
	public BoardDAO get(int bno) {
		mapper.hits(bno);
		return mapper.read(bno);
	}
	
//	Reservation
	@Override
	public List<BoardDAO> resvlist() {
		return mapper.resvlist();
	}
	@Override
	public List<BoardDAO> resvlistPage(int page) {
		if(page <= 0) {
			page = 1;
		}
		page = (page-1)*10;
		return mapper.resvlistPage(page);
	}
	@Override
	public int resvcountPaging(SearchCriteria cri) {
		return mapper.resvcountPaging(cri);
	}
	@Override
	public List<BoardDAO> resvlistSearch(SearchCriteria cri) {
		return mapper.resvlistSearch(cri);
	}
	@Override
	public int resvlistSearchCount(SearchCriteria cri) {
		return mapper.resvlistSearchCount(cri);
	}
	@Transactional
	@Override
	public void resvinsert(BoardDAO board) {
		log.info(board);
		mapper.insert(board);
		board.setBno(mapper.resvAttach());
		log.info("bno");
		log.info(board.getBno());
		if(board.getAttachList() == null || board.getAttachList().size() <=0) {
			return;
		}
		board.getAttachList().forEach(attach ->{
			attach.setBno(board.getBno());
			attachMapper.insert(attach);
		});
	}
	
//	Petsitter
	@Override
	public List<BoardDAO> petslist() {
		return mapper.petslist();
	}
	@Override
	public List<BoardDAO> petslistPage(int page) {
		if(page <= 0) {
			page = 1;
		}
		page = (page-1)*10;
		return mapper.petslistPage(page);
	}
	@Override
	public int petscountPaging(SearchCriteria cri) {
		return mapper.petscountPaging(cri);
	}
	@Override
	public List<BoardDAO> petslistSearch(SearchCriteria cri) {
		return mapper.petslistSearch(cri);
	}
	@Override
	public int petslistSearchCount(SearchCriteria cri) {
		return mapper.petslistSearchCount(cri);
	}
	@Transactional
	@Override
	public void petsinsert(BoardDAO board) {
		log.info(board);
		mapper.insert(board);
		board.setBno(mapper.petsAttach());
		log.info("bno");
		log.info(board.getBno());
		if(board.getAttachList() == null || board.getAttachList().size() <=0) {
			return;
		}
		board.getAttachList().forEach(attach ->{
			attach.setBno(board.getBno());
			attachMapper.insert(attach);
		});
	}
	
//	Notice
	@Override
	public List<BoardDAO> noticelist() {
		return mapper.noticelist();
	}
	@Override
	public List<BoardDAO> noticelistPage(int page) {
		if(page <= 0) {
			page = 1;
		}
		page = (page-1)*10;
		return mapper.noticelistPage(page);
	}
	@Override
	public int noticecountPaging(SearchCriteria cri) {
		return mapper.noticecountPating(cri);
	}
	@Override
	public List<BoardDAO> noticelistSearch(SearchCriteria cri) {
		return mapper.noticelistSearch(cri);
	}
	@Override
	public int noticelistSearchCount(SearchCriteria cri) {
		return mapper.noticelistSearchCount(cri);
	}
	@Override
	public void noticeinsert(BoardDAO board) {
		log.info(board);
		mapper.insert(board);
		board.setBno(mapper.noticeAttach());
		log.info("bno");
		log.info(board.getBno());
		if(board.getAttachList() == null || board.getAttachList().size() <=0) {
			return;
		}
		board.getAttachList().forEach(attach ->{
			attach.setBno(board.getBno());
			attachMapper.insert(attach);
		});
	}
	
//	Q&A
	@Override
	public List<BoardDAO> qnalist() {
		return mapper.qnalist();
	}
	@Override
	public List<BoardDAO> qnalistPage(int page) {
		if(page <= 0) {
			page = 1;
		}
		page = (page-1)*10;
		return mapper.qnalistPage(page);
	}
	@Override
	public int qnacountPaging(SearchCriteria cri) {
		return mapper.qnacountPaging(cri);
	}
	@Override
	public List<BoardDAO> qnalistSearch(SearchCriteria cri) {
		return mapper.qnalistSearch(cri);
	}
	@Override
	public int qnalistSearchCount(SearchCriteria cri) {
		return mapper.qnalistSearchCount(cri);
	}
	@Override
	public void qnainsert(BoardDAO board) {
		log.info(board);
		mapper.insert(board);
		board.setBno(mapper.qnaAttach());
		log.info("bno");
		log.info(board.getBno());
		if(board.getAttachList() == null || board.getAttachList().size() <=0) {
			return;
		}
		board.getAttachList().forEach(attach ->{
			attach.setBno(board.getBno());
			attachMapper.insert(attach);
		});
	}
	
}
