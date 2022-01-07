package co.MovingCenter.ViewDongSan.man.service;

import java.util.List;

import co.MovingCenter.ViewDongSan.comm.service.GuestVO;

public interface ManGuestService {
	public List<GuestVO> selectListGuest();

	int guestDelete(String guestid);

	GuestVO selectGuest(GuestVO vo);
	
	GuestVO selectGuestId(GuestVO vo);
	
	

}
