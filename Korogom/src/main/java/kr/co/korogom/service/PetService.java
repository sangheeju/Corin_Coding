package kr.co.korogom.service;

import java.util.List;

import kr.co.korogom.domain.PetDAO;

public interface PetService {

	public List<PetDAO> petMine(int mno);				//회원당 반려동물 리스트 페이지 출력
}
