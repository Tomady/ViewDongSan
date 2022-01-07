package co.MovingCenter.ViewDongSan.ej.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.MovingCenter.ViewDongSan.comm.service.GuestVO;
import co.MovingCenter.ViewDongSan.ej.service.EjGuestMapper;
import co.MovingCenter.ViewDongSan.ej.service.EjGuestService;

@Repository("ejGuestDao")
public class GuestServiceImpl implements EjGuestService {
	@Autowired
	private EjGuestMapper map;
	
	@Override
	public GuestVO guestSelect(GuestVO vo) {
		return map.guestSelect(vo);
	}

	@Override
	public int guestUpdate(GuestVO vo) {
		return map.guestUpdate(vo);
	}

	@Override
	public int guestDropUpdate(GuestVO vo) {
		return map.guestDropUpdate(vo);
	}

	@Override
	public int guestProfileUpdate(GuestVO vo) {
		return map.guestProfileUpdate(vo);
	}

}
