package kr.co.korogom.domain;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.Range;
import org.springframework.format.annotation.DateTimeFormat;

public class MemberDAO {
	
	private int mno;			//회원번호 (고유)
	
	@NotEmpty
	@Length(min=5, max=10)
	@Pattern(regexp="^[a-zA-Z0-9]*$")
	private String mid;			//아이디 5~10자 사이 영문 숫자
	
	@NotEmpty
	@Length(min=2, max=8)
	@Pattern(regexp = "^[a-zA-Z0-9가-힣]*$")
	private String mnick;		//닉네임 한영수2~8자 사이
	
	@NotEmpty
	@Length(min=5)
	@Pattern(regexp="^[0-9a-zA-Z!@#$%^&]*$")
	private String mpass;		//비밀번호 영문숫자특문 5자이상
	
	@NotEmpty
	@Length(min=2, max=6)
	@Pattern(regexp = "^[가-힣]*$")
	private String mname;		//실명 한글 2~6자
	
	@NotEmpty
	@Email
	private String mmail;		//이메일
	
	@NotEmpty
	@Length(min=11, max=12)
	@Pattern(regexp = "^[0-9]*$")
	private String mphone;			//연락처 숫자만입력
	
	
	@DateTimeFormat(pattern="yyyy/mm/dd")
	private String mbirth;		//생일 : 이벤트용
	private int mdel;			//성별: 0=기타, 1=남, 2=여
	private int mcnt;			//이용횟수 : 이벤트용
	
	@DateTimeFormat(pattern="yyyy/mm/dd")
	private String mdate;		//가입일자
	private int mpet;			//반려동물 숫자 mno가 같은 pno 카운트
	
	private int mclass;			//탈퇴 및 등급 : 0=탈퇴, 1=회원, 2=펫시터, 3=관리자
	private String metc;		//비고
	
	private String mkey;	//유저 인증키
	
	
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMnick() {
		return mnick;
	}
	public void setMnick(String mnick) {
		this.mnick = mnick;
	}
	public String getMpass() {
		return mpass;
	}
	public void setMpass(String mpass) {
		this.mpass = mpass;
	}
	public String getMmail() {
		return mmail;
	}
	public void setMmail(String mmail) {
		this.mmail = mmail;
	}
	public String getMphone() {
		return mphone;
	}
	public void setMphone(String mphone) {
		this.mphone = mphone;
	}
	public String getMbirth() {
		return mbirth;
	}
	public void setMbirth(String mbirth) {
		this.mbirth = mbirth;
	}
	public int getMdel() {
		return mdel;
	}
	public void setMdel(int mdel) {
		this.mdel = mdel;
	}
	public int getMcnt() {
		return mcnt;
	}
	public void setMcnt(int mcnt) {
		this.mcnt = mcnt;
	}
	public String getMdate() {
		return mdate;
	}
	public void setMdate(String mdate) {
		this.mdate = mdate;
	}
	public int getMpet() {
		return mpet;
	}
	public void setMpet(int mpet) {
		this.mpet = mpet;
	}
	public int getMclass() {
		return mclass;
	}
	public void setMclass(int mclass) {
		this.mclass = mclass;
	}
	public String getMetc() {
		return metc;
	}
	public void setMetc(String metc) {
		this.metc = metc;
	}
	
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	@Override
	public String toString() {
		return "MemberDAO [mno=" + mno + ", mid=" + mid + ", mnick=" + mnick + ", mpass=" + mpass + ", mname=" + mname
				+ ", mmail=" + mmail + ", mphone=" + mphone + ", mbirth=" + mbirth + ", mdel=" + mdel + ", mcnt=" + mcnt
				+ ", mdate=" + mdate + ", mpet=" + mpet + ", mclass=" + mclass + ", metc=" + metc + "]";
	}
	
	
}
