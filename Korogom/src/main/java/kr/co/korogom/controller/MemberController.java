package kr.co.korogom.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.korogom.domain.MemberDAO;
import kr.co.korogom.service.MemberService;

@RequestMapping("/member/*")
@Controller
public class MemberController {
	
	public static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="mregister", method=RequestMethod.GET)
	public String mregister() {
		logger.info("==== : 회원가입 페이지로 이동합니다 : ====");
		return "member/mregister";
	}
	
	@RequestMapping(value="mregister",method=RequestMethod.POST)
	public String mregister(MemberDAO memberDAO, RedirectAttributes rttr) {
		int r = memberService.mregister(memberDAO);
		
		if(r > 0) {
			rttr.addAttribute("msg", "회원 서비스로 이동합니다");			
		}
		return "redirect:home";
	}
}
