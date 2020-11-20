package kr.co.korogom.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

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
import kr.co.korogom.domain.RoomDAO;
import kr.co.korogom.service.BoardService;
import kr.co.korogom.service.ReservationService;
import kr.co.korogom.service.RoomService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/admin/*")
@Controller
@AllArgsConstructor
public class AdminController {
	
	@Inject
	private BoardService service;
	@Inject
	private RoomService Rservice;
	@Inject
	private ReservationService resv_service;
	
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
//	Admin
	@GetMapping("adminpage")
	public String adminpage(Model model, HttpSession session) {
		log.info(session.getAttribute("user"));
		String user = "ADMIN";
		String user2 = (String) session.getAttribute("user");
		if(!user.equals(user2)) {
			model.addAttribute("msg","관리자 아이디가 아닙니다.");
            model.addAttribute("url","/main");
            return "redirect";
		}
		return "admin/adminpage";
	}
	
//	Q&A Board
	@GetMapping("/qna_board")
	public void qnalist(@ModelAttribute("cri") SearchCriteria cri,Model model) {
		log.info("list : "+cri);
		model.addAttribute("list",service.qnalistSearch(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.qnalistSearchCount(cri));
		model.addAttribute("pageMaker",pageMaker);
	}
	@GetMapping("/qna_register")
	public String qna_register(Model model, HttpSession session) {
		String user = "ADMIN";
		String user2 = (String) session.getAttribute("user");
		if(!user.equals(user2)) {
			model.addAttribute("msg","관리자 아이디가 아닙니다.");
            model.addAttribute("url","/main");
            return "redirect";
		}
		return "admin/qna_register";
	}
	@PostMapping("/qna_register")
	public String qna_register(BoardDAO board,RedirectAttributes rttr) {
		log.info("register :" +board);
		
		if(board.getAttachList() != null) {
			board.getAttachList().forEach(attach -> log.info(attach));
		}
		service.qnainsert(board);
		rttr.addFlashAttribute("result", board.getBno());
		
		return "redirect:/admin/qna_board";
	}
	@GetMapping({"qna_detail","/qna_modify"})
	public void qna_detail(@RequestParam("bno") int bno,@ModelAttribute("cri") SearchCriteria cri,Model model) {
		log.info("/detail or modify");
		
		model.addAttribute("board",service.get(bno));
	}
	@PostMapping("/qna_modify")
	public String qna_modify(BoardDAO board, SearchCriteria cri, RedirectAttributes rttr) {
		if(service.modify(board)) {
			log.info("modify success : "+board);
		}
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		rttr.addAttribute("searchType",cri.getSearchType());
		rttr.addAttribute("keyword",cri.getKeyword());
		
		return "redirect:/admin/qna_board";
	}
	@PostMapping("/qna_remove")
	public String remove2(@RequestParam("bno") int bno,SearchCriteria cri, RedirectAttributes rttr) {
		List<BoardAttachVO> attachList = service.getAttachList(bno);
		if(service.remove(bno)) {
			// file delete
			deleteFiles(attachList);
			log.info("remove Success : " +bno);
			
			rttr.addAttribute("result","success");
		}
		
		return "redirect:/admin/qna_board";
	}
	
//	Notice board
	@GetMapping("/notice_board")
	public void list(@ModelAttribute("cri") SearchCriteria cri,Model model) {
		log.info("list : "+cri);
		model.addAttribute("list",service.noticelistSearch(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.noticelistSearchCount(cri));
		model.addAttribute("pageMaker",pageMaker);
	}
	@GetMapping("/notice_register")
	public String register(Model model, HttpSession session) {
		String user = "ADMIN";
		String user2 = (String) session.getAttribute("user");
		if(!user.equals(user2)) {
			model.addAttribute("msg","관리자 아이디가 아닙니다.");
            model.addAttribute("url","/main");
            return "redirect";
		}
		return "admin/notice_register";
	}
	@PostMapping("/notice_register")
	public String register(BoardDAO board,RedirectAttributes rttr) {
		log.info("register :" +board);
		
		if(board.getAttachList() != null) {
			board.getAttachList().forEach(attach -> log.info(attach));
		}
		service.noticeinsert(board);
		rttr.addFlashAttribute("result", board.getBno());
		
		return "redirect:/admin/notice_board";
	}
	@GetMapping({"notice_detail","/notice_modify"})
	public void notice_detail(@RequestParam("bno") int bno,@ModelAttribute("cri") SearchCriteria cri,Model model) {
		log.info("/detail or modify");
		
		model.addAttribute("board",service.get(bno));
	}
	@PostMapping("/notice_modify")
	public String notice_modify(BoardDAO board, SearchCriteria cri, RedirectAttributes rttr) {
		if(service.modify(board)) {
			log.info("modify success : "+board);
		}
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		rttr.addAttribute("searchType",cri.getSearchType());
		rttr.addAttribute("keyword",cri.getKeyword());
		
		return "redirect:/admin/notice_board";
	}
	@PostMapping("/notice_remove")
	public String remove(@RequestParam("bno") int bno,SearchCriteria cri, RedirectAttributes rttr) {
		List<BoardAttachVO> attachList = service.getAttachList(bno);
		if(service.remove(bno)) {
			// file delete
			deleteFiles(attachList);
			log.info("remove Success : " +bno);
			
			rttr.addAttribute("result","success");
		}
		
		return "redirect:/admin/notice_board";
	}
//	Room
	@GetMapping("/room_register")
	public String room_register(Model model, HttpSession session) {
		String user = "ADMIN";
		String user2 = (String) session.getAttribute("user");
		if(!user.equals(user2)) {
			model.addAttribute("msg","관리자 아이디가 아닙니다.");
            model.addAttribute("url","/main");
            return "redirect";
		}
		return "admin/room_register";
	}
	@PostMapping("/room_register")
	public String room_register1(RoomDAO room,RedirectAttributes rttr) {
		log.info(room.getRoomno());
		if(room.getImglist() != null){
			room.getImglist().forEach(attach -> log.info(attach));
	}
		Rservice.room_register(room);
		rttr.addFlashAttribute("result",room.getRoomno());
		
		return "redirect:../reservation/resv_list";
	}
//	Reservation
	@GetMapping("/reservation_list")
	public void reservation_list(@ModelAttribute("cri") SearchCriteria cri,Model model) {
		log.info("list : "+cri);
		model.addAttribute("resv",resv_service.reservation_list());
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.petslistSearchCount(cri));
		model.addAttribute("pageMaker",pageMaker);
	}
	@ResponseBody
	@PostMapping("/deposit_check")
	public void deposit_check(int ino) {
		log.info("check:"+ino);
		resv_service.ibool_update(ino);
	}
	@ResponseBody
	@PostMapping("/deposit_cancel")
	public void deposit_cancel(int ino) {
		log.info("cancel:"+ino);
		resv_service.remove(ino);
	}
//	Common Element
	@GetMapping(value = "/getAttachList",produces= MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<BoardAttachVO>> getAttachList(int bno){
		log.info("getAttachList : "+bno);
		
		return new ResponseEntity<>(service.getAttachList(bno),HttpStatus.OK);
	}
}
