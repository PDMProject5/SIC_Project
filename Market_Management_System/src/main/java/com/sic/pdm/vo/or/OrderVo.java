package com.sic.pdm.vo.or;

import java.util.Date;

public class OrderVo {
	private Date odate;
	private String onum;
	private String iname;
	private int odstock;
	private int oprice;
	private String store;
	private String ostate;

	public OrderVo() {

	}

	public OrderVo(Date odate, String onum, String iname, int odstock, int oprice, String store, String ostate) {
		super();
		this.odate = odate;
		this.onum = onum;
		this.iname = iname;
		this.odstock = odstock;
		this.oprice = oprice;
		this.store = store;
		this.ostate = ostate;
	}

	@Override
	public String toString() {
		return "OrderDto [odate=" + odate + ", onum=" + onum + ", iname=" + iname + ", odstock=" + odstock + ", oprice="
				+ oprice + ", store=" + store + ", ostate=" + ostate + "]";
	}

	public Date getOdate() {
		return odate;
	}

	public void setOdate(Date odate) {
		this.odate = odate;
	}

	public String getOnum() {
		return onum;
	}

	public void setOnum(String onum) {
		this.onum = onum;
	}

	public String getIname() {
		return iname;
	}

	public void setIname(String iname) {
		this.iname = iname;
	}

	public int getOdstock() {
		return odstock;
	}

	public void setOdstock(int odstock) {
		this.odstock = odstock;
	}

	public int getOprice() {
		return oprice;
	}

	public void setOprice(int oprice) {
		this.oprice = oprice;
	}

	public String getStore() {
		return store;
	}

	public void setStore(String store) {
		this.store = store;
	}

	public String getOstate() {
		return ostate;
	}

	public void setOstate(String ostate) {
		this.ostate = ostate;
	}

	
}
