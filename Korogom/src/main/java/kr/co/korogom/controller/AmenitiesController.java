package kr.co.korogom.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.scribejava.core.model.OAuth2AccessToken;

import kr.co.korogom.api.NaverloginBO;
import kr.co.korogom.domain.MemberDAO;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/amenities/*")
public class AmenitiesController {

	@RequestMapping(value="cafe_view", method=RequestMethod.GET)
	public String cafe_view() {
		log.info("==== : 카페/공원 안내 페이지로 이동합니다. : ====");
		
		return "amenities/cafe_view";
	}
	
	@RequestMapping(value="hospt_view", method=RequestMethod.GET)
	public String hospt_view() {
		log.info("==== : 병원 안내 페이지로 이동합니다. : ====");
		
		return "amenities/hospt_view";
	}
	
	@RequestMapping(value="snack_view", method=RequestMethod.GET)
	public String snack_view() {
		log.info("==== : 편의용품 안내 페이지로 이동합니다. : ====");
		
		return "amenities/snack_view";
	}
}
