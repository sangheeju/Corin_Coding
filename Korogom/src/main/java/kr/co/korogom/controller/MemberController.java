package kr.co.korogom.controller;

import java.util.HashMap;
import java.util.List;
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
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.korogom.domain.MemberDAO;
import kr.co.korogom.domain.PetDAO;
import kr.co.korogom.service.MemberService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/member/*")
@Controller
@AllArgsConstructor
@Log4j
public class MemberController {
	
	@Inject
	public SqlSession sqlSession;
	
	public static final Logger logger = LoggerFactory.getLogger(MemberController.class);
		
	@Autowired 
	private MemberService memberService;
	
//	@Inject
//	BCryptPasswordEncoder pwdEncoder;
	
	
	
	@RequestMapping(value="mregister", method=RequestMethod.GET)
	public String mregister(@ModelAttribute MemberDAO memberDAO) {
		logger.info("==== : 회원가입 페이지로 이동합니다 : ====");
		return "member/mregister";
	}
		
	
	@RequestMapping(value="mregister", method=RequestMethod.POST)
	// binding한 결과가 result에 담긴다.
	public String mregister(@ModelAttribute @Valid MemberDAO memberDAO, BindingResult result) {
		// 에러가 있는지 검사
		if( result.hasErrors() ) {

			// 에러를 List로 저장
			List<ObjectError> list = result.getAllErrors();
			for( ObjectError error : list ) {
				System.out.println(error);
			}
			return "member/mregister";
		}
		memberService.mregister(memberDAO);
		return "redirect:login";
	}
	
	@ResponseBody		//아작스 통신 아이디 중복검사
	@RequestMapping(value = "midCheck", method=RequestMethod.POST)
	public int midCheck(MemberDAO memberDAO) throws Exception {
		logger.info("==== : Ajax 아이디 중복검사 : ====");
		int result = memberService.midCheck(memberDAO);
		return result;
	}	
	
	@ResponseBody		//아작스 통신 별명 중복검사
	@RequestMapping(value = "mnickCheck", method=RequestMethod.POST)
	public int mnickCheck(MemberDAO memberDAO) throws Exception {
		logger.info("==== : Ajax 별명 중복검사 : ====");
		int result = memberService.mnickCheck(memberDAO);
		return result;
	}	
	
//	@RequestMapping(value="mregister",method=RequestMethod.POST)
//	public String mregister(MemberDAO memberDAO,
//							HttpServletRequest request) throws Exception {
//		request.setCharacterEncoding("utf-8");
//	        
//			int r = memberService.midCheck(memberDAO);
//			if(r == 1) {
//				logger.info("==== : 이미 사용중인 아이디입니다 : ====");
//				return "redirect:mregister";
//			} else if (r == 0) {
//				logger.info("==== : 가입 합니다 : ====");
//				memberService.mregister(memberDAO);
//			} else {
//	            System.out.println("회원가입이 되지 않습니다. 확인 바랍니다");
//	        }
//		return "redirect:login";
//	}
	
	
	@RequestMapping(value="login", method=RequestMethod.GET)
	public String login() {
		logger.info("==== : 로그인 페이지로 이동합니다 : ====");
		return "member/login";
	}
	
	@RequestMapping(value="login", method=RequestMethod.POST)
	public String login(@RequestParam Map<String,Object> map, MemberDAO memberDAO, HttpSession session) throws Exception {
		MemberDAO user = memberService.login(map);
		logger.info("= 로그인정보 ="+map);
		if(user == null) {
			logger.info("==== : 로그인 에러 : ====");
			return "redirect:/member/login";
		} else {
			session.setAttribute("user", user);
			logger.info("= 로그인유저정보 ="+user);
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
	

//	@RequestMapping(value="mypage", method= RequestMethod.GET)
//	public String mypage(){
//		return "member/mypage";
//	}
	@RequestMapping(value="mypage", method=  {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView mypage(){
		logger.info("==== : 회원 정보 페이지로 이동합니다 : ====");
		ModelAndView mav = new ModelAndView();	
		memberService.mypage();
		
		List<MemberDAO> mylist = memberService.mypage();
		mav.addObject("mylist", mylist);
		mav.setViewName("member/mypage");

			return mav;
	}
	
	@RequestMapping(value="find_userid", method=RequestMethod.GET)
	public String find_userid() {
		logger.info("==== : 아이디 찾기 페이지로 이동합니다 : ====");
		return "member/find_userid";
	}
		
	@ResponseBody
	   @RequestMapping(value="find_userid2", method=RequestMethod.POST)
	   public String find_userid(@RequestParam Map<String, Object> user) throws Exception {
		logger.info("request Message : "+user);
//	      logger.info("String r확인용"+r);      
//	      model.addAttribute("findid", memberService.find_userid(user));
//	      logger.info("model확인용"+model); 
		 String r= memberService.find_userid(user);
		 logger.info(r);
	      return r;
	   }
	   
	
//	@RequestMapping(value="find_mpass", method=RequestMethod.GET)
//	public String find_mpass() {
//		logger.info("==== : 비번 찾기 페이지로 이동합니다 : ====");
//		return "member/find_userid";
//	}
//	
//	@ResponseBody
//	@RequestMapping(value="find_mpass", method=RequestMethod.POST)
//	public Map find_mpass(@ModelAttribute("info")MemberDAO memberDAO, HttpServletRequest request) throws Exception {
//		request.setCharacterEncoding("utf-8");
//		logger.info("==== : 비번찾는중 : ====");
//		return memberService.find_userid(memberDAO);
//	}
	
	@RequestMapping(value="petInfo", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView petInfo() {
		logger.info("==== : 반려동물 정보 페이지로 이동합니다 : ====");

		ModelAndView mandv = new ModelAndView();	
		memberService.petInfo();
		
		List<PetDAO> petList = memberService.petInfo();
		mandv.addObject("petList", petList);
		mandv.setViewName("member/petInfo");

			return mandv;
	}
	
//	@RequestMapping(value="petInfo", method=RequestMethod.POST)
//	public String petInfo(@RequestParam PetDAO petDAO, HttpServletRequest request) throws Exception {
//		request.setCharacterEncoding("utf-8");		
//			logger.info("==== : 반려동물 정보 확인 : ====");
//			return "";
//	}
	
	@RequestMapping(value="pregister", method=RequestMethod.GET)
	public String pregister(@ModelAttribute PetDAO petDAO) {
		logger.info("==== : 반려동물 등록 페이지로 이동합니다 : ====");
		
		return "member/pregister";
	}
	
	
	
	
	@RequestMapping(value="pregister", method=RequestMethod.POST)
	public String pregister(@ModelAttribute @Valid PetDAO petDAO, HttpServletRequest request, BindingResult result) throws Exception {
		
		logger.info("==petDAO확인=="+petDAO);
				
		// 에러가 있는지 검사
			if( result.hasErrors() ) {

				// 에러를 List로 저장
				List<ObjectError> list = result.getAllErrors();
				for( ObjectError error : list ) {
					System.out.println(error);
				}
				return "redirect/pregister";
			}		
			memberService.pregister(petDAO);
			logger.info("==dao=="+petDAO);
			logger.info("==== : 반려동물이 등록되었습니다 : ====");	
			return "redirect:petInfo";

	}
}
