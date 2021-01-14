package com.sic.pdm.model.bascket;

import java.util.List;


import com.sic.pdm.vo.bascket.BascketVo;

public interface BascketIDao {

	public boolean addBascket(BascketVo vo);
	
	public boolean addDetailBascket(BascketVo vo);
	
	public List<BascketVo> getAllBascket(String id);
	
	
}
