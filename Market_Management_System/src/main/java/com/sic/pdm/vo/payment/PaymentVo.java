package com.sic.pdm.vo.payment;

import java.util.Date;

public class PaymentVo {

	private String paymentnum;
	private String onum;
	private int saleamt;
	private int discountamt;
	private int paymentamt;
	private Date paymentdate;
	private String id;
	private String store;
	private Date odate;
	private String roadaddr;
	private String addr;
	private String deliveryselect;
	private String ostate;
	private String odnum;
	private String icode;
	private int odstock;
	private int oprice;
	
	public PaymentVo() {
		
	}

	public PaymentVo(String paymentnum, String onum, int saleamt, int discountamt, int paymentamt, Date paymentdate,
			String id, String store, Date odate, String roadaddr, String addr, String deliveryselect, String ostate,
			String odnum, String icode, int odstock, int oprice) {
		super();
		this.paymentnum = paymentnum;
		this.onum = onum;
		this.saleamt = saleamt;
		this.discountamt = discountamt;
		this.paymentamt = paymentamt;
		this.paymentdate = paymentdate;
		this.id = id;
		this.store = store;
		this.odate = odate;
		this.roadaddr = roadaddr;
		this.addr = addr;
		this.deliveryselect = deliveryselect;
		this.ostate = ostate;
		this.odnum = odnum;
		this.icode = icode;
		this.odstock = odstock;
		this.oprice = oprice;
	}

	@Override
	public String toString() {
		return "PaymentVo [paymentnum=" + paymentnum + ", onum=" + onum + ", saleamt=" + saleamt + ", discountamt="
				+ discountamt + ", paymentamt=" + paymentamt + ", paymentdate=" + paymentdate + ", id=" + id
				+ ", store=" + store + ", odate=" + odate + ", roadaddr=" + roadaddr + ", addr=" + addr
				+ ", deliveryselect=" + deliveryselect + ", ostate=" + ostate + ", odnum=" + odnum + ", icode=" + icode
				+ ", odstock=" + odstock + ", oprice=" + oprice + "]";
	}

	public String getPaymentnum() {
		return paymentnum;
	}

	public void setPaymentnum(String paymentnum) {
		this.paymentnum = paymentnum;
	}

	public String getOnum() {
		return onum;
	}

	public void setOnum(String onum) {
		this.onum = onum;
	}

	public int getSaleamt() {
		return saleamt;
	}

	public void setSaleamt(int saleamt) {
		this.saleamt = saleamt;
	}

	public int getDiscountamt() {
		return discountamt;
	}

	public void setDiscountamt(int discountamt) {
		this.discountamt = discountamt;
	}

	public int getPaymentamt() {
		return paymentamt;
	}

	public void setPaymentamt(int paymentamt) {
		this.paymentamt = paymentamt;
	}

	public Date getPaymentdate() {
		return paymentdate;
	}

	public void setPaymentdate(Date paymentdate) {
		this.paymentdate = paymentdate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getStore() {
		return store;
	}

	public void setStore(String store) {
		this.store = store;
	}

	public Date getOdate() {
		return odate;
	}

	public void setOdate(Date odate) {
		this.odate = odate;
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

	public String getDeliveryselect() {
		return deliveryselect;
	}

	public void setDeliveryselect(String deliveryselect) {
		this.deliveryselect = deliveryselect;
	}

	public String getOstate() {
		return ostate;
	}

	public void setOstate(String ostate) {
		this.ostate = ostate;
	}

	public String getOdnum() {
		return odnum;
	}

	public void setOdnum(String odnum) {
		this.odnum = odnum;
	}

	public String getIcode() {
		return icode;
	}

	public void setIcode(String icode) {
		this.icode = icode;
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
	
	

}
