package com.sic.pdm.model.or;

import java.util.List;

import com.sic.pdm.vo.or.RefoundVo;
import com.sic.pdm.vo.or.RefounddetailVo;

public interface Refound_IDao {
	
	public List<RefoundVo> refoundList();
	
	public RefounddetailVo refoundDetail();
	
	public boolean refoundModify (String onum);
	
	public boolean refoundApprove (String onum);
	
	public boolean refoundRefuse (String onum);
 
}
