package com.sic.pdm.model.or;

import java.util.List;
import java.util.Map;

import com.sic.pdm.vo.or.OrderVo;
import com.sic.pdm.vo.or.RefoundVo;
import com.sic.pdm.vo.or.RefounddetailVo;

public interface Refound_IDao {
	
	public List<RefoundVo> refoundList();
	
	public RefounddetailVo refoundDetail(Map<String, Object> map);
	
	public OrderVo gorefund(String onum);
	
	public boolean refund(Map<String, Object> map);
	
	public boolean refoundModify (String onum);
	
	public boolean refoundApprove (String onum);
	
	public boolean refoundRefuse (String onum);
 
}
