package co.MovingCenter.ViewDongSan.dy.service;

import java.util.List;

import co.MovingCenter.ViewDongSan.comm.service.ReservationVO;

public interface DyReservationMapper {
	public List<ReservationVO> selectList();
	public int reservationUpdate();
}
