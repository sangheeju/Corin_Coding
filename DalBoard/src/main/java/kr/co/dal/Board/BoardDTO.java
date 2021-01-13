package kr.co.dal.Board;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class BoardDTO {

	private int bno;
	private int mno;
	private String mid;
	private String bdate;
	private String btitle;
	private String bcon;
	private String bfile1;
	private String bfile2;
	private int bcnt;
	private int bsort;
	private String betc;
	private String rewriter;
}
