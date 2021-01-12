package com.sic.pdm.model.del;

import java.util.List;
import java.util.Map;

import com.sic.pdm.vo.del.DelVo;






public interface DelIService {
	

	public List<DelVo> getDelList(String id);
	
	public boolean insertDel(DelVo vo);
	
	public boolean updateDel(DelVo vo);
	
	public boolean deleteDel(Map<String, Object> map);
	
	public DelVo getDefaultAddr(String id);
	
	
	public DelVo getOneDelList(String dnum);
}
