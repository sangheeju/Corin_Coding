package kr.co.korogom.domain;

import javax.validation.constraints.Email;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

public class MemberDAO {

//	 @Pattern(regexp = "^[가-힣]{2,6}$")
//	@Pattern(regexp = "^[가-힣]+[가-힣\\s]*$")

	
	private int mno;			//회원번호 (고유)
	
//	@Pattern(regexp="^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$", message="영문 숫자 조합으로 6자리 이상 10자리 이하로 아이디를 만들어주세요.")
	@Size(min=4, message="아이디는 4자 이상 10자 이하로 생성 가능합니다.")
	private String mid;			//아이디
	@Pattern(regexp = "\\S{4,10}", message="아이디는 4~10자로 입력해주세요.")
	private String mnick;		//닉네임
	
	@Pattern(regexp="^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$", message="영문 숫자 조합으로 6자리 이상 20자리 이하로 비밀번호를 만들어주세요.")
	private String mpass;		//비밀번호
	
	@Pattern(regexp = "^[가-힣]{2,6}$", message="이름은 2~6자 이내로 입력해주세요.")
	private String mname;		//실명
	
	@Email(message="이메일 형식이 아닙니다.")
	private String mmail;		//이메일
	@Pattern(regexp = "\\d{10,11}", message="폰 번호는 숫자만 입력 해 주세요")
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
