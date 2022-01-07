package co.MovingCenter.ViewDongSan.man.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.MovingCenter.ViewDongSan.comm.service.HostVO;
import co.MovingCenter.ViewDongSan.man.service.ManHostMapper1;
import co.MovingCenter.ViewDongSan.man.service.ManHostService1;


@Repository("manHostDao1")
public class HostServiceImpl implements ManHostService1 {
	
@Autowired
ManHostMapper1 map;

	@Override
	public List<HostVO> selectListHost() {
		// TODO Auto-generated method stub
		return map.selectListHost();
	}

	@Override
	public HostVO selectHost(HostVO vo) {
		// TODO Auto-generated method stub
		return map.selectHost(vo);
	}

	@Override
	public int hostDelete(String hostid) {
		// TODO Auto-generated method stub
		return map.hostDelete(hostid);
	}


	@Override
	public int hostUpdate(HostVO vo) {
		// TODO Auto-generated method stub
		return map.hostUpdate(vo);
	}
}
