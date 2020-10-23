package kr.co.korogom.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.korogom.domain.BoardAttachVO;
import kr.co.korogom.domain.BoardDAO;
import kr.co.korogom.domain.SearchCriteria;
import kr.co.korogom.domain.PageMaker;
import kr.co.korogom.domain.ReplyVO;
import kr.co.korogom.service.BoardService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/reservation/*")
@Controller
@AllArgsConstructor
public class ReservationController {
	
	@Inject
	private BoardService service;
	
	@GetMapping("/resv_board")
	public void list(@ModelAttribute("cri") SearchCriteria cri,Model model) {
		log.info("list : "+cri);
//		model.addAttribute("list",service.resvlistPage(cri.getPage()));
		model.addAttribute("list",service.resvlistSearch(cri));
//		model.addAttribute("pageMaker",new PageDTO(cri,service.resvcountPaging(cri)));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.resvlistSearchCount(cri));
		model.addAttribute("pageMaker",pageMaker);
	}
	@GetMapping("/resv_register")
	public void resv_register() {
	}
	@PostMapping("/resv_register")
	public String resv_register(BoardDAO board,RedirectAttributes rttr) {
		log.info("register :" +board);
		
		if(board.getAttachList() != null) {
			board.getAttachList().forEach(attach -> log.info(attach));
		}
		service.resvinsert(board);
		rttr.addFlashAttribute("result", board.getBno());
		
		return "redirect:/reservation/resv_board";
	}
	@GetMapping({"resv_detail","/resv_modify"})
	public void resv_detail(@RequestParam("bno") int bno,@ModelAttribute("cri") SearchCriteria cri,Model model) {
		log.info("/detail or modify");
		
		model.addAttribute("board",service.resvget(bno));
	}
//	@GetMapping("/resv_modify")
//	public void resv_modify(@RequestParam("bno") int bno,@ModelAttribute("cri") SearchCriteria cri,Model model) {
//		model.addAttribute(service.resvget(bno));
//	}
	@PostMapping("/resv_modify")
	public String resv_modify(BoardDAO board, SearchCriteria cri, RedirectAttributes rttr) {
		if(service.resvmodify(board)) {
			log.info("modify success : "+board);
		}
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		rttr.addAttribute("searchType",cri.getSearchType());
		rttr.addAttribute("keyword",cri.getKeyword());
		
		return "redirect:/reservation/resv_board";
	}
	@PostMapping("/resv_remove")
	public String remove(@RequestParam("bno") int bno,SearchCriteria cri, RedirectAttributes rttr) {
		if(service.resvremove(bno)) {
			log.info("remove Success : " +bno);
		}
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		rttr.addAttribute("searchType",cri.getSearchType());
		rttr.addAttribute("keyword",cri.getKeyword());
		
		return "redirect:/reservation/resv_board";
	}
	@GetMapping(value = "/getAttachList",produces= MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<BoardAttachVO>> getAttachList(int bno){
		log.info("getAttachList : "+bno);
		
		return new ResponseEntity<>(service.getAttachList(bno),HttpStatus.OK);
	}
}
