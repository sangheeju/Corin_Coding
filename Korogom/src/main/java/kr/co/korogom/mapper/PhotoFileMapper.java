package kr.co.korogom.mapper;

import java.util.List;


import kr.co.korogom.domain.PhotoFileDAO;

public interface PhotoFileMapper {

	public int insertPic(PhotoFileDAO photoDAO);
	public void deletePic(String uuid);
	public List<PhotoFileDAO> findByPno(int pno);
}
