package co.MovingCenter.ViewDongSan.ej.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.MovingCenter.ViewDongSan.comm.service.HostVO;
import co.MovingCenter.ViewDongSan.ej.service.EjHostMapper;
import co.MovingCenter.ViewDongSan.ej.service.EjHostService;

@Repository("ejHostDao")
public class HostServiceImpl implements EjHostService {

	@Autowired
	private EjHostMapper map;
	
	public HostVO hostSelect(HostVO vo) {
		return map.hostSelect(vo);
	}
	
	public int hostUpdate(HostVO vo) {
		return map.hostUpdate(vo);
	}
	
	public int hostDropUpdate(HostVO vo) {
		return map.hostDropUpdate(vo);
	}

	@Override
	public int hostProfileImgUpdate(HostVO vo) {
		return map.hostProfileImgUpdate(vo);
	}

}
