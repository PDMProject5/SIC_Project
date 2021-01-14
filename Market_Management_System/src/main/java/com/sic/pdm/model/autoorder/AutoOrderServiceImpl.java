package com.sic.pdm.model.autoorder;

import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sic.pdm.vo.autoorder.AutoOrderVo;
import com.sic.pdm.vo.user.SellerVo;

@Service
public class AutoOrderServiceImpl implements IAutoOrderService {

	@Autowired
	private IAutoOrderDao dao;
	
	@Override
	public List<AutoOrderVo> autoOrderList(String sellerid) {
		return dao.autoOrderList(sellerid);
	}

	@Override
	public AutoOrderVo autoOrderDetail(String iname) {
		return dao.autoOrderDetail(iname);
	}

	@Override
	public boolean updateautoOrder(AutoOrderVo vo) {
		return dao.updateautoOrder(vo);
	}

	@Override
	public List<AutoOrderVo> searchitem(String iname) {
		return dao.searchitem(iname);
	}

	@Override
	public boolean insertAutoOrder(AutoOrderVo vo) {
		return dao.insertAutoOrder(vo);
	}

	@Override
	public boolean deleteAutoOrder(Map<String, Object> iname) {
		return dao.deleteAutoOrder(iname);
	}

	@Override
	public List<AutoOrderVo> autoOrder() {
		return dao.autoOrder();
	}

	@Override
	public AutoOrderVo autoOrderchk(AutoOrderVo data) {
		return dao.autoOrderchk(data);
	}

	@Override
	public boolean insertAuto(AutoOrderVo vo) {
		return dao.insertAuto(vo);
	}

	@Override
	public String foodchk(String itemchk) {
		return dao.foodchk(itemchk);
	}

	@Override
	public boolean insertAutoFood(AutoOrderVo vo) {
		return dao.insertAutoFood(vo);
	}

	@Override
	public List<SellerVo> sellerList() {
		return dao.sellerList();
	}

	@Override
	public List<String> zeroList(String sellerid) {
		return dao.zeroList(sellerid);
	}




}
