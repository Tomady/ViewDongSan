package co.MovingCenter.ViewDongSan.dy.service;

import java.util.List;

import co.MovingCenter.ViewDongSan.comm.service.ReplyVO;

public interface DyReplyMapper {
	List<ReplyVO> selectList(ReplyVO vo);
	int insertReply(ReplyVO vo);
}
