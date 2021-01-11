package com.sic.pdm.vo.coupon;

import java.util.Date;

public class CouponBoxVo {
	
	private String cbCode;
	private Date cbDate;
	
	public CouponBoxVo() {}

	public CouponBoxVo(String cbCode, Date cbDate) {
		super();
		this.cbCode = cbCode;
		this.cbDate = cbDate;
	}

	public String getCbCode() {
		return cbCode;
	}

	public void setCbCode(String cbCode) {
		this.cbCode = cbCode;
	}

	public Date getCbDate() {
		return cbDate;
	}

	public void setCbDate(Date cbDate) {
		this.cbDate = cbDate;
	}

	@Override
	public String toString() {
		return "CouponBox [cbCode=" + cbCode + ", cbDate=" + cbDate + "]";
	}

}
