package kr.co.korogom.domain;

import lombok.Data;

@Data
public class MemberDAO {
	private int mno;			//회원번호 (고유)
	private String mid;			//아이디
	private String mnick;		//닉네임
	private String mpass;		//비밀번호
	private String mmail;		//이메일
	private int mphone;			//연락처
	private String mbirth;		//생일 : 이벤트용
	private int mdel;			//성별: 0=기타, 1=남, 2=여
	private int mcnt;			//이용횟수 : 이벤트용
	private String mdate;		//가입일자
	private int mpet;			//반려동물 숫자 mno가 같은 pno 카운트
	private int mclass;			//탈퇴 및 등급 : 0=탈퇴, 1=회원, 2=펫시터, 3=관리자
	private String metc;		//비고
}
