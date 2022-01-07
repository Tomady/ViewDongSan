package co.MovingCenter.ViewDongSan.man.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.MovingCenter.ViewDongSan.comm.service.AdminVO;
import co.MovingCenter.ViewDongSan.man.service.ManAdminMapper;
import co.MovingCenter.ViewDongSan.man.service.ManAdminService;

@Repository("manAdminDao")
public class AdminServiceImpl implements ManAdminService {
	@Autowired
	ManAdminMapper map;

	@Override
	public AdminVO selectAdmin(AdminVO vo) {
		// TODO Auto-generated method stub
		return map.selectAdmin(vo);
	}

}
