package kr.co.korogom.domain;

import lombok.Data;

@Data
public class RoomImgDAO {

	private int imgno;
	private String uuid;
	private String uploadPath;
	private String fileName;
	
	private int roomno;
}
