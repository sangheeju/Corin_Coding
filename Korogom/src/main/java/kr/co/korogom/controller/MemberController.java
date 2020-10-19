package kr.co.korogom.controller;

import java.io.UnsupportedEncodingException;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.korogom.domain.MemberDAO;
import kr.co.korogom.service.MemberService;

@RequestMapping("/member/*")
@Controller
public class MemberController {
	
	@Inject
	public SqlSession sqlSession;
	
	public static final Logger logger = LoggerFactory.getLogger(MemberController.class);
		
	@Autowired 
	private MemberService memberService;
	
//	@Inject
//	BCryptPasswordEncoder pwdEncoder;
	
	@RequestMapping(value="mregister", method=RequestMethod.GET)
	public String mregister() {
		logger.info("==== : 회원가입 페이지로 이동합니다 : ====");
		return "member/mregister";
	}
	
	@RequestMapping(value="mregister",method=RequestMethod.POST)
	public String mregister(MemberDAO memberDAO, RedirectAttributes rttr, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		int r = memberService.mregister(memberDAO);
		if(r > 0) {
			logger.info("==== : 가입 되셨습니다 : ====");
			rttr.addAttribute("msg", "회원 서비스로 이동합니다");			
		} else {
			logger.info("==== : 가입이 취소 되었습니다 : ====");
		}
		return "redirect:login";
	}
	
//	@ResponseBody		//아작스 통신
//	@RequestMapping(value = "/MidCheck", method=RequestMethod.POST)
//	public ModelAndView MidCheck(@RequestBody String paramData, MemberDAO dao) throws Exception {
//		ModelAndView mav = new ModelAndView();
//		memberService.MidCheck(paramData);
//		mav.setViewName("MidCheck");
//		return mav;
//	}
	
	
	@RequestMapping(value="login", method=RequestMethod.GET)
	public String login() {
		logger.info("==== : 로그인 페이지로 이동합니다 : ====");
		return "member/login";
	}
	
	@RequestMapping(value="login", method=RequestMethod.POST)
	public String login(@RequestParam Map<String,Object> map, HttpSession session, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map user = memberService.login(map);
		
		if(user == null) {
			logger.info("==== : 로그인 에러 : ====");
			return "redirect:/member/login";
		} else {
			session.setAttribute("user", user);
			logger.info("==== : 로그인 되었습니다 : ====");
			return "redirect:/";
		}
//		boolean pwdMatch = pwdEncoder.matches(memberDAO.getMpass(), login.getMpass());
	}
	
	@RequestMapping(value="logout",method=RequestMethod.GET)
	public String logout(HttpSession session) {
		
		if (session == null) {
			logger.info("==== : 로그인 정보가 없습니다 : ====");
			return "redirect:/";
		} else {
			session.invalidate();
			logger.info("==== : 로그아웃 하셨습니다 : ====");
			return "redirect:/";
		}	
	}
	
}
