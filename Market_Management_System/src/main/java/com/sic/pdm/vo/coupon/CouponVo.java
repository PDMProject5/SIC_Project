package com.sic.pdm.vo.coupon;

import java.util.Date;

public class CouponVo {
	
	private String cSeq;
	private String sellerId;
	private String coupon;
	private Date cDate;
	private String cNotify;
	private String cEnable;
	private String cImg;
	private String cThumbImg;
	
	public CouponVo() {}

	public CouponVo(String cSeq, String sellerId, String coupon, Date cDate, String cNotify, String cEnable,
			String cImg, String cThumbImg) {
		super();
		this.cSeq = cSeq;
		this.sellerId = sellerId;
		this.coupon = coupon;
		this.cDate = cDate;
		this.cNotify = cNotify;
		this.cEnable = cEnable;
		this.cImg = cImg;
		this.cThumbImg = cThumbImg;
	}

	public String getcSeq() {
		return cSeq;
	}

	public void setcSeq(String cSeq) {
		this.cSeq = cSeq;
	}

	public String getSellerId() {
		return sellerId;
	}

	public void setSellerId(String sellerId) {
		this.sellerId = sellerId;
	}

	public String getCoupon() {
		return coupon;
	}

	public void setCoupon(String coupon) {
		this.coupon = coupon;
	}

	public Date getcDate() {
		return cDate;
	}

	public void setcDate(Date cDate) {
		this.cDate = cDate;
	}

	public String getcNotify() {
		return cNotify;
	}

	public void setcNotify(String cNotify) {
		this.cNotify = cNotify;
	}

	public String getcEnable() {
		return cEnable;
	}

	public void setcEnable(String cEnable) {
		this.cEnable = cEnable;
	}

	public String getcImg() {
		return cImg;
	}

	public void setcImg(String cImg) {
		this.cImg = cImg;
	}

	public String getcTumbImg() {
		return cThumbImg;
	}

	public void setcTumbImg(String cTumbImg) {
		this.cThumbImg = cTumbImg;
	}

	@Override
	public String toString() {
		return "CouponDTO [cSeq=" + cSeq + ", sellerId=" + sellerId + ", coupon=" + coupon + ", cDate=" + cDate
				+ ", cNotify=" + cNotify + ", cEnable=" + cEnable + ", cImg=" + cImg + ", cThumbImg=" + cThumbImg + "]";
	}

	
	
	
	
	
	
	
	

}
