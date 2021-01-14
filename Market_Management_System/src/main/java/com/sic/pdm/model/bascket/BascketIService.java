package com.sic.pdm.model.bascket;

import java.util.List;
import java.util.Map;

import com.sic.pdm.vo.bascket.BascketVo;

public interface BascketIService {

	public boolean addBascket(BascketVo vo);
	
	public boolean addDetailBascket(BascketVo vo);
	
	public List<BascketVo> getAllBascket(String id);
	
	public BascketVo getOneBascket(Map<String, Object> map);
	
	public boolean modifyBascket(Map<String, Object> map);
	
	public boolean deleteBascket(List<String> onums);
	
	public List<BascketVo> getOrderInfo(List<String> onums);
	
}
