package co.MovingCenter.ViewDongSan.comm.service;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReservationVO {
	private String guestId;
	private int roomId;
	private String checkIn;
	private String checkOut;
	private String status;
}
