package com.sic.pdm.vo.coupon;

import java.util.Date;

public class CouponBoxVo {
	
	private String cbcode;
	private Date cbdate;
	
	public CouponBoxVo() {}

	public CouponBoxVo(String cbcode, Date cbdate) {
		super();
		this.cbcode = cbcode;
		this.cbdate = cbdate;
	}

	public String getCbcode() {
		return cbcode;
	}

	public void setCbcode(String cbcode) {
		this.cbcode = cbcode;
	}

	public Date getCbdate() {
		return cbdate;
	}

	public void setCbdate(Date cbdate) {
		this.cbdate = cbdate;
	}

	@Override
	public String toString() {
		return "CouponBoxVo [cbcode=" + cbcode + ", cbdate=" + cbdate + "]";
	}
	
}
