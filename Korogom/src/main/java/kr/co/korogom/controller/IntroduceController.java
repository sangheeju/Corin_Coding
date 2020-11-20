package kr.co.korogom.controller;

import java.lang.System.Logger;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.inject.Inject;

import org.apache.log4j.spi.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
@RequestMapping("/introduce/*")
@Controller
@AllArgsConstructor
public class IntroduceController {
	
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
	
	@GetMapping("/v_notice_board")
	public void list(@ModelAttribute("cri") SearchCriteria cri,Model model) {
		log.info("list : "+cri);
		model.addAttribute("list",service.noticelistSearch(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.noticelistSearchCount(cri));
		model.addAttribute("pageMaker",pageMaker);
	}
	
	@GetMapping("/v_notice_detail")
	public void notice_detail(@RequestParam("bno") int bno,@ModelAttribute("cri") SearchCriteria cri,Model model) {
		log.info("/detail or modify");
		
		model.addAttribute("board",service.get(bno));
	}

	@RequestMapping(value="intro_center", method=RequestMethod.GET)
	public String center_view() {
		log.info("==== : 센터소개 페이지로 이동합니다. : ====");
		
		return "introduce/intro_center";
	}
	
	@RequestMapping(value="intro_petsiter", method=RequestMethod.GET)
	public String petsitter_view() {
		log.info("==== : 펫시터 소개 페이지로 이동합니다. : ====");
		
		return "introduce/intro_petsiter";
	}
	@GetMapping(value = "/getAttachList",produces= MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<BoardAttachVO>> getAttachList(int bno){
		log.info("getAttachList : "+bno);
		
		return new ResponseEntity<>(service.getAttachList(bno),HttpStatus.OK);
	}
}
