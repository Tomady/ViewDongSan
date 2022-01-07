package co.MovingCenter.ViewDongSan.man.service;

import java.util.List;

import co.MovingCenter.ViewDongSan.comm.service.HostVO;

public interface ManHostService1 {
	public List<HostVO> selectListHost();
	HostVO selectHost(HostVO vo);
	int hostDelete(String hostid);
	int hostUpdate(HostVO vo);
}
