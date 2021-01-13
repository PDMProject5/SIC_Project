package com.sic.pdm.vo.coupon;

public class CouponDetailVo {
	private String cdseq;
	private String cdstate;
	
	public CouponDetailVo() {}

	public CouponDetailVo(String cdseq, String cdstate) {
		super();
		this.cdseq = cdseq;
		this.cdstate = cdstate;
	}

	public String getCdseq() {
		return cdseq;
	}

	public void setCdseq(String cdseq) {
		this.cdseq = cdseq;
	}

	public String getCdstate() {
		return cdstate;
	}

	public void setCdstate(String cdstate) {
		this.cdstate = cdstate;
	}

	@Override
	public String toString() {
		return "CouponDetailVo [cdseq=" + cdseq + ", cdstate=" + cdstate + "]";
	}
	
}
