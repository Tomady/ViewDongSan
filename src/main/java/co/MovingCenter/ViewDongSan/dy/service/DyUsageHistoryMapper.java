package co.MovingCenter.ViewDongSan.dy.service;

import java.util.List;

import co.MovingCenter.ViewDongSan.comm.service.UsageHistoryVO;

public interface DyUsageHistoryMapper {
	public List<UsageHistoryVO> guestSelectList(UsageHistoryVO vo);
	public List<UsageHistoryVO> hostSelectList(UsageHistoryVO vo);
	public List<UsageHistoryVO> currentList(String id);
}
