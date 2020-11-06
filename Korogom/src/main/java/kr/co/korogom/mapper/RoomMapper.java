package kr.co.korogom.mapper;

import java.util.List;

import kr.co.korogom.domain.RoomDAO;
import kr.co.korogom.domain.RoomVO;
import kr.co.korogom.domain.SearchCriteria;

public interface RoomMapper {
	public List<RoomDAO> room_list();
	public void room_register(RoomDAO room);
	public RoomVO room_read(int roomno);
	
	public void imgupdate(RoomDAO room);
	public int lastroom();
	
	public int resv_countpaging(SearchCriteria cri);
	public List<RoomVO> resv_listPage(int page);
}
