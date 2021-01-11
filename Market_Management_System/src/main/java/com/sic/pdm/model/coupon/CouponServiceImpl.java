package com.sic.pdm.model.coupon;

import java.util.List;

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
	public List<CouponVo> CouponList() {
		
		return icDao.CouponList();
	}

	@Override
	public boolean insertCoupon(CouponVo cDto) {
		
		log.info("// CouponServiceImpl  insertCoupon {}" + cDto);
		
		return icDao.insertCoupon(cDto);
	}

	@Override
	public boolean updateCoupon(CouponVo cDto) {
		
		log.info("// CouponServiceImpl  updateCoupon {}" + cDto);
		
		return icDao.updateCoupon(cDto);
	}

	@Override
	public boolean deleteCoupon(String seq) {
		
		log.info("// CouponServiceImpl  deleteCoupon {}"+ seq);
		
		return icDao.deleteCoupon(seq);
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

//	@Override
//	public boolean insertCouponState(Map<String, String[]> map) {
//		System.out.println("/// CouponServiceImpl " + map);
//		return icDao.insertCouponState(map);
//	}
	
	@Override
	public boolean insertCouponState(String cState) {
		System.out.println("/// CouponServiceImpl " + cState);
		return icDao.insertCouponState(cState);
	}

	@Override
	public CouponVo ViewListCoupon(List<CouponVo> cList) {
		return icDao.ViewListCoupon(cList);
	}
	
	

}
