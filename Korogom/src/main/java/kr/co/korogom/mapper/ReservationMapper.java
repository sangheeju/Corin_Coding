package kr.co.korogom.mapper;

import java.util.List;

import kr.co.korogom.domain.ReservationDAO;

public interface ReservationMapper {
	
	public List<ReservationDAO> reservation_list();
	public void reservation_register(ReservationDAO resv);
	
}
