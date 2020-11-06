package kr.co.korogom.service;

import java.util.List;

import kr.co.korogom.domain.ReservationDAO;


public interface ReservationService {

	public List<ReservationDAO> reservation_list();
	public void reservation_register(ReservationDAO resv);
}
