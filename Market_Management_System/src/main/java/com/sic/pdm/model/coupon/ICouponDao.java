package com.sic.pdm.model.coupon;

import java.util.List;

import com.sic.pdm.vo.coupon.CouponBoxVo;
import com.sic.pdm.vo.coupon.CouponVo;


public interface ICouponDao {
	
	// 판매자 쿠폰 조회
	public List<CouponVo> CouponList();
	
	public CouponVo ViewListCoupon(List<CouponVo> cList);
	
	// 판매자 쿠폰 등록
	public boolean insertCoupon(CouponVo cDto);
	
	// 판매자 쿠폰 수정
	public boolean updateCoupon(CouponVo cDto);
		
	// 판매자 쿠폰 삭제
	public boolean deleteCoupon(String seq);
	
	// 사용자 쿠폰 수령
	public boolean getCoupon(String id);
	
	// 수령 쿠폰 조회
	public List<CouponBoxVo> getCouponList();
	
	// 쿠폰 종류 선택
//	public boolean insertCouponState(Map<String,String[]> map);
	
	// 쿠폰 종류 선택
	public boolean insertCouponState(String cState);

}
