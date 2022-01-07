package co.MovingCenter.ViewDongSan.aram.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.MovingCenter.ViewDongSan.comm.service.UsageHistoryVO;

@Repository("aramRvSelService")
public class AramRvSelectServiceImpl implements AramRvSelectService {
	
	@Autowired
	private AramRvSelectService map;
	
	@Override
	public List<UsageHistoryVO> selectRvDetailList(UsageHistoryVO vo) {
		return map.selectRvDetailList(vo);
	}

}
