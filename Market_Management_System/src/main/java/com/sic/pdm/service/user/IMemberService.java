package com.sic.pdm.service.user;

import com.sic.pdm.vo.user.MemberVo;

public interface IMemberService {

	
	public boolean singup(MemberVo vo);
	
	public String idchk(String id);
	
	public String loginchk(MemberVo vo);
}
