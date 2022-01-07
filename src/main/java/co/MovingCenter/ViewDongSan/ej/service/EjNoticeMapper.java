package co.MovingCenter.ViewDongSan.ej.service;

import java.util.List;

import co.MovingCenter.ViewDongSan.comm.service.NoticeVO;

public interface EjNoticeMapper {
	List<NoticeVO> noticeList();
	NoticeVO noticeSelect(NoticeVO vo);
	String noticeImgSelect(NoticeVO vo);
	int noticeInsert(NoticeVO vo);
	int noticeUpdate(NoticeVO vo);
	int noticeDelete(NoticeVO vo);
}
