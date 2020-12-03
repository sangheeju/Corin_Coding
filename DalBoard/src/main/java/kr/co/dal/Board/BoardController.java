package kr.co.dal.Board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class BoardController {

	@Autowired
	BoardService boardService;
	
	@RequestMapping(value="board/boardList", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView boardList() {
		log.info("==: 게시글 리스트로 이동 :==");
		ModelAndView mav = new ModelAndView();
		boardService.boardList();
		List<BoardDTO> list = boardService.boardList();
		mav.addObject("list", list);
		mav.setViewName("board/boardList");
		
		return mav;
	}
	
	@RequestMapping(value="board/detail", method=RequestMethod.GET)
	public String detail(@RequestParam("bno")int bno, Model model) {
		log.info("==: 글 상세 페이지로 이동 :==");
		boardService.readCnt(bno);
		BoardDTO boardDTO = boardService.detail(bno);
		model.addAttribute("board", boardDTO);
		model.addAttribute("board", boardService.detail(bno));
		
		return "/board/detail";
	}
	
	
}
