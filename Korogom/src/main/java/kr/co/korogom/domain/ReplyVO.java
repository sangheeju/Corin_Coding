package kr.co.korogom.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {

	private Long rno;
	private Long bno;
	private String recon;
	private String rewriter;
	private Date regdate;
	private Date updatedate;
}
