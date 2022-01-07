package co.MovingCenter.ViewDongSan.aram.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.MovingCenter.ViewDongSan.comm.service.ReservationVO;

@Repository("aramRvService")
public class AramReservationServiceImpl implements AramReservationService {
	
	@Autowired
	private AramReservationService map;

	@Override
	public List<ReservationVO> selectListRv(ReservationVO vo) {
		return map.selectListRv(vo);
	}

}
