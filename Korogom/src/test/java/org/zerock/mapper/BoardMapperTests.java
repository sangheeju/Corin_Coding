package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.korogom.domain.BoardDAO;
import kr.co.korogom.mapper.BoardMapper;

import org.springframework.beans.factory.annotation.Autowired;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {

	@Setter(onMethod_ =@Autowired)
	private BoardMapper mapper;
	
	@Test
	public void testGetList() {
		mapper.resvlist().forEach(board -> log.info(board));
	}
//	@Test
//	public void testInsert() {
//		BoardDAO board = new BoardDAO();
//		board.setBtitle("New Title");
//		board.setBcon("New Content");
//		board.setBno(1);
//		board.setBsort(1);
//		board.setBetc("Mu");
//		
//		mapper.resvinsert(board);
//		
//		log.info(board);
//	}
//	@Test
//	public void testRead() {
//		BoardDAO board = mapper.resvread(2);
//		
//		log.info(board);
//	}
//	@Test
//	public void testDelete() {
//		log.info("DELETE COUNT: " +mapper.resvdelete());
//	}
//	@Test
//	public void testUpdate() {
//		BoardDAO board = new BoardDAO();
//		board.setBno(2);
//		board.setBtitle("수정된 제목");
//		board.setBcon("수정된 내용");
//		board.setBetc("user01");
//		
//		int count = mapper.resvupdate(board);
//		log.info("update count :" + count);
//	}
//	@Test
//	public void testPaging() {
//		Criteria cri = new Criteria();
//		List<BoardVO> list = mapper.getListWithPaging(cri);
//		list.forEach(board -> log.info(board));
//	}
//	@Test
//	public void testPaging() {
//		Criteria cri = new Criteria();
//		cri.setPageNum(2);
//		cri.setAmount(10);
//		List<BoardVO> list = mapper.getListWithPaging(cri);
//		list.forEach(board -> log.info(board.getBno()));
//	}
}
