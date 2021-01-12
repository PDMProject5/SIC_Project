package com.sic.pdm.model.del;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sic.pdm.vo.del.DelVo;


@Service
public class DelServiceImpl implements DelIService {

	@Autowired
	private DelIDao dao;
	
	@Override
	public List<DelVo> getDelList(String id) {
		
		return dao.getDelList(id);
	}

	@Override
	public boolean insertDel(DelVo vo) {
		// TODO Auto-generated method stub
		return dao.insertDel(vo);
	}

	@Override
	public boolean updateDel(DelVo vo) {
		// TODO Auto-generated method stub
		return dao.updateDel(vo);
	}

	@Override
	public boolean deleteDel(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.deleteDel(map);
	}

	@Override
	public DelVo getDefaultAddr(String id) {
		// TODO Auto-generated method stub
		return dao.getDefaultAddr(id);
	}


	
	@Override
	public DelVo getOneDelList(String dnum) {
		// TODO Auto-generated method stub
		return dao.getOneDelList(dnum);
	}
}
