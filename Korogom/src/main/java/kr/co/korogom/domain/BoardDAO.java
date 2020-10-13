package kr.co.korogom.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BoardDAO {

	private int bno;
	private int mno;
	private Date bdate;
	private String btitle;
	private String bcon;
	private String bfile1;
	private String bfile2;
	private String bfile3;
	private int bcnt;
	private int bscore;
	private int bsort;
	private String betc;
}
