package com.sic.pdm.model.or;

import java.util.List;

import com.sic.pdm.vo.or.OrderVo;
import com.sic.pdm.vo.or.OrderdetailVo;

public interface OrderList_IDao {
	
	public List<OrderVo> orderList(String id);
	
	public List<OrderdetailVo> orderDetail(String onum);
	
	
}