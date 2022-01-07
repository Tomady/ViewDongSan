package co.MovingCenter.ViewDongSan.dy.service;

import co.MovingCenter.ViewDongSan.comm.service.ServiceImgVO;

public interface DyServiceImgMapper {
	public int serviceImgInsert(ServiceImgVO vo);
	public ServiceImgVO serviceImgSelect(String id);
	public int serviceImgUpdate(ServiceImgVO vo);
}
