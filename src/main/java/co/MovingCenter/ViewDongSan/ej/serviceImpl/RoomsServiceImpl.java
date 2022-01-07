package co.MovingCenter.ViewDongSan.ej.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.MovingCenter.ViewDongSan.comm.service.RoomsVO;
import co.MovingCenter.ViewDongSan.ej.service.EjRoomsMapper;
import co.MovingCenter.ViewDongSan.ej.service.EjRoomsService;

@Repository("ejRoomsDao")
public class RoomsServiceImpl implements EjRoomsService {
	
	@Autowired
	public EjRoomsMapper map;
	
	@Override
	public RoomsVO selectRoomDetails(RoomsVO vo) {
		return map.selectRoomDetails(vo);
	}

}
