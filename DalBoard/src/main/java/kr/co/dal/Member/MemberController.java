package kr.co.dal.Member;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="member/login", method =RequestMethod.GET)
	public String login() {
		log.info("==: 로그인 페이지로 이동 :==");
		return "member/login";
	}
	
	@RequestMapping(value="member/login", method =RequestMethod.POST)
	public String login(@RequestParam Map<String,Object>map, HttpSession session) {
		Map user = memberService.login(map);
		if (user==null) {
			log.info("==: 없는 사용자입니다 :==");
			return "redirect:login";
		} else {			
			session.setAttribute("user", user);
			log.info("==: 로그인 되었습니다 :==");
			return "/home";
		}
	}
	
	@RequestMapping(value="member/logout", method =RequestMethod.GET)
	public String logout(HttpSession session) {
		if(session != null) {
		session.invalidate();
		log.info("==: 로그아웃 되었습니다 :==");
		return "redirect:/";
		} else {
		log.info("==: 로그인 상태가 아닙니다 :==");
			return "redirect:/";
		}
	}
	
}
