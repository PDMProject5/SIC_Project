package com.sic.pdm.model.coupon;

import java.util.List;
import java.util.Map;

import com.sic.pdm.vo.coupon.CouponVo;

public interface ICouponDao {
	
	// 판매자 - 운영 매장 쿠폰 조회
	public List<CouponVo> viewListCoupon(String sellerid);
			
	// 판매자 - 쿠폰 상세 조회
	public CouponVo viewOneCoupon(String cseq);
			
	// 판매자 - 쿠폰 등록
	public boolean insertCoupon(CouponVo cDto);
				
	// 판매자 - 쿠폰 종류 등록
	public boolean insertCouponState(Map<String, Object> map);
				
	// 판매자 - 쿠폰 수정
	public boolean updateCoupon(CouponVo cDto);

	// 판매자 - 쿠폰 종류 수정
	public boolean updateCouponState(String cdstate);
					
	// 판매자 - 쿠폰 삭제
	public boolean deleteCoupon(String cseq);
	
	// 판매자 - 등록 후 30 경과시 쿠폰 지급 가능상태 변경
	public boolean autoEnableChange();
			
	// 회원 - 매장 행사 정보
	public List<CouponVo> userViewListCoupon(String sellerid);
			
	// 회원 - 매장 쿠폰 상세 조회
	public CouponVo userViewOneCoupon(String cseq);
			
	// 회원 - 쿠폰 수령
	public boolean getCoupon(Map<String, Object> map);
				
	// 회원 - 쿠폰 내역 조회
	public List<CouponVo> getCouponList(String id);
		
	// 회원 - 쿠폰 수령 7일 이후 삭제
	public boolean autoGetCouponDel();

}
