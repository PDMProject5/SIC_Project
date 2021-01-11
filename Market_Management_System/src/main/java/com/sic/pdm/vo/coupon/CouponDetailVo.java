package com.sic.pdm.vo.coupon;

public class CouponDetailVo {
	private String cdSeq;
	private String cdState;
	
	public CouponDetailVo() {}

	public CouponDetailVo(String cdSeq, String cdState) {
		super();
		this.cdSeq = cdSeq;
		this.cdState = cdState;
	}

	public String getCdSeq() {
		return cdSeq;
	}

	public void setCdSeq(String cdSeq) {
		this.cdSeq = cdSeq;
	}

	public String getCdState() {
		return cdState;
	}

	public void setCdState(String cdState) {
		this.cdState = cdState;
	}

	@Override
	public String toString() {
		return "CouponDetailDTO [cdSeq=" + cdSeq + ", cdState=" + cdState + "]";
	}
	
	
	
	
	
}
