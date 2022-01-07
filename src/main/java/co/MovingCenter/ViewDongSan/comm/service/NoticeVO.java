package co.MovingCenter.ViewDongSan.comm.service;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class NoticeVO {
	 private int no;
	 private String ntitle;
	 private String nsubject;
	 private String nwdate;
	 private String nimg;
	 private String fileName;	//원본파일명
	 private String pfileName;	//물리파일명
}
