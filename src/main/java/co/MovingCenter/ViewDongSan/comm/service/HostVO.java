package co.MovingCenter.ViewDongSan.comm.service;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class HostVO {
	private String hostId;
	private String hpassword;
	private String hname;
	private String htel;
	private String author;
	private String discount;
	private String himg;
	private String hyellowCard;
	private String status;
	private String haddress;
	
	@Override
	public String toString() {
		return hostId + hpassword;
	}
}
