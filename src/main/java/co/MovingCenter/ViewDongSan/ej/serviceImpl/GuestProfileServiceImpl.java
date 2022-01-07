package co.MovingCenter.ViewDongSan.ej.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.MovingCenter.ViewDongSan.comm.service.GuestprofileVO;
import co.MovingCenter.ViewDongSan.ej.service.EjGuestProfileMapper;
import co.MovingCenter.ViewDongSan.ej.service.EjGuestProfileService;

@Repository("ejGuestProfileDao")
public class GuestProfileServiceImpl implements EjGuestProfileService {
	@Autowired
	private EjGuestProfileMapper map;
	
	@Override
	public List<GuestprofileVO> selectGuestProfileImg(GuestprofileVO vo) {
		return map.selectGuestProfileImg(vo);
	}

}
