package kr.co.korogom.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.korogom.domain.BoardAttachVO;
import kr.co.korogom.domain.BoardDAO;
import kr.co.korogom.domain.SearchCriteria;
import kr.co.korogom.domain.PageMaker;
import kr.co.korogom.service.BoardService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/community/*")
@Controller
@AllArgsConstructor
public class CommunityController {
	
	@Inject
	private BoardService service;
	
	private void deleteFiles(List<BoardAttachVO> attachList) {
		if(attachList == null || attachList.size() == 0) {
			return;
		}
		log.info("delete attach files");
		log.info(attachList);
		
		attachList.forEach(attach -> {
			try {
				Path file = Paths.get("D:\\upload\\"+attach.getUploadPath()+"\\"+attach.getUuid()+"_"+attach.getFileName());
				
				Files.deleteIfExists(file);
				
				if(Files.probeContentType(file).startsWith("image")) {
					Path thumbNail = Paths.get("D:\\upload\\"+attach.getUploadPath()+"\\s_"+attach.getUuid()+"_"+attach.getFileName());
					
					Files.delete(thumbNail);
				}
			}catch(Exception e) {
				log.error("delete file error : "+e.getMessage());
			}
		});
	}
	
	@GetMapping("/petsitter_board")
	public void petsitter_list(@ModelAttribute("cri") SearchCriteria cri,Model model) {
		log.info("list : "+cri);
		model.addAttribute("list",service.petslistSearch(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.petslistSearchCount(cri));
		model.addAttribute("pageMaker",pageMaker);
	}
	@GetMapping("/petsitter_register")
	public void petsitter_register() {
	}
	@PostMapping("/petsitter_register")
	public String petsitter_register(BoardDAO board,RedirectAttributes rttr) {
		log.info("register :" +board);
		
		if(board.getAttachList() != null) {
			board.getAttachList().forEach(attach -> log.info(attach));
		}
		service.petsinsert(board);
		rttr.addFlashAttribute("result", board.getBno());
		
		return "redirect:/community/petsitter_board";
	}
	@GetMapping({"petsitter_detail","/petsitter_modify"})
	public void petsitter_detail(@RequestParam("bno") int bno,@ModelAttribute("cri") SearchCriteria cri,Model model) {
		log.info("/detail or modify");
		
		model.addAttribute("board",service.get(bno));
	}
	@PostMapping("/petsitter_modify")
	public String petsitter_modify(BoardDAO board, SearchCriteria cri, RedirectAttributes rttr) {
		if(service.modify(board)) {
			log.info("modify success : "+board);
		}
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		rttr.addAttribute("searchType",cri.getSearchType());
		rttr.addAttribute("keyword",cri.getKeyword());
		
		return "redirect:/community/petsitter_board";
	}
	@PostMapping("/petsitter_remove")
	public String petsitter_remove(@RequestParam("bno") int bno,SearchCriteria cri, RedirectAttributes rttr) {
		List<BoardAttachVO> attachList = service.getAttachList(bno);
		if(service.remove(bno)) {
			// file delete
			deleteFiles(attachList);
			log.info("remove Success : " +bno);
			
			rttr.addAttribute("result","success");
		}
		
		return "redirect:/comunity/petsitter_board";
	}
	
//	Review Board
	@GetMapping("/review_board")
	public void review_list(@ModelAttribute("cri") SearchCriteria cri,Model model) {
		log.info("list : "+cri);
		model.addAttribute("list",service.resvlistSearch(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.resvlistSearchCount(cri));
		model.addAttribute("pageMaker",pageMaker);
	}
	@GetMapping("/review_register")
	public void resv_register() {
	}
	@PostMapping("/review_register")
	public String resv_register(BoardDAO board,RedirectAttributes rttr) {
		log.info("register :" +board);
		
		if(board.getAttachList() != null) {
			board.getAttachList().forEach(attach -> log.info(attach));
		}
		service.resvinsert(board);
		rttr.addFlashAttribute("result", board.getBno());
		
		return "redirect:/community/review_board";
	}
	@GetMapping({"review_detail","/review_modify"})
	public void resv_detail(@RequestParam("bno") int bno,@ModelAttribute("cri") SearchCriteria cri,Model model) {
		log.info("/detail or modify");
		
		model.addAttribute("board",service.get(bno));
	}
	@PostMapping("/review_modify")
	public String resv_modify(BoardDAO board, SearchCriteria cri, RedirectAttributes rttr) {
		if(service.modify(board)) {
			log.info("modify success : "+board);
		}
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		rttr.addAttribute("searchType",cri.getSearchType());
		rttr.addAttribute("keyword",cri.getKeyword());
		
		return "redirect:/community/review_board";
	}
	@PostMapping("/review_remove")
	public String review_remove(@RequestParam("bno") int bno,SearchCriteria cri, RedirectAttributes rttr) {
		List<BoardAttachVO> attachList = service.getAttachList(bno);
		if(service.remove(bno)) {
			// file delete
			deleteFiles(attachList);
			log.info("remove Success : " +bno);
			
			rttr.addAttribute("result","success");
		}
		
		return "redirect:/community/review_board";
	}
	
//	Q&A Board
	@GetMapping("/v_qna_board")
	public void qnalist(@ModelAttribute("cri") SearchCriteria cri,Model model) {
		log.info("list : "+cri);
		model.addAttribute("list",service.qnalistSearch(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.qnalistSearchCount(cri));
		model.addAttribute("pageMaker",pageMaker);
	}

	@GetMapping({"v_qna_detail"})
	public void qna_detail(@RequestParam("bno") int bno,@ModelAttribute("cri") SearchCriteria cri,Model model) {
		log.info("/detail or modify");
		
		model.addAttribute("board",service.get(bno));
	}
//	Common Element
	@GetMapping(value = "/getAttachList",produces= MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<BoardAttachVO>> getAttachList(int bno){
		log.info("getAttachList : "+bno);
		
		return new ResponseEntity<>(service.getAttachList(bno),HttpStatus.OK);
	}
}
