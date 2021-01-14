package com.sic.pdm.model.autoorder;

import java.util.List;
import java.util.Map;

import com.sic.pdm.vo.autoorder.AutoOrderVo;

public interface IAutoOrderDao {

	public List<AutoOrderVo> autoOrderList(String sellerid);
	
	public AutoOrderVo autoOrderDetail(String iname);
	
	public boolean updateautoOrder(AutoOrderVo vo);
	
	public List<AutoOrderVo> searchitem(String iname);
	
	public boolean insertAutoOrder(AutoOrderVo vo);
	
	public boolean deleteAutoOrder(Map<String, Object> iname);
	
	public List<AutoOrderVo> autoOrder();
	
	public AutoOrderVo autoOrderchk(AutoOrderVo data);
	
	public String foodchk(String itemchk);
	
	public boolean insertAuto(AutoOrderVo vo);
	
	public boolean insertAutoFood(AutoOrderVo vo);
}