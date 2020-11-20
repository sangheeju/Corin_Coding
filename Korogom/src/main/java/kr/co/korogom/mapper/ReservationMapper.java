package kr.co.korogom.mapper;

import java.util.List;

import kr.co.korogom.domain.ReservationDAO;

public interface ReservationMapper {
	
	public List<ReservationDAO> reservation_list();
	public void reservation_register(ReservationDAO resv);
	public int ibool_update(int ino);
	public int delete(int ino);
	
	public int find_mno(String mnick);
	public List<ReservationDAO> resv_list(int mno);
	
}
