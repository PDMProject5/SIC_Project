package com.sic.pdm.model.or;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sic.pdm.vo.or.OrderVo;
import com.sic.pdm.vo.or.OrderdetailVo;

@Service
public class OrderList_ServiceImpl implements OrderList_IService {
	
	@Autowired
	private OrderList_IDao iDao;

	@Override
	public List<OrderVo> orderList() {
		return iDao.orderList();
	}

	@Override
	public List<OrderdetailVo> orderDetail() {
		return iDao.orderDetail();
	}

}
