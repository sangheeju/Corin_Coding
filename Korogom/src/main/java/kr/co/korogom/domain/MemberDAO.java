package kr.co.korogom.domain;

import org.springframework.format.annotation.DateTimeFormat;

public class MemberDAO {
// @Pattern(regexp = "^[a-z | A-Z]{3,6}[0-9]{3,6}$")
//	@Pattern(regexp="^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$")
//	 @Pattern(regexp = "^(01[1|6|7|8|9|0])-(\\d{3,4})-(\\d{4})$")
//	 @Pattern(regexp = "^[가-힣]{2,6}$")
//	@Pattern(regexp = "^[가-힣]+[가-힣\\s]*$")

	
	private int mno;			//회원번호 (고유)
	private String mid;			//아이디
	private String mnick;		//닉네임
	private String mpass;		//비밀번호
	private String mname;		//실명
	private String mmail;		//이메일
	private int mphone;			//연락처
	
	@DateTimeFormat(pattern="yyyy/mm/dd")
	private String mbirth;		//생일 : 이벤트용
	private int mdel;			//성별: 0=기타, 1=남, 2=여
	private int mcnt;			//이용횟수 : 이벤트용
	
	@DateTimeFormat(pattern="yyyy/mm/dd")
	private String mdate;		//가입일자
	private int mpet;			//반려동물 숫자 mno가 같은 pno 카운트
	private int mclass;			//탈퇴 및 등급 : 0=탈퇴, 1=회원, 2=펫시터, 3=관리자
	private String metc;		//비고
	
	
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
	public int getMphone() {
		return mphone;
	}
	public void setMphone(int mphone) {
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
