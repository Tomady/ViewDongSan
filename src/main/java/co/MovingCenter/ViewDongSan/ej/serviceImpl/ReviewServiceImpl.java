package co.MovingCenter.ViewDongSan.ej.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.MovingCenter.ViewDongSan.comm.service.ReviewVO;
import co.MovingCenter.ViewDongSan.ej.service.EjReviewMapper;
import co.MovingCenter.ViewDongSan.ej.service.EjReviewService;

@Repository("ejReviewDao")
public class ReviewServiceImpl implements EjReviewService {
	
	@Autowired
	public EjReviewMapper map;
	
	@Override
	public List<ReviewVO> selectRoomReview(ReviewVO vo) {
		return map.selectRoomReview(vo);
	}
	@Override
	public Double selectRoomRateAVG(ReviewVO vo) {
		return map.selectRoomRateAVG(vo);
	}
	@Override
	public int selectRoomReviewCount(ReviewVO vo) {
		return map.selectRoomReviewCount(vo);
	}
}
