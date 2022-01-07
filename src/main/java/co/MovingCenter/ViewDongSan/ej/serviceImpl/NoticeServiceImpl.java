package co.MovingCenter.ViewDongSan.ej.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.MovingCenter.ViewDongSan.comm.service.NoticeVO;
import co.MovingCenter.ViewDongSan.ej.service.EjNoticeMapper;
import co.MovingCenter.ViewDongSan.ej.service.EjNoticeService;

@Repository("ejNoticeDao")
public class NoticeServiceImpl implements EjNoticeService {
	@Autowired
	private EjNoticeMapper map;
	
	@Override
	public List<NoticeVO> noticeList() {
		return map.noticeList();
	}

	@Override
	public NoticeVO noticeSelect(NoticeVO vo) {
		return map.noticeSelect(vo);
	}

	@Override
	public int noticeInsert(NoticeVO vo) {
		return map.noticeInsert(vo);
	}

	@Override
	public int noticeUpdate(NoticeVO vo) {
		return map.noticeUpdate(vo);
	}

	@Override
	public int noticeDelete(NoticeVO vo) {
		return map.noticeDelete(vo);
	}

	@Override
	public String noticeImgSelect(NoticeVO vo) {
		return map.noticeImgSelect(vo);
	}

}
