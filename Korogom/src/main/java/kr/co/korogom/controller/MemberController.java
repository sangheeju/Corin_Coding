package kr.co.korogom.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.scribejava.core.model.OAuth2AccessToken;
import kr.co.korogom.api.NaverloginBO;
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
	
	
	public static final Logger logger = LoggerFactory.getLogger(MemberController.class);
		
	@Inject
	private MemberService memberService;
	
	private NaverloginBO naverLoginBO;
	
	
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
	
	@RequestMapping(value="login", method=RequestMethod.GET)
	public String login(Model model, HttpSession session) {
		if(session.getAttribute("user")!=null) {
			model.addAttribute("msg","로그인된 상태입니다.");
            model.addAttribute("url","/main");
            return "redirect";
		}
		logger.info("==== : 로그인 페이지로 이동합니다 : ====");
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
        if(session!=null) {
        	String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
            System.out.println("네이버:" + naverAuthUrl);
            model.addAttribute("url", naverAuthUrl);
        }
		return "member/login";
	}
	
	@RequestMapping(value="login", method=RequestMethod.POST)
	public String login(@RequestParam Map<String,Object> map, MemberDAO memberDAO,Model model, HttpSession session) throws Exception {
		MemberDAO user = memberService.login(map);
		logger.info("= 로그인정보 ="+map);
		if(user == null) {
			logger.info("==== : 로그인 에러 : ====");
			return "redirect:/member/login";
		} else {
			model.addAttribute("user", user);
			session.setAttribute("user", user.getMnick());
			logger.info("= 로그인유저정보 ="+user);
			logger.info("==== : 로그인 되었습니다 : ====");
			return "redirect:/main";
		}
	}
	@RequestMapping(value="naver_login", method = { RequestMethod.GET, RequestMethod.POST })
	public String naver_login(Model model,@RequestParam String code, @RequestParam String state, HttpSession session) throws Exception{
		System.out.println("Naver Login success");
        OAuth2AccessToken oauthToken;
        oauthToken = naverLoginBO.getAccessToken(session, code, state);
        //로그인 사용자 정보를 읽어온다.
        String apiResult = naverLoginBO.getUserProfile(oauthToken);
        //String형식인 apiResult를 json형태로 바꿈
        JSONParser parser = new JSONParser();
        Object obj = parser.parse(apiResult);
        JSONObject jsonObj = (JSONObject) obj;
        //3. 데이터 파싱
        //Top레벨 단계 _response 파싱
        JSONObject response_obj = (JSONObject)jsonObj.get("response");
        //response의 nickname값 파싱
        String nickname = (String)response_obj.get("nickname");
        System.out.println(nickname);
        //4.파싱 닉네임 세션으로 저장
        session.setAttribute("user",nickname); //세션 생성
        session.setAttribute("site", "naver");
        
        model.addAttribute("result", apiResult);
        return "/main";
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
		 String r= memberService.find_userid(user);
		 logger.info(r);
	      return r;
	   }
	
	
	
	@RequestMapping(value="logout",method=RequestMethod.GET)
	public String logout(HttpSession session) {
		
		if (session == null) {
			logger.info("==== : 로그인 정보가 없습니다 : ====");
			return "redirect:/main";
		} else {
			session.invalidate();
			logger.info("==== : 로그아웃 하셨습니다 : ====");
			return "redirect:/main";
		}	
	}
	

	@RequestMapping(value="memberPage", method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView memberPage(){
		logger.info("==== : 회원 정보 페이지로 이동합니다 : ====");
		ModelAndView mav = new ModelAndView();	
		memberService.memberPage();
		
		List<MemberDAO> mylist = memberService.memberPage();
		mav.addObject("mylist", mylist);
		mav.setViewName("member/memberPage");

			return mav;
	}
	
	@RequestMapping(value="myPage", method=RequestMethod.GET)
	public String myPage(@RequestParam("mno") int mno, Model model) {
		logger.info("==== : 개인정보 페이지로 이동합니다 : ====");
		MemberDAO myinfo = memberService.myPage(mno);		
		model.addAttribute("myinfo", myinfo);
		return "member/myPage";
	}
		
	@RequestMapping(value="memberUpdate",method=RequestMethod.GET)
	public String memberUpdate(@RequestParam("mno")int mno, Model model) {
		MemberDAO member = memberService.myPage(mno);
		model.addAttribute("member", member);
		logger.info("==== : 개인정보 수정 페이지로 이동합니다 : ====");
		return "member/memberUpdate";
	}

	@RequestMapping(value="memberUpdate",method=RequestMethod.POST )
	public String memberUpdate(MemberDAO memberDAO) {
		logger.info("==== : 개인정보를 수정합니다 : ====");
		int r = memberService.memberUpdate(memberDAO);
		if(r>0) {
			return "redirect:myPage?mno="+memberDAO.getMno();
		}		
		return "member/memberUpdate?mno="+memberDAO.getMno();
	}
	
	@RequestMapping(value="memberDelete", method= {RequestMethod.POST,RequestMethod.GET})
	public String memberDelete(@RequestParam("mno")int mno) {
		logger.info("==== : 요청하신 회원 정보를 삭제합니다 : ====");
		int r = memberService.memberDelete(mno);
		if(r>0) {
			return "redirect:memberPage";
		}
		logger.info("=오류발생=");
		return "redirect:memberPage?mno="+mno;
	}

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
			if (petDAO.getPhotoList() != null) {
				petDAO.getPhotoList().forEach(attach -> log.info(attach));			
			}
			memberService.pregister(petDAO);
			logger.info("==dao=="+petDAO);
			logger.info("==== : 반려동물이 등록되었습니다 : ====");	
			return "redirect:petInfo";

	}
	
	@RequestMapping(value="petInfo", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView petInfo() {
		logger.info("==== : 반려동물 리스트 페이지로 이동합니다 : ====");

		ModelAndView mandv = new ModelAndView();	
		memberService.petInfo();
		
		List<PetDAO> petList = memberService.petInfo();
		mandv.addObject("petList", petList);
		mandv.setViewName("member/petInfo");

			return mandv;
	}
	
	@RequestMapping(value="petPage", method=RequestMethod.GET)
	public String petPage(@RequestParam("pno") int pno, Model model) {
		logger.info("==== : 반려동물 정보 페이지로 이동합니다 : ====");
		
		PetDAO petdetail = memberService.petPage(pno);
		model.addAttribute("petdetail", petdetail);
		return "member/petPage";
	}

	
	@RequestMapping(value="petUpdate",method=RequestMethod.GET)
	public String petUpdate(@RequestParam("pno")int pno, Model model) {
		PetDAO pet = memberService.petPage(pno);
		model.addAttribute("pet", pet);
		logger.info("==== : 반려 동불 정보 수정 페이지로 이동합니다 : ====");
		return "member/petUpdate";
	}
	
	@RequestMapping(value="petUpdate",method=RequestMethod.POST )
	public String petUpdate(PetDAO petDAO) {
		logger.info("==== : 반려동물 정보를 수정합니다 : ====");
		int r = memberService.petUpdate(petDAO);
		if(r>0) {
			return "redirect:petPage?pno="+petDAO.getPno();
		}		
		return "member/petUpdate?pno="+petDAO.getPno();
	}
	
	
	@RequestMapping(value="petDelete", method= {RequestMethod.POST,RequestMethod.GET})
	public String petDelete(@RequestParam("pno")int pno) {
		logger.info("==== : 요청하신 반려동물 정보를 삭제합니다 : ====");
		int r = memberService.petDelete(pno);
		if(r>0) {
			return "redirect:petInfo";
		}
		logger.info("=오류발생=");
		return "redirect:petPage?pno="+pno;
	}
}	

