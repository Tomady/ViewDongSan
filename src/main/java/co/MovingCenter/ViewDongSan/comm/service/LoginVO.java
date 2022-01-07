package co.MovingCenter.ViewDongSan.comm.service;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class LoginVO {
	
	public String guestId;
	public String gpassword;
	public String gname;
	public String gaddress;
	public String gtel;
	
	public String adminId;
	public String adminPassword;
	public String status;
	public String author;
	
	public String hostId;
	public String hpassword;
	public String hname;
	public String htel;
	public String haddress;
	// ADMIN GUEST HOST �ȳ����� �ִ���
}
