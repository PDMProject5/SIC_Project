package com.sic.pdm.model.payment;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sic.pdm.vo.coupon.CouponVo;
import com.sic.pdm.vo.mileage.MileageVo;
import com.sic.pdm.vo.payment.PaymentVo;

@Repository
public class Payment_DaoImpl implements Payment_IDao {
	
	private final String NS = "com.sic.pdm.model.payment.Payment_IDao.";
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private SqlSessionTemplate sqlsession;

	@Override
	public boolean orderDetailpull(PaymentVo pvo) {
		logger.info("Payment_DaoImpl orderDetailpull");
		int n = sqlsession.insert(NS+"orderDetailpull",pvo);
		return n>0?true:false;
	}

	@Override
	public boolean orderdel(PaymentVo pvo) {
		logger.info("Payment_DaoImpl orderdel");
		int n = sqlsession.update(NS+"orderdel",pvo);
		return n>0?true:false;
	}

	@Override
	public boolean orderdel2(String onum) {
		logger.info("Payment_DaoImpl orderdel2 {}", onum);
		int n = sqlsession.update(NS+"orderdel2",onum);
		return n>0?true:false;
	}

	@Override
	public boolean delCoupon(CouponVo cvo) {
		logger.info("Payment_DaoImpl delCoupon");
		int n = sqlsession.delete(NS+"delCoupon", cvo);
		return n>0?true:false;
	}

	@Override
	public boolean mileage(MileageVo mvo) {
		logger.info("Payment_DaoImpl mileage");
		int n = sqlsession.delete(NS+"mileage", mvo);
		return n>0?true:false;
	}

}
