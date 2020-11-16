package kr.co.korogom.mapper;

import java.util.List;


import kr.co.korogom.domain.PhotoFileDAO;

public interface PhotoFileMapper {

	public int insertPic(PhotoFileDAO photoDAO);		//사진 추가
	public void deletePic(String uuid);					//사진 삭제
	public PhotoFileDAO findByPno(int pno);				//사진 찾기
	
}
