package kr.co.korogom.domain;

import lombok.Data;

@Data
public class PhotoFileDAO {

	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean fileType;
	
	private int pno;
	
}
