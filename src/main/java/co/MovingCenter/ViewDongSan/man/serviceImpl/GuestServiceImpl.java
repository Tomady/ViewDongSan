package co.MovingCenter.ViewDongSan.man.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.MovingCenter.ViewDongSan.comm.service.GuestVO;
import co.MovingCenter.ViewDongSan.man.service.ManGuestMapper;
import co.MovingCenter.ViewDongSan.man.service.ManGuestService;

@Repository("manGuestDao")
public class GuestServiceImpl implements ManGuestService {
	@Autowired
	ManGuestMapper map;

	@Override
	public List<GuestVO> selectListGuest() {
		// TODO Auto-generated method stub
		return map.selectListGuest();
	}

	@Override
	public GuestVO selectGuest(GuestVO vo) {
		// TODO Auto-generated method stub
		return map.selectGuest(vo);
	}

	@Override
	public int guestDelete(String guestid) {
		// TODO Auto-generated method stub
		return map.guestDelete(guestid);
	}

	@Override
	public GuestVO selectGuestId(GuestVO vo) {
		// TODO Auto-generated method stub
		return map.selectGuestId(vo);
	}

}
