package co.MovingCenter.ViewDongSan.ej.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.MovingCenter.ViewDongSan.comm.service.ImgsVO;
import co.MovingCenter.ViewDongSan.ej.service.EjImgsMapper;
import co.MovingCenter.ViewDongSan.ej.service.EjImgsService;

@Repository("ejImgsDao")
public class ImgsServiceImpl implements EjImgsService {
	
	@Autowired
	public EjImgsMapper map;
	
	@Override
	public ImgsVO selectRoomImgs(ImgsVO vo) {
		return map.selectRoomImgs(vo);
	}

}
