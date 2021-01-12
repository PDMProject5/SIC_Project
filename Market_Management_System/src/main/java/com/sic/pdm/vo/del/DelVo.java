package com.sic.pdm.vo.del;

public class DelVo {
	private String dnum;
	private String id;
	private String roadaddr;
	private String addr;
	private String addrflag;
	private String dname;
	private String phone;
	
	public DelVo() {
		// TODO Auto-generated constructor stub
	}

	



	public DelVo(String dnum, String id, String roadaddr, String addr, String addrflag, String dname, String phone) {
		super();
		this.dnum = dnum;
		this.id = id;
		this.roadaddr = roadaddr;
		this.addr = addr;
		this.dname = dname;
		this.phone = phone;
	}





	public DelVo(String dnum, String id, String addrflag) {
		super();
		this.dnum = dnum;
		this.id = id;
		this.addrflag = addrflag;
	}





	public DelVo(String id, String roadaddr, String addr, String dname, String phone) {
		super();
		this.id = id;
		this.roadaddr = roadaddr;
		this.addr = addr;
		this.dname = dname;
		this.phone = phone;
	}



	@Override
	public String toString() {
		return "DelVo [dnum=" + dnum + ", id=" + id + ", roadaddr=" + roadaddr + ", addr=" + addr + ", addrflag="
				+ addrflag + ", dname=" + dname + ", phone=" + phone + "]";
	}


	


	public String getDnum() {
		return dnum;
	}


	public void setDnum(String dnum) {
		this.dnum = dnum;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
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


	public String getAddrflag() {
		return addrflag;
	}


	public void setAddrflag(String addrflag) {
		this.addrflag = addrflag;
	}


	public String getDname() {
		return dname;
	}


	public void setDname(String dname) {
		this.dname = dname;
	}

	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	
	
}                            
