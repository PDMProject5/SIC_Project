package com.sic.pdm.vo.coupon;

import java.util.Date;

public class CouponBoxVo {
	
	private String cbseq;
	private Date cbdate;
	
	public CouponBoxVo() {}

	public CouponBoxVo(String cbseq, Date cbdate) {
		super();
		this.cbseq = cbseq;
		this.cbdate = cbdate;
	}

	public String getCbseq() {
		return cbseq;
	}

	public void setCbseq(String cbseq) {
		this.cbseq = cbseq;
	}

	public Date getCbdate() {
		return cbdate;
	}

	public void setCbdate(Date cbdate) {
		this.cbdate = cbdate;
	}

	@Override
	public String toString() {
		return "CouponBoxVo [cbseq=" + cbseq + ", cbdate=" + cbdate + "]";
	}
	
}
