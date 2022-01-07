package co.MovingCenter.ViewDongSan.ej.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.MovingCenter.ViewDongSan.comm.service.HostprofileVO;
import co.MovingCenter.ViewDongSan.ej.service.EjHostProfileMapper;
import co.MovingCenter.ViewDongSan.ej.service.EjHostProfileService;

@Repository("ejHostProfileDao")
public class HostProfileServiceImpl implements EjHostProfileService {
	@Autowired
	private EjHostProfileMapper map;
	
	@Override
	public HostprofileVO selectHostImg(HostprofileVO vo) {
		return map.selectHostImg(vo);
	}

}
