package kr.co.korogom.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/community/*")
@Controller
public class CommunityController {

	@GetMapping("review_board")
	public void review_board() {
		
	}
}
