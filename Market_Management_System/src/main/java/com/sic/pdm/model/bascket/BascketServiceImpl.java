package com.sic.pdm.model.bascket;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.sic.pdm.vo.bascket.BascketVo;

@Service
public class BascketServiceImpl implements BascketIService {

	@Autowired
	private BascketIDao idao;
	
	@Override
	public boolean addBascket(BascketVo vo) {
		
		return idao.addBascket(vo);
	}

	@Override
	public boolean addDetailBascket(BascketVo vo) {
		
		return idao.addDetailBascket(vo);
	}

	@Override
	public List<BascketVo> getAllBascket(String id) {
		
		return idao.getAllBascket(id);
	}
	
}
