package com.sic.pdm.model.autoorder;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sic.pdm.vo.autoorder.AutoOrderVo;

@Repository
public class AutoOrderDaoImpl implements IAutoOrderDao {

	@Autowired
	private SqlSessionTemplate service;
	
	private String NS = "com.sic.pdm.sql.AutoOrder.";
	
	@Override
	public List<AutoOrderVo> autoOrderList(String sellerid) {
		List<AutoOrderVo> lists = service.selectList(NS+"autoOrderList", sellerid);
		return lists;
	}

	@Override
	public AutoOrderVo autoOrderDetail(String iname) {
		AutoOrderVo vo = service.selectOne(NS+"autoOrderDetail", iname);
		return vo;
	}

	@Override
	public boolean updateautoOrder(AutoOrderVo vo) {
		int n = service.update(NS+"updateautoOrder", vo);
		return n>0?true:false;
	}

	@Override
	public List<AutoOrderVo> searchitem(String iname) {
		List<AutoOrderVo> lists = service.selectList(NS+"searchitem", iname);
		return lists;
	}

	@Override
	public boolean insertAutoOrder(AutoOrderVo vo) {
		int n = service.insert(NS+"insertAutoOrder", vo);
		return n>0?true:false;
	}

	@Override
	public boolean deleteAutoOrder(Map<String, Object> iname) {
		int n = service.delete(NS+"deleteAutoOrder", iname);
		return n>0?true:false;
	}



}
