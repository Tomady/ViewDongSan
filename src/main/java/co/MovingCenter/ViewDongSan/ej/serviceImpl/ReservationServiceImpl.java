package co.MovingCenter.ViewDongSan.ej.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.MovingCenter.ViewDongSan.comm.service.ReservationVO;
import co.MovingCenter.ViewDongSan.ej.service.EjReservationMapper;
import co.MovingCenter.ViewDongSan.ej.service.EjReservationService;

@Repository("ejReservationDao")
public class ReservationServiceImpl implements EjReservationService {
	
	@Autowired
	private EjReservationMapper map; 
	
	@Override
	public int insertReservation(ReservationVO vo) {
		return map.insertReservation(vo);
	}

}
