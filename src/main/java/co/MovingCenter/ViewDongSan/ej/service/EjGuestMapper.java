package co.MovingCenter.ViewDongSan.ej.service;

import co.MovingCenter.ViewDongSan.comm.service.GuestVO;

public interface EjGuestMapper {
	GuestVO guestSelect(GuestVO vo);
	int guestProfileUpdate(GuestVO vo);
	int guestUpdate(GuestVO vo);
	int guestDropUpdate(GuestVO vo);
}
