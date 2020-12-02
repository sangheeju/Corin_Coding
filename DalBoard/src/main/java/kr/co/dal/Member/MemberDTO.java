package kr.co.dal.Member;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class MemberDTO {

	private int mno;
	private String mid;
	private String mpass;
	private String mname;	
	private String mmail;
	private String metc;
	
}
