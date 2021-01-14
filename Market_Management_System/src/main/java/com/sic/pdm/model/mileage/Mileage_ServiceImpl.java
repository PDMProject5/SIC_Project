package com.sic.pdm.model.mileage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sic.pdm.vo.mileage.MileageVo;

@Service
public class Mileage_ServiceImpl implements Mileage_IService {
	
	@Autowired
	private Mileage_IDao iDao;

	@Override
	public MileageVo totalMiles(String id) {
		return iDao.totalMiles(id);
	}

	@Override
	public List<MileageVo> detailMiles(String id) {
		return iDao.detailMiles(id);
	}

}
