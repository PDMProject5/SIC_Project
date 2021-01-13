package com.sic.pdm.model.bascket;

import java.util.List;

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
	public List<BascketVo> getAllBascket(String id) {
		logger.info("getAllBascket 확인");
		List<BascketVo> lists = session.selectList(NS+"getAllBascket",id);
		return lists;
	}
	

}
