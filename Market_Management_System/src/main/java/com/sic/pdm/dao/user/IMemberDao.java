package com.sic.pdm.dao.user;

import com.sic.pdm.vo.user.MemberVo;

public interface IMemberDao {

	
	public boolean singup(MemberVo vo);
	
	public boolean userdeliverylist(MemberVo vo);
	
	public String idchk(String id);
	
	public String loginchk(MemberVo vo);
}
