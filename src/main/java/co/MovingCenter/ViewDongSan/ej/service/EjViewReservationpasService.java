package co.MovingCenter.ViewDongSan.ej.service;

import java.util.List;

import co.MovingCenter.ViewDongSan.comm.service.ReservationpasVO;

public interface EjViewReservationpasService {
	List<ReservationpasVO> selectRoomList(ReservationpasVO vo);
}
