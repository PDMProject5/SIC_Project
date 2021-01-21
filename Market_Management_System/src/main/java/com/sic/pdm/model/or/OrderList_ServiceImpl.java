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
	public List<OrderVo> orderList(String id) {
		return iDao.orderList(id);
	}

	@Override
	public List<OrderdetailVo> orderDetail(String onum) {
		return iDao.orderDetail(onum);
	}

	@Override
	public int getPrice(List<String> odnum) {
		return iDao.getPrice(odnum);
	}
	
	@Override
	public int getCPrice(String cseq) {
		// TODO Auto-generated method stub
		return iDao.getCPrice(cseq);
	}
	
	@Override
	public int getMPrice(String id) {
		return iDao.getMPrice(id);
	}
	
}
