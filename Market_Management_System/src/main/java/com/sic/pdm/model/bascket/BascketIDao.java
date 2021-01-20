package com.sic.pdm.model.bascket;

import java.util.List;
import java.util.Map;

import com.sic.pdm.vo.bascket.BascketVo;

public interface BascketIDao {

	public boolean addBascket(BascketVo vo);
	
	public boolean addDetailBascket(BascketVo vo);
	
	public List<BascketVo> getAllBascket(Map<String, Object> map);
	
	public BascketVo getOneBascket(Map<String, Object> map);
	
	public boolean modifyBascket(Map<String, Object> map);
	
	public boolean deleteBascket(List<String> onums);
	
	public boolean deleteBascketOne(String onum);
	
	public List<BascketVo> getOrderInfo(List<String> onums);
	
	public BascketVo checkBascket(Map<String, Object> map);
}
