package co.MovingCenter.ViewDongSan.dy.service;

import java.util.List;

import co.MovingCenter.ViewDongSan.comm.service.HostVO;

public interface DyHostMapper {
	public List<HostVO> selectListHost();
	public int insertHost(HostVO vo);
}
