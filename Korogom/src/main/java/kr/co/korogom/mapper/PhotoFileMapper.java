package kr.co.korogom.mapper;

import java.util.List;


import kr.co.korogom.domain.PhotoFileDAO;

public interface PhotoFileMapper {

	public void insert(PhotoFileDAO photoDAO);
	public void delete(String uuid);
	public List<PhotoFileDAO> findByPno(int pno);
}
