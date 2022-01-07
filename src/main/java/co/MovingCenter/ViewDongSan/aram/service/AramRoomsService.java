package co.MovingCenter.ViewDongSan.aram.service;

import java.util.List;

import co.MovingCenter.ViewDongSan.comm.service.RoomsVO;

public interface AramRoomsService {
	List<RoomsVO> roomSelectList(RoomsVO vo);
	RoomsVO roomSelect(RoomsVO vo);
	int roomInsert(RoomsVO vo);
	int roomUpdate(RoomsVO vo);
	int roomDelete(RoomsVO vo);
	
}
