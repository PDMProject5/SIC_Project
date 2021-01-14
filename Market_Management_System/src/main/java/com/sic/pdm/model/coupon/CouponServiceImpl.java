package com.sic.pdm.model.coupon;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sic.pdm.vo.coupon.CouponVo;


@Service
public class CouponServiceImpl implements ICouponService {
	
	private Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private ICouponDao icDao;

	@Override
	public List<CouponVo> viewListCoupon(String sellerid) {
		return icDao.viewListCoupon(sellerid);
	}
	
	@Override
	public CouponVo viewOneCoupon(String cseq) {
		return icDao.viewOneCoupon(cseq);
	}

	@Override
	public boolean insertCoupon(CouponVo cDto) {
		return icDao.insertCoupon(cDto);
	}
	
	@Override
	public boolean insertCouponState(Map<String, Object> map) {
		return icDao.insertCouponState(map);
	}

	@Override
	public boolean updateCoupon(CouponVo cDto) {
		return icDao.updateCoupon(cDto);
	}
	
	@Override
	public boolean updateCouponState(String cdstate) {
		return icDao.updateCouponState(cdstate);
	}

	@Override
	public boolean deleteCoupon(String cseq) {
		return icDao.deleteCoupon(cseq);
	}
	
	@Override
	public boolean autoEnableChange() {
		return icDao.autoEnableChange();
	}
	
	@Override
	public boolean getCoupon(Map<String, Object> map) {
		return icDao.getCoupon(map);
	}
	
	@Override
	public List<CouponVo> getCouponList(String id){
		return icDao.getCouponList(id);
	}

	@Override
	public CouponVo userViewOneCoupon(String cseq) {
		return icDao.userViewOneCoupon(cseq);
	}

	@Override
	public List<CouponVo> userViewListCoupon(String sellerid) {
		return icDao.userViewListCoupon(sellerid);
	}

	@Override
	public boolean autoGetCouponDel() {
		return icDao.autoGetCouponDel();
	}

}
