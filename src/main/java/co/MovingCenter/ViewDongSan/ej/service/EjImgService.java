package co.MovingCenter.ViewDongSan.ej.service;

import java.util.List;

import co.MovingCenter.ViewDongSan.comm.service.ImgsVO;

public interface EjImgService {
	List<ImgsVO> imgList();
	ImgsVO imgSelect(ImgsVO vo);
	ImgsVO imgRowSelect(ImgsVO vo);
	int imgInsert(ImgsVO vo);
	int imgUpdate(ImgsVO vo);
	int imgDelete(ImgsVO vo);
}
