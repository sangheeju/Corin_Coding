package kr.co.korogom.mapper;

import java.util.List;

import kr.co.korogom.domain.RoomDAO;
import kr.co.korogom.domain.RoomImgDAO;
import kr.co.korogom.domain.RoomVO;

public interface RoomAttachMapper {

	public List<RoomVO> imglist();
	public void insert(RoomImgDAO vo);
	
	public int findByRoomno(int roomno);
	public int findimgno(int roomno);
}
