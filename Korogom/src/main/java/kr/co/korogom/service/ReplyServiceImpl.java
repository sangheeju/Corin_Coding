package kr.co.korogom.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.korogom.domain.Criteria;
import kr.co.korogom.domain.ReplyPageDTO;
import kr.co.korogom.domain.ReplyVO;
import kr.co.korogom.mapper.ReplyMapper;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class ReplyServiceImpl implements ReplyService{
	
	private ReplyMapper mapper;
	
	@Override
	public int register(ReplyVO vo) {
		log.info("register :"+vo);
		return mapper.insert(vo);
	}

	@Override
	public ReplyVO get(Long bno) {
		log.info("get : "+bno);
		return mapper.read(bno);
	}

	@Override
	public int modify(ReplyVO vo) {
		log.info("modify : "+vo);
		return mapper.update(vo);
	}

	@Override
	public int remove(Long rno) {
		log.info("remove : "+rno);
		return mapper.delete(rno);
	}
	@Override
	public List<ReplyVO> getList(Criteria cri, Long bno) {
		return mapper.reListpaging(cri, bno);
	}

	@Override
	public ReplyPageDTO getListPage(Criteria cri, Long bno) {
		return new ReplyPageDTO(mapper.reCountByBno(bno),mapper.reListpaging(cri, bno));
	}

}
