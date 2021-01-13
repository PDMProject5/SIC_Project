package com.sic.pdm.model.coupon;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sic.pdm.vo.coupon.CouponBoxVo;
import com.sic.pdm.vo.coupon.CouponVo;


@Service
public class CouponServiceImpl implements ICouponService {
	
	private Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private ICouponDao icDao;

	@Override
	public List<CouponVo> ViewListCoupon(String sellerid) {
		
		return icDao.ViewListCoupon(sellerid);
	}
	
	@Override
	public CouponVo ViewCoupon(String cseq) {
		return icDao.ViewCoupon(cseq);
	}

	@Override
	public boolean insertCoupon(CouponVo cDto) {
		
		log.info("// CouponServiceImpl  insertCoupon {}" + cDto);
		
		return icDao.insertCoupon(cDto);
	}
	
	@Override
	public boolean insertCouponState(Map<String, Object> map) {
		return icDao.insertCouponState(map);
	}

	@Override
	public boolean updateCoupon(CouponVo cDto) {
		
		log.info("// CouponServiceImpl  updateCoupon {}" + cDto);
		
		return icDao.updateCoupon(cDto);
	}
	
	@Override
	public boolean updateCouponState(String cdstate) {
		
		log.info("// CouponServiceImpl  updateCouponState {}" + cdstate);
		
		return false;
	}

	@Override
	public boolean deleteCoupon(String cseq) {
		
		log.info("// CouponServiceImpl  deleteCoupon {}"+ cseq);
		
		return icDao.deleteCoupon(cseq);
	}
	
	@Override
	public boolean getCoupon(String id) {
		
		log.info("// CouponServiceImpl  getCoupon {}" + id);
		
		return icDao.getCoupon(id);
	}
	
	@Override
	public List<CouponBoxVo> getCouponList(){
		
		return icDao.getCouponList();
		
	}

}
