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
import kr.co.korogom.mapper.ReservationMapper;
import kr.co.korogom.domain.PageMaker;
import kr.co.korogom.domain.ReservationDAO;
import kr.co.korogom.service.BoardService;
import kr.co.korogom.service.ReservationService;
import kr.co.korogom.service.RoomService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/reservation/*")
@Controller
@AllArgsConstructor
public class ReservationController {
	
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
	
	@GetMapping("/resv_list")
	public void resv_list(@ModelAttribute("cri") SearchCriteria cri,Model model) {
		
		model.addAttribute("list",Rservice.resv_listPage(cri.getPage()));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(Rservice.resv_countpaging(cri));
		model.addAttribute("pageMaker",pageMaker);
	}
	@GetMapping("/resv_detail")
	public void resv_detail(@RequestParam("roomno") int roomno, Model model) {
		model.addAttribute("room",Rservice.room_read(roomno));
	}
	@GetMapping("/resv_reservation")
	public String resv_reservation(@RequestParam("roomno") int roomno, Model model,HttpSession session) {
		if(session.getAttribute("user")==null) {
			model.addAttribute("msg","로그인후 사용가능합니다..");
            model.addAttribute("url","/member/login");
            return "redirect";
		}
		model.addAttribute("room",Rservice.room_read(roomno));
		return "reservation/resv_reservation";
	}
	@PostMapping("/resv_reservation")
	public String resv_reservation2(ReservationDAO resv,RedirectAttributes rttr,Model model) {
		log.info(resv);
		resv_service.reservation_register(resv);
		model.addAttribute("msg","예약이 완료 되었습니다.");
        model.addAttribute("url","/reservation/resv_list");
        return "redirect";
	}
	@GetMapping("/reservation_check")
	public String reservation_check(Model model,HttpSession session) {
		if(session.getAttribute("user")==null) {
			model.addAttribute("msg","로그인후 사용가능합니다..");
            model.addAttribute("url","/member/login");
            return "redirect";
		}
		String mnick = (String) session.getAttribute("user");
		model.addAttribute("list", resv_service.resv_list(mnick));
		return "reservation/reservation_check";
	}
	@GetMapping(value = "/getAttachList",produces= MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<BoardAttachVO>> getAttachList(int bno){
		log.info("getAttachList : "+bno);
		
		return new ResponseEntity<>(service.getAttachList(bno),HttpStatus.OK);
	}
}
