package com.sic.pdm.model.mileage;

import java.util.List;

import com.sic.pdm.vo.mileage.MileageVo;

public interface Mileage_IDao {
	
	public MileageVo totalMiles(String id);
	
	public List<MileageVo> detailMiles(String id);

}
