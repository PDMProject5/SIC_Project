package com.sic.pdm.model.payment;

import org.springframework.beans.factory.annotation.Autowired;

import com.sic.pdm.vo.coupon.CouponVo;
import com.sic.pdm.vo.mileage.MileageVo;
import com.sic.pdm.vo.payment.PaymentVo;

public class Payment_ServiceImpl implements Payment_IService {
	
	@Autowired
	private Payment_IDao iDao;

	@Override
	public boolean orderDetailpull(PaymentVo pvo) {
		return iDao.orderDetailpull(pvo);
	}

	@Override
	public boolean orderdel(PaymentVo pvo) {
		return iDao.orderdel(pvo);
	}

	@Override
	public boolean orderdel2(String onum) {
		return iDao.orderdel2(onum);
	}

	@Override
	public boolean delCoupon(CouponVo cvo) {
		return iDao.delCoupon(cvo);
	}

	@Override
	public boolean mileage(MileageVo mvo) {
		return iDao.mileage(mvo);
	}

}
