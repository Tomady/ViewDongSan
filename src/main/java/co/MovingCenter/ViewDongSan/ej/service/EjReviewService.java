package co.MovingCenter.ViewDongSan.ej.service;

import java.util.List;

import co.MovingCenter.ViewDongSan.comm.service.ReviewVO;

public interface EjReviewService {
	List<ReviewVO> selectRoomReview(ReviewVO vo);
	Double selectRoomRateAVG(ReviewVO vo);
	int selectRoomReviewCount(ReviewVO vo);
}
