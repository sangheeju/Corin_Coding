package kr.co.dal.Board;

import java.util.List;
import java.util.Map;

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
	
	@RequestMapping(value="board/register", method=RequestMethod.GET)
	public String register() {
		log.info("==: 글 쓰기 페이지로 이동 :==");
		return "/board/register";
	}
	
	@RequestMapping(value="board/register", method=RequestMethod.POST)
	public String register(BoardDTO boardDTO) {
		int r = boardService.register(boardDTO);
		if(r > 0) {		
			log.info("==: 글을 등록합니다 :==");
		}
		return "redirect:/board/boardList";
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
		
	@RequestMapping(value="board/update", method=RequestMethod.GET)
	public String update(@RequestParam("bno")int bno, Model model) {
		log.info("==: 글 수정 페이지로 이동 :==");
		BoardDTO boardDTO = boardService.detail(bno);
		model.addAttribute("board", boardDTO);
//		model.addAttribute("Board", boardService.update(boardDTO));
		return "/board/update";
	}
	
	@RequestMapping(value="board/update", method=RequestMethod.POST)
	public String update(BoardDTO boardDTO, Model model) {
		int r = boardService.update(boardDTO);
		if (r>0) {
			log.info("==: 글이 수정 되었습니다 :==");
			return "redirect:boardList";			
		}
		return "redirect:update";
	}
	
	@RequestMapping(value="board/delete", method= {RequestMethod.POST, RequestMethod.GET})
	public String delete(@RequestParam("bno")int bno) {
		log.info("==: 글을 삭제합니다 :==");
		int r = boardService.delete(bno);
		if (r>0) {
			return "redirect:/board/boardList";
		}
		return "redirect:/detail";
	}
}
