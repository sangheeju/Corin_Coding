package kr.co.korogom.service;

import java.util.List;

import kr.co.korogom.domain.Criteria;
import kr.co.korogom.domain.ReplyPageDTO;
import kr.co.korogom.domain.ReplyVO;

public interface ReplyService {

	public int register(ReplyVO vo);
	public ReplyVO get(Long bno);
	public int modify(ReplyVO vo);
	public int remove(Long rno);
	public List<ReplyVO> getList(Criteria cri, Long bno);
	public ReplyPageDTO getListPage(Criteria cri, Long bno);
}
