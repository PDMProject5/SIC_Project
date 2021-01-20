package com.sic.pdm.model.bascket;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.sic.pdm.vo.bascket.BascketVo;

@Repository
public class BascketDaoImpl implements BascketIDao {

	private final String NS="com.sic.pdm.model.BascketIDao.";
	private Logger logger = LoggerFactory.getLogger(this.getClass()); 
	
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public boolean addBascket(BascketVo vo) {
		logger.info("addBascket 확인");
		int n = session.insert(NS+"addBascket", vo);
		return n>0?true:false;
	}

	@Override
	public boolean addDetailBascket(BascketVo vo) {
		logger.info("addDetailBascket 확인");
		int n = session.insert(NS+"addDetailBascket",vo);
		return n>0?true:false;
	}
	
	@Override
	public List<BascketVo> getAllBascket(Map<String, Object> map) {
		logger.info("getAllBascket 확인");
		List<BascketVo> lists = session.selectList(NS+"getAllBascket",map);
		return lists;
	}
	
	@Override
	public boolean deleteBascket(List<String> onums) {
		logger.info("deleteBascket 확인");
		int n = session.delete(NS+"deleteBascket", onums);
		return n>0?true:false;
	}
	
	@Override
	public boolean modifyBascket(Map<String, Object> map) {
		logger.info("modifyBascket 확인");
		int n = session.update(NS+"modifyBascket", map);
		return n>0?true:false;
	}
	
	@Override
	public BascketVo getOneBascket(Map<String, Object> map) {
		logger.info("getOneBascket 확인");
		BascketVo vo = session.selectOne(NS+"getOneBascket", map);
		return vo;
	}
	
	@Override
	public List<BascketVo> getOrderInfo(List<String> onums) {
		logger.info("getOrderInfo 확인");
		List<BascketVo> lists = session.selectList(NS+"getOrderInfo", onums);
		return lists;
	}
	
	@Override
	public BascketVo checkBascket(Map<String, Object> map) {
		logger.info("checkBascket");
		BascketVo vo = session.selectOne(NS+"checkBascket", map);
		return vo;
	}
	
	@Override
	public boolean deleteBascketOne(String onum) {
		int n = session.delete(NS+"deleteBascketOne", onum);
		return n>0?true:false;
	}
}
