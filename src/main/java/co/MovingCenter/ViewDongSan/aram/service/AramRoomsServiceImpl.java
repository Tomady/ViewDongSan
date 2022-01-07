package co.MovingCenter.ViewDongSan.aram.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.MovingCenter.ViewDongSan.comm.service.RoomsVO;

@Repository
public class AramRoomsServiceImpl implements AramRoomsService {
	
	@Autowired
	private AramRoomsService map;
	
	@Override
	public List<RoomsVO> roomSelectList(RoomsVO vo) {
		return map.roomSelectList(vo);
	}

	@Override
	public RoomsVO roomSelect(RoomsVO vo) {
		return map.roomSelect(vo);
	}

	@Override
	public int roomInsert(RoomsVO vo) {
		return map.roomInsert(vo);
	}

	@Override
	public int roomUpdate(RoomsVO vo) {
		return map.roomUpdate(vo);
	}

	@Override
	public int roomDelete(RoomsVO vo) {
		return map.roomDelete(vo);
	}

}
