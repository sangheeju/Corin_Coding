package kr.co.korogom.domain;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Length;

import lombok.Data;

@Data
public class PetDAO {

	private int pno;
	private int mno;
	
	private int pdiv;
	
	@NotEmpty
	@Length(min=1, max=20)
	@Pattern(regexp = "^[a-zA-Z0-9가-힣]*$")		//닉네임 영수 한글 2~20자이내
	private String pname;
	
	private String pbirth;
	private int pnum;
	
	private int pdel;		//반려동물 성별 1=암컷, 2=수컷, 3=중성화 암컷, 4=중성화 수컷, 5 = 삭제
	private String petc;
	
	
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public int getPdiv() {
		return pdiv;
	}
	public void setPdiv(int pdiv) {
		this.pdiv = pdiv;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPbirth() {
		return pbirth;
	}
	public void setPbirth(String pbirth) {
		this.pbirth = pbirth;
	}
	public int getPnum() {
		return pnum;
	}
	public void setPnum(int pnum) {
		this.pnum = pnum;
	}
	public int getPdel() {
		return pdel;
	}
	public void setPdel(int pdel) {
		this.pdel = pdel;
	}
	public String getPetc() {
		return petc;
	}
	public void setPetc(String petc) {
		this.petc = petc;
	}
	@Override
	public String toString() {
		return "PetDAO [pno=" + pno + ", mno=" + mno + ", pdiv=" + pdiv + ", pname=" + pname + ", pbirth=" + pbirth
				+ ", pnum=" + pnum + ", pdel=" + pdel + ", petc=" + petc + "]";
	}
		
	
	
}
