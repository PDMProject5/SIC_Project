package com.sic.pdm.model.coupon;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sic.pdm.vo.coupon.CouponVo;


@Repository
public class CouponDaoImpl implements ICouponDao {
	
	private Logger log = LoggerFactory.getLogger(this.getClass());
	
	private String NS = "com.sic.pdm.model.coupon.ICouponDao.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<CouponVo> storeCouponListY(String sellerid) {
		return sqlSession.selectList(NS + "storeCouponListY", sellerid);
	}
	
	@Override
	public int storeCouponTotal() {
		return sqlSession.selectOne(NS + "storeCouponTotal");
	}
	
	@Override
	public CouponVo viewOneCoupon(String cseq) {
		return sqlSession.selectOne(NS + "viewOneCoupon", cseq);
	}

	@Override
	public boolean insertCoupon(CouponVo cDto) {
		int result = sqlSession.insert(NS + "insertCoupon", cDto);
		return (result > 0) ? true : false;
	}
	
	@Override
	public boolean insertCouponState(Map<String, Object> map) {
		int result = sqlSession.insert(NS + "insertCouponState", map);
		return (result > 0) ? true : false;
	}

	@Override
	public boolean updateCoupon(CouponVo cDto) {
		log.info("// CouponDaoImpl  updateCoupon {}" + cDto);
		int result = sqlSession.update(NS+"updateCoupon", cDto);
		return (result > 0) ? true : false;
		
	}
	
	@Override
	public boolean updateStateCoupon(String cdstate) {
		int result = sqlSession.update(NS+"updateStateCoupon", cdstate);
		return (result > 0) ? true : false;
	}

	@Override
	public boolean deleteCoupon(String cseq) {
		int result = sqlSession.delete(NS+"deleteCoupon", cseq);
		return (result > 0) ? true : false;
	}
	
	@Override
	public boolean deleteCouponDetail(String cseq) {
		int result = sqlSession.delete(NS+"deleteCouponDetail", cseq);
		return (result > 0) ? true : false;
	}
	
	@Override
	public boolean autoEnableChange() {
		int result = sqlSession.update(NS + "autoEnableChange");
		return (result > 0) ? true : false;
	}
	
	@Override
	public List<CouponVo> userViewListCoupon(String sellerid) {
		return sqlSession.selectList(NS + "userViewListCoupon", sellerid);
	}
	
	@Override
	public CouponVo userViewOneCoupon(String cseq) {
		return sqlSession.selectOne(NS + "userViewOneCoupon", cseq);
	}
	
	@Override
	public boolean getCoupon(Map<String, Object> map) {
		int result = sqlSession.insert(NS+"getCoupon", map);
		return (result > 0) ? true : false;
	}
	
	@Override
	public List<CouponVo> getCouponList(String id){
		return sqlSession.selectList(NS + "getCouponList", id);
	}
	
	@Override
	public boolean autoGetCouponDel() {
		int result = sqlSession.delete(NS + "autoGetCouponDel");
		return (result > 0) ? true : false;
	}


}
