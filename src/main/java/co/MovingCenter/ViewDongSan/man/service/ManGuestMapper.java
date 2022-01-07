package co.MovingCenter.ViewDongSan.man.service;

import java.util.List;

import co.MovingCenter.ViewDongSan.comm.service.GuestVO;

public interface ManGuestMapper {

	public List<GuestVO> selectListGuest();

	GuestVO selectGuest(GuestVO vo);
	
	GuestVO selectGuestId(GuestVO vo);

	int guestDelete(String guestid);


}
