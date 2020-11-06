package kr.co.korogom.service;

import java.util.List;

import kr.co.korogom.domain.BoardAttachVO;
import kr.co.korogom.domain.BoardDAO;
import kr.co.korogom.domain.RoomDAO;
import kr.co.korogom.domain.RoomImgDAO;
import kr.co.korogom.domain.RoomVO;
import kr.co.korogom.domain.SearchCriteria;

public interface RoomService {

	public List<RoomDAO> room_list();
	public void room_register(RoomDAO room);
	public RoomVO room_read(int roomno); 
	
	public List<RoomVO> imglist();
	public List<RoomDAO> roomlistSearch(SearchCriteria cri);
	
	public int resv_countpaging(SearchCriteria cri);
	public List<RoomVO> resv_listPage(int page);
}
