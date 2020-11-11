package kr.co.korogom.mapper;

import java.util.List;

import kr.co.korogom.domain.PetDAO;

public interface PhotoFileMapper {

	public void insert(PetDAO petdao);
	public void delete(String uuid);
	public List<PetDAO> findByPno(int pno);
}
