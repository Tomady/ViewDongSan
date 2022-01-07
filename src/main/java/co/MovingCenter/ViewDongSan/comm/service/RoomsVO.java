package co.MovingCenter.ViewDongSan.comm.service;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class RoomsVO {
	private int roomId;
	private String roomName;
	private String roomAddress;
	private String roomImg;
	private String hostId;
	private String roomRate;
	private String roomSubject;
	private String roomPrice;
}
