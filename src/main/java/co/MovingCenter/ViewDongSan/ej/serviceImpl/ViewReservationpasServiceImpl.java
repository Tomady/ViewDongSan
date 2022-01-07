package co.MovingCenter.ViewDongSan.ej.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.MovingCenter.ViewDongSan.comm.service.ReservationpasVO;
import co.MovingCenter.ViewDongSan.ej.service.EjViewReservationpasMapper;
import co.MovingCenter.ViewDongSan.ej.service.EjViewReservationpasService;

@Repository("ejReservationpasDao")
public class ViewReservationpasServiceImpl implements EjViewReservationpasService {
	
	@Autowired
	EjViewReservationpasMapper map;
	
	@Override
	public List<ReservationpasVO> selectRoomList(ReservationpasVO vo) { //여행지미입력
		return map.selectRoomList(vo);
	}
	

}
