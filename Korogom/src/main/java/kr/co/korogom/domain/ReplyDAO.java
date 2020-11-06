package kr.co.korogom.domain;

import java.util.Date;

public class ReplyDAO {

	private Integer rno;
	private Integer bno;
	private String recon;
	private String rewriter;
	private Date regdate;
	private Date updatedate;
	
	public Integer getRno() {
		return rno;
	}
	public void setRno(Integer rno) {
		this.rno = rno;
	}
	public Integer getBno() {
		return bno;
	}
	public void setBno(Integer bno) {
		this.bno = bno;
	}
	public String getRecon() {
		return recon;
	}
	public void setRecon(String recon) {
		this.recon = recon;
	}
	public String getRewriter() {
		return rewriter;
	}
	public void setRewriter(String rewriter) {
		this.rewriter = rewriter;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}
}
