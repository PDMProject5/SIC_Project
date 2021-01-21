package com.sic.pdm.vo.or;

import java.util.Date;

public class OrderdetailVo {
	private Date odate;
	private String onum;
	private String id;
	private String iname;
	private int odstock;
	private int oprice;
	private String store;
	private String ostate;
	private String name;
	private String addr;
	private String phone;
	private int paymentamt;
	private int discountamt;
	private String reason;
	private String odnum;

	public OrderdetailVo() {

	}

	public OrderdetailVo(Date odate, String onum, String id, String iname, int odstock, int oprice, String store,
			String ostate, String name, String addr, String phone, int paymentamt, int discountamt, String reason,
			String odnum) {
		super();
		this.odate = odate;
		this.onum = onum;
		this.id = id;
		this.iname = iname;
		this.odstock = odstock;
		this.oprice = oprice;
		this.store = store;
		this.ostate = ostate;
		this.name = name;
		this.addr = addr;
		this.phone = phone;
		this.paymentamt = paymentamt;
		this.discountamt = discountamt;
		this.reason = reason;
		this.odnum = odnum;
	}

	@Override
	public String toString() {
		return "OrderdetailVo [odate=" + odate + ", onum=" + onum + ", id=" + id + ", iname=" + iname + ", odstock="
				+ odstock + ", oprice=" + oprice + ", store=" + store + ", ostate=" + ostate + ", name=" + name
				+ ", addr=" + addr + ", phone=" + phone + ", paymentamt=" + paymentamt + ", discountamt=" + discountamt
				+ ", reason=" + reason + ", odnum=" + odnum + "]";
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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public int getPaymentamt() {
		return paymentamt;
	}

	public void setPaymentamt(int paymentamt) {
		this.paymentamt = paymentamt;
	}

	public int getDiscountamt() {
		return discountamt;
	}

	public void setDiscountamt(int discountamt) {
		this.discountamt = discountamt;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getOdnum() {
		return odnum;
	}

	public void setOdnum(String odnum) {
		this.odnum = odnum;
	}
	
	
	

}
