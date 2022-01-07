package co.MovingCenter.ViewDongSan.ej.service;

import co.MovingCenter.ViewDongSan.comm.service.HostVO;

public interface EjHostMapper {
	HostVO hostSelect(HostVO vo);
	int hostProfileImgUpdate(HostVO vo);
	int hostUpdate(HostVO vo);
	int hostDropUpdate(HostVO vo);
}
