package co.MovingCenter.ViewDongSan.aram.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.MovingCenter.ViewDongSan.comm.service.ReservationpasVO;

@Repository("aramPasService")
public class AramReservationpasServiceImpl implements AramReservationpasService {
	
	@Autowired
	private AramReservationpasService map;

	@Override
	public List<ReservationpasVO> calendarRvList(ReservationpasVO vo) {
		return map.calendarRvList(vo);
	}	

}
