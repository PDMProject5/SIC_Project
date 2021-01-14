package com.sic.pdm.model.autoorder;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sic.pdm.vo.autoorder.AutoOrderVo;

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



}
