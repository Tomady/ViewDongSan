package co.MovingCenter.ViewDongSan.comm.service;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReplyVO {
	private int no;
	private int parentnode;
	private String id;
	private String contents;
	private int roomId;
	private int groupNum;
	private String wdate;
}
