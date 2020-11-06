package kr.co.korogom.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.co.korogom.domain.Criteria;
import kr.co.korogom.domain.ReplyVO;

public interface ReplyMapper {

	public int insert(ReplyVO vo);
	public ReplyVO read(Long bno);
	public int delete(Long rno);
	public int update(ReplyVO vo);
	public List<ReplyVO> reListpaging(@Param("cri") Criteria cri,@Param("bno") Long bno);
	public int reCountByBno(Long bno);
}
