package com.sic.pdm.model.or;

import java.util.List;

import com.sic.pdm.vo.or.OrderVo;
import com.sic.pdm.vo.or.OrderdetailVo;

public interface OrderList_IService {
	
	public List<OrderVo> orderList(String id);
	
	public List<OrderdetailVo> orderDetail(String onum);

	public int getPrice(List<String> odnum);
	
	public int getMPrice(String id);
	
	public int getCPrice(String cseq);
	
	public boolean mmoney(String id);
	
	public OrderVo oVo(String onum);
	
}
