package com.sic.pdm.vo.coupon;


public class CouponVo {
	
	private String cseq;
	private String sellerid;
	private String coupon;
	private String cdate;
	private String cnotify;
	private String cenable;
	private String cimg;
	private String cthumbimg;
	private String clastdate;
	private String cbseq;
	private String id;
	
	public CouponVo() {}

	public CouponVo(String cseq, String sellerid, String coupon, String cdate, String cnotify, String cenable,
			String cimg, String cthumbimg, String clastdate, String cbseq, String id) {
		super();
		this.cseq = cseq;
		this.sellerid = sellerid;
		this.coupon = coupon;
		this.cdate = cdate;
		this.cnotify = cnotify;
		this.cenable = cenable;
		this.cimg = cimg;
		this.cthumbimg = cthumbimg;
		this.clastdate = clastdate;
		this.cbseq = cbseq;
		this.id = id;
	}

	@Override
	public String toString() {
		return "CouponVo [cseq=" + cseq + ", sellerid=" + sellerid + ", coupon=" + coupon + ", cdate=" + cdate
				+ ", cnotify=" + cnotify + ", cenable=" + cenable + ", cimg=" + cimg + ", cthumbimg=" + cthumbimg
				+ ", clastdate=" + clastdate + ", cbseq=" + cbseq + ", id=" + id + "]";
	}

	public String getCseq() {
		return cseq;
	}

	public void setCseq(String cseq) {
		this.cseq = cseq;
	}

	public String getSellerid() {
		return sellerid;
	}

	public void setSellerid(String sellerid) {
		this.sellerid = sellerid;
	}

	public String getCoupon() {
		return coupon;
	}

	public void setCoupon(String coupon) {
		this.coupon = coupon;
	}

	public String getCdate() {
		return cdate;
	}

	public void setCdate(String cdate) {
		this.cdate = cdate;
	}

	public String getCnotify() {
		return cnotify;
	}

	public void setCnotify(String cnotify) {
		this.cnotify = cnotify;
	}

	public String getCenable() {
		return cenable;
	}

	public void setCenable(String cenable) {
		this.cenable = cenable;
	}

	public String getCimg() {
		return cimg;
	}

	public void setCimg(String cimg) {
		this.cimg = cimg;
	}

	public String getCthumbimg() {
		return cthumbimg;
	}

	public void setCthumbimg(String cthumbimg) {
		this.cthumbimg = cthumbimg;
	}

	public String getClastdate() {
		return clastdate;
	}

	public void setClastdate(String clastdate) {
		this.clastdate = clastdate;
	}

	public String getCbseq() {
		return cbseq;
	}

	public void setCbseq(String cbseq) {
		this.cbseq = cbseq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	
	
	
	
	

	
}
