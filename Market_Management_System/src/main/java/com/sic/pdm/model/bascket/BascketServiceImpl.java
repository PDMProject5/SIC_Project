package com.sic.pdm.model.bascket;

import java.util.List;
import java.util.Map;

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
	public List<BascketVo> getAllBascket(Map<String, Object> map) {
		
		return idao.getAllBascket(map);
	}
	
	@Override
	public boolean modifyBascket(Map<String, Object> map) {
		
		return idao.modifyBascket(map);
	}
	
	@Override
	public boolean deleteBascket(List<String> onums) {
		
		return idao.deleteBascket(onums);
	}
	
	@Override
	public BascketVo getOneBascket(Map<String, Object> map) {
		
		return idao.getOneBascket(map);
	}
	
	@Override
	public List<BascketVo> getOrderInfo(List<String> onums) {
		
		return idao.getOrderInfo(onums);
	}
	
	@Override
	public BascketVo checkBascket(Map<String, Object> map) {
		
		return idao.checkBascket(map);
	}
	
	@Override
	public boolean deleteBascketOne(String onum) {
		
		return idao.deleteBascketOne(onum);
	}
	
}
