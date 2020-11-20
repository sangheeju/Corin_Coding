package kr.co.korogom.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.korogom.domain.ReservationDAO;
import kr.co.korogom.domain.RoomDAO;
import kr.co.korogom.domain.RoomImgDAO;
import kr.co.korogom.domain.RoomVO;
import kr.co.korogom.domain.SearchCriteria;
import kr.co.korogom.mapper.ReservationMapper;
import kr.co.korogom.mapper.RoomAttachMapper;
import kr.co.korogom.mapper.RoomMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ReservationServiceImpl implements ReservationService{

	@Setter(onMethod_ = @Autowired)
	private ReservationMapper mapper;

	@Override
	public void reservation_register(ReservationDAO resv) {
		log.info(resv);
		mapper.reservation_register(resv);
	}

	@Override
	public List<ReservationDAO> reservation_list() {
		log.info("reservation_list");
		return mapper.reservation_list();
	}

	@Override
	public int ibool_update(int ino) {
		log.info(ino);
		return mapper.ibool_update(ino);
	}

	@Override
	public boolean remove(int ino) {
		log.info(ino);
		return mapper.delete(ino)==1;
	}

	@Override
	public List<ReservationDAO> resv_list(String mnick) {
		int mno = mapper.find_mno(mnick);
		return mapper.resv_list(mno);
	}
	
	
}
