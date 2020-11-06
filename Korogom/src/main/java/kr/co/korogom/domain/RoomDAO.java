package kr.co.korogom.domain;

import java.util.List;

import lombok.Data;

@Data
public class RoomDAO {

	private int roomno;
	private int imgno;
	private int roomprice;
	private int roomtype;
	private String roomcontent;
	private int roomcnt;
	private String roometc;
	
	private List<RoomImgDAO> imglist;
}
