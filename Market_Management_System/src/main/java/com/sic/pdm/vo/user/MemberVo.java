package com.sic.pdm.vo.user;

public class MemberVo {
	
	private String id;
	private String pw;
	private String name;
	private String roadaddr;
	private String addr;
	private String phone;
	
	public MemberVo() {
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRoadaddr() {
		return roadaddr;
	}

	public void setRoadaddr(String roadaddr) {
		this.roadaddr = roadaddr;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Override
	public String toString() {
		return "MemberVo [id=" + id + ", pw=" + pw + ", name=" + name + ", roadaddr=" + roadaddr + ", addr=" + addr
				+ ", phone=" + phone + "]";
	}
	
	
	
}
