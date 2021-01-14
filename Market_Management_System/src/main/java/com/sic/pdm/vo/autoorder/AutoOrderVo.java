package com.sic.pdm.vo.autoorder;

public class AutoOrderVo {

	private String aoseq;
	private String sellerid;
	private String icode;
	private String iname;
	private int autonum;
	private int ordernum;
	
	public AutoOrderVo() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "AutoOrderVo [aoseq=" + aoseq + ", sellerid=" + sellerid + ", icode=" + icode + ", iname=" + iname
				+ ", autonum=" + autonum + ", ordernum=" + ordernum + "]";
	}

	public String getAoseq() {
		return aoseq;
	}

	public void setAoseq(String aoseq) {
		this.aoseq = aoseq;
	}

	public String getSellerid() {
		return sellerid;
	}

	public void setSellerid(String sellerid) {
		this.sellerid = sellerid;
	}

	public String getIcode() {
		return icode;
	}

	public void setIcode(String icode) {
		this.icode = icode;
	}

	public String getIname() {
		return iname;
	}

	public void setIname(String iname) {
		this.iname = iname;
	}

	public int getAutonum() {
		return autonum;
	}

	public void setAutonum(int autonum) {
		this.autonum = autonum;
	}

	public int getOrdernum() {
		return ordernum;
	}

	public void setOrdernum(int ordernum) {
		this.ordernum = ordernum;
	}
	
	
	
}
