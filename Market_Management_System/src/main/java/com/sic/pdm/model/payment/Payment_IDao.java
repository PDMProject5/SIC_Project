package com.sic.pdm.model.payment;

import java.util.Map;

import com.sic.pdm.vo.bascket.BascketVo;
import com.sic.pdm.vo.coupon.CouponVo;
import com.sic.pdm.vo.mileage.MileageVo;
import com.sic.pdm.vo.payment.PaymentVo;

public interface Payment_IDao {
	
	// 결제완료된 주문 orderDetail에 넣기
	public boolean orderDetailpull(PaymentVo pvo);
	
	// 주문 상태 변경(배송지 O)
	public boolean orderdel(PaymentVo pvo);
	
	// 주문 상태 변경(배송지 X)
	public boolean orderdel2(String onum);
	
	// 사용한 쿠폰 삭제
	public boolean delCoupon(CouponVo cvo);
	
	// 결제완료 시 마일리지 적립
	public boolean mileage(MileageVo mvo);
	
	// 결제내역 insert
	public boolean payment(PaymentVo pvo);
	
	// 주문번호 불러오기
	public BascketVo orderonum(String onum);

}
