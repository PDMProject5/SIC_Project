package com.sic.pdm.model.coupon;

import java.util.List;
import java.util.Map;

import com.sic.pdm.vo.coupon.CouponVo;

public interface ICouponDao {
	
	// 판매자 쿠폰 조회
	public List<CouponVo> ViewListCoupon(String sellerid);
	
	// 원하는 쿠폰 클릭시 조회
	public CouponVo ViewCoupon(String cseq);
	
	// 판매자 쿠폰 등록
	public boolean insertCoupon(CouponVo cDto);
	
	// 판매자 쿠폰 종류 등록
	public boolean insertCouponState(Map<String, Object> map);
	
	// 판매자 쿠폰 수정
	public boolean updateCoupon(CouponVo cDto);
	
	// 판매자 쿠폰 종류 수정
	public boolean updateCouponState(String cdstate);
		
	// 판매자 쿠폰 삭제
	public boolean deleteCoupon(String cseq);
	
	// 사용자 쿠폰 수령
	public boolean getCoupon(Map<String, Object> map);
	
	// 사용자 수령 쿠폰 조회
	public List<CouponVo> getCouponList(String id);

}
