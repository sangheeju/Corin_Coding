package kr.co.korogom.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	
	@ResponseBody		//아작스 통신
	@RequestMapping(value = "midCheck", method=RequestMethod.POST)
	public int midCheck(MemberDAO memberDAO) throws Exception {
		logger.info("==== : Ajax 아이디 중복검사 : ====");
		int result = memberService.midCheck(memberDAO);
		return result;
	}	
	
	@RequestMapping(value="mregister",method=RequestMethod.POST)
	public String mregister(@Valid MemberDAO dao, 
							MemberDAO memberDAO,
							Errors errors,
							HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		 if(errors.hasErrors()) {
	            System.out.println("에러발생");
	        
			int r = memberService.midCheck(memberDAO);
			if(r == 1) {
				logger.info("==== : 이미 사용중인 아이디입니다 : ====");
				return "redirect:mregister";
			} else if (r == 0) {
				logger.info("==== : 가입 합니다 : ====");
				memberService.mregister(memberDAO);
			}
		 } else {
	            System.out.println("회원가입성공!!");
	        }
		return "redirect:login";
	}
	
	
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
	
	@RequestMapping(value="mypage", method=RequestMethod.GET)
	public String mypage() {
		logger.info("==== : 마이 페이지로 이동합니다 : ====");
		return "member/mypage";
	}
	
	@RequestMapping(value="mypage", method=RequestMethod.POST)
	public String mypage(@RequestParam MemberDAO memberDAO, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
			
			logger.info("==== : 개인 정보 확인 : ====");
			return "";
	}

	@RequestMapping(value="find_userid", method=RequestMethod.GET)
	public String find_userid() {
		logger.info("==== : 아이디 찾기 페이지로 이동합니다 : ====");
		return "member/find_userid";
	}
	
	@ResponseBody
	@RequestMapping(value="find_userid", method=RequestMethod.POST)
	public Map find_userid(@ModelAttribute("info")MemberDAO memberDAO, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		logger.info("==== : 아이디찾는중 : ====");
		return memberService.find_userid(memberDAO);
		
	}
	
	@RequestMapping(value="find_mpass", method=RequestMethod.GET)
	public String find_mpass() {
		logger.info("==== : 아이디 찾기 페이지로 이동합니다 : ====");
		return "member/find_userid";
	}
	
	@ResponseBody
	@RequestMapping(value="find_mpass", method=RequestMethod.POST)
	public Map find_mpass(@ModelAttribute("info")MemberDAO memberDAO, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		logger.info("==== : 아이디찾는중 : ====");
		return memberService.find_userid(memberDAO);
	}
	
}
