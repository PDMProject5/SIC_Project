package com.sic.pdm.model.coupon;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sic.pdm.vo.coupon.CouponBoxVo;
import com.sic.pdm.vo.coupon.CouponVo;


@Repository
public class CouponDaoImpl implements ICouponDao {
	
	private Logger log = LoggerFactory.getLogger(this.getClass());
	
	private String NS = "com.sic.pdm.model.coupon.ICouponDao.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<CouponVo> ViewListCoupon(String sellerid) {
		System.out.println("// CouponDaoImpl" + sellerid);
		return sqlSession.selectList(NS + "ViewListCoupon", sellerid);
	}
	
	@Override
	public CouponVo ViewCoupon(String cseq) {
		System.out.println("///// ViewCoupon " + cseq);
		return sqlSession.selectOne(NS + "ViewCoupon", cseq);
	}

	@Override
	public boolean insertCoupon(CouponVo cDto) {
		
		log.info("// CouponDaoImpl  insertCoupon " + cDto);
		
		int result = sqlSession.insert(NS + "insertCoupon", cDto);
		
		return (result > 0) ? true : false;
	}
	
	@Override
	public boolean insertCouponState(Map<String, Object> map) {
		System.out.println("/// CouponDaoImpl insertCouponState" + map);
		
		int result = sqlSession.insert(NS + "InsertCouponState", map);
		return (result > 0) ? true : false;
	}

	@Override
	public boolean updateCoupon(CouponVo cDto) {
		log.info("// CouponDaoImpl  updateCoupon {}" + cDto);
		int result = sqlSession.update(NS+"updateCoupon", cDto);
		return (result > 0) ? true : false;
		
	}
	
	@Override
	public boolean updateCouponState(String cdstate) {
		
		log.info("// CouponDaoImpl  updateCouponState {}" + cdstate);
		
		int result = sqlSession.update(NS+"updateStateCoupon", cdstate);
		
		return (result > 0) ? true : false;
	}

	@Override
	public boolean deleteCoupon(String cseq) {
		log.info("// CouponDaoImpl  deleteCoupon {}" + cseq);
		
		int result = sqlSession.delete(NS+"deleteCoupon", cseq);
		System.out.println(result);
		
		return (result > 0) ? true : false;
	}
	
	@Override
	public boolean getCoupon(Map<String, Object> map) {
		
		log.info("// CouponDaoImpl  getCoupon {}" + map);
		
		int result = sqlSession.insert(NS+"getCoupon", map);
		
		return (result > 0) ? true : false;
	}
	
	@Override
	public List<CouponVo> getCouponList(String id){
			
		return sqlSession.selectList(NS + "getCouponList", id);
	}

}
