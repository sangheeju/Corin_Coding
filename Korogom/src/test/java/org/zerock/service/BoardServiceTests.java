package org.zerock.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.korogom.domain.BoardDAO;
import kr.co.korogom.service.BoardService;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardServiceTests {

	@Setter(onMethod_ = {@Autowired})
	private BoardService service;
	
//	@Test
//	public void testExist() {
//		log.info(service);
//		assertNotNull(service);
//	}
//	@Test
//	public void testRegister() {
//		BoardDAO board = new BoardDAO();
//		board.setBtitle("새로 작성하는 글");
//		board.setBcon("새로 작성하는 내용");
//		board.setBetc("user02");
//		board.setMno(0);
//		board.setBsort(1);
//		
//		service.resvinsert(board);
//		
//		log.info("생성된 게시물의 번호: "+board.getBno());
//		
//	}
//	@Test
//	public void testGetList() {
//		log.info(service.resvget(1));
//		service.getList().forEach(board -> log.info(board));
//		service.getList(new Criteria(2,10)).forEach(board -> log.info(board));
//	}
//	@Test
//	public void testGet() {
//		log.info(service.get);
//	}
//	@Test
//	public void testDelete() {
//		log.info("REMOVE RESULT: "+service.resvremove(2));
//	}
	@Test
	public void testUpdate() {
		BoardDAO board = service.resvget(4);
		if(board == null) {
			return;
		}
		board.setBetc("Test");
		log.info("MODIFY RESULT: "+service.resvmodify(board));
	}
}
