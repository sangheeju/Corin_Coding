package kr.co.korogom.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.korogom.domain.RoomDAO;
import kr.co.korogom.domain.RoomImgDAO;
import kr.co.korogom.domain.RoomVO;
import kr.co.korogom.domain.SearchCriteria;
import kr.co.korogom.mapper.RoomAttachMapper;
import kr.co.korogom.mapper.RoomMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class RoomServiceImpl implements RoomService{

	@Setter(onMethod_ = @Autowired)
	private RoomMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private RoomAttachMapper attachMapper;

	@Override
	public List<RoomDAO> room_list() {
		return mapper.room_list();
	}

	@Override
	public void room_register(RoomDAO room) {
		log.info("r1:"+room);
		mapper.room_register(room);
		room.setRoomno(mapper.lastroom());
		if(room.getImglist() == null || room.getImglist().size() <=0) {
			return;
		}
		room.getImglist().forEach(attach ->{
			log.info(attach);
			attach.setRoomno(room.getRoomno());
			attachMapper.insert(attach);
			log.info(attachMapper.findimgno(room.getRoomno()));
		});
		room.setImgno(attachMapper.findimgno(room.getRoomno()));
		mapper.imgupdate(room);
	}

	@Override
	public List<RoomDAO> roomlistSearch(SearchCriteria cri) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<RoomVO> imglist() {
		
		return attachMapper.imglist();
	}

	@Override
	public RoomVO room_read(int roomno) {
		return mapper.room_read(roomno);
	}

	@Override
	public int resv_countpaging(SearchCriteria cri) {
		return mapper.resv_countpaging(cri);
	}

	@Override
	public List<RoomVO> resv_listPage(int page) {
		if(page <= 0) {
			page = 1;
		}
		page = (page-1)*10;
		return mapper.resv_listPage(page);
	}	
	
}
