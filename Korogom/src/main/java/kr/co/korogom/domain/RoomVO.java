package kr.co.korogom.domain;

import lombok.Data;

@Data
public class RoomVO {

	private int roomno;
	private int imgno;
	private int roomprice;
	private String roomtype;
	private String roomcontent;
	private int roomcnt;
	private String roometc;
	
	private String uuid;
	private String uploadPath;
	private String fileName;
	
}
