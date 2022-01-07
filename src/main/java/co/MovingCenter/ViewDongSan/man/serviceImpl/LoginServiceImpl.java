package co.MovingCenter.ViewDongSan.man.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.MovingCenter.ViewDongSan.comm.service.LoginVO;
import co.MovingCenter.ViewDongSan.man.service.ManLoginMapper;
import co.MovingCenter.ViewDongSan.man.service.ManLoginService;

@Repository("loginDao")
public class LoginServiceImpl implements ManLoginService {
	
	@Autowired
	ManLoginMapper map;

	@Override
	public List<LoginVO> allLoginMember() {
		// TODO Auto-generated method stub
		return map.allLoginMember();
	}


}
