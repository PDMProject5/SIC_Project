package com.sic.pdm.model.or;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sic.pdm.vo.or.OrderVo;
import com.sic.pdm.vo.or.OrderdetailVo;

@Repository
public class OrderList_DaoImpl implements OrderList_IDao {
	
	private final String NS = "com.sic.pdm.model.or.OrderList_IDao.";
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private SqlSessionTemplate sqlsession;

	@Override
	public List<OrderVo> orderList() {
		List<OrderVo> lists = null;
		logger.info("OrderList_DaoImpl orderList");
		lists = sqlsession.selectList(NS+"orderList");
		return lists;
	}

	@Override
	public List<OrderdetailVo> orderDetail() {
		List<OrderdetailVo> listss = null;
		logger.info("OrderList_DaoImpl orderDetail");
		listss = sqlsession.selectList(NS+"orderDetail");
		return listss;
	}

}
