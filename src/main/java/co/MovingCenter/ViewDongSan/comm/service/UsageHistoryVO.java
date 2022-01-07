package co.MovingCenter.ViewDongSan.comm.service;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UsageHistoryVO {
	private String guestId;
	private int roomId;
	private String checkIn;
	private String checkOut;
	private String status;
	private String roomName;
	private String roomAddress;
	private String roomImg;
	private String roomRate;
	private String roomSubject;
	private String roomPrice;
	private String hostId;
}
