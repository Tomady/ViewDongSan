package co.MovingCenter.ViewDongSan.man.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.MovingCenter.ViewDongSan.comm.service.NoticeVO;
import co.MovingCenter.ViewDongSan.man.service.ManNoticeMapper;
import co.MovingCenter.ViewDongSan.man.service.ManNoticeService;

@Repository("manNoticeDao")
public class NoticeServiceImpl implements ManNoticeService {
	@Autowired
	ManNoticeMapper map;

	@Override
	public int noticeInsert(NoticeVO vo) {
		// TODO Auto-generated method stub
		return map.noticeInsert(vo);
	}

}
