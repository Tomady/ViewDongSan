package co.MovingCenter.ViewDongSan.aram.service;

import java.util.List;

import co.MovingCenter.ViewDongSan.comm.service.UsageHistoryVO;

public interface AramRvSelectService {
	List<UsageHistoryVO> selectRvDetailList(UsageHistoryVO vo);

}
