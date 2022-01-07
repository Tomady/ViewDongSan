package co.MovingCenter.ViewDongSan.ej.service;

import java.util.List;

import co.MovingCenter.ViewDongSan.comm.service.ReservationpasVO;

public interface EjViewReservationpasMapper {
	List<ReservationpasVO> selectRoomList(ReservationpasVO vo);
	List<ReservationpasVO> selectRoomAreaList(ReservationpasVO vo);
}

