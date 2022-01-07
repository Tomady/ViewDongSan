package co.MovingCenter.ViewDongSan.comm.service;


import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReservationpasVO {
	private int roomId;
	private String roomAddress;
	private String roomName;
	private String roomImg;
	private String hostId;
	private String roomRate;
	private String roomSubject;
	private String roomPrice;
	private String checkIn;
	private String checkOut;
}
