package com.sic.pdm.model.coupon;

import java.util.List;

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
	public List<CouponVo> CouponList() {
		
		
		return sqlSession.selectList(NS + "CouponList");
	}

	@Override
	public boolean insertCoupon(CouponVo cDto) {
		
		log.info("// CouponDaoImpl  insertCoupon {}" + cDto);
		
		int result = sqlSession.insert(NS+"insertCoupon", cDto);
		System.out.println(result);
		
		return (result > 0) ? true : false;
	}

	@Override
	public boolean updateCoupon(CouponVo cDto) {
		
		log.info("// CouponDaoImpl  updateCoupon {}" + cDto);
		
		int result = sqlSession.update(NS+"updateCoupon", cDto);
		System.out.println(result);
		
		return (result > 0) ? true : false;
		
	}

	@Override
	public boolean deleteCoupon(String seq) {
		log.info("// CouponDaoImpl  deleteCoupon {}" + seq);
		
		int result = sqlSession.delete(NS+"deleteCoupon", seq);
		System.out.println(result);
		
		return (result > 0) ? true : false;
	}
	
	@Override
	public boolean getCoupon(String id) {
		
		log.info("// CouponDaoImpl  getCoupon {}" + id);
		
		int result = sqlSession.insert(NS+"getCoupon", id);
		
		return (result > 0) ? true : false;
	}
	
	@Override
	public List<CouponBoxVo> getCouponList(){
			
		return sqlSession.selectList(NS + "getCouponList");
	}

//	@Override
//	public boolean insertCouponState(Map<String, String[]> map) {
//		System.out.println("/// CouponDaoImpl " + map);
//		
//		int result = sqlSession.insert(NS+"CouponStateInsert", map);
//		return (result > 0) ? true : false;
//	}
	
	@Override
	public boolean insertCouponState(String cState) {
		System.out.println("/// CouponDaoImpl " + cState);
		
		int result = sqlSession.insert(NS+"CouponStateInsert", cState);
		return (result > 0) ? true : false;
	}

	@Override
	public CouponVo ViewListCoupon(List<CouponVo> cList) {
		
		return (CouponVo)sqlSession.selectList(NS + "CouponList", cList);
		
	}

}
