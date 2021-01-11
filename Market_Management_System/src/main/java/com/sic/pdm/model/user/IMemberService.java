package com.sic.pdm.model.user;

import com.sic.pdm.vo.user.MemberVo;

public interface IMemberService {

	
	public boolean singup(MemberVo vo);
	
	public String idchk(String id);
	
	public String loginchk(MemberVo vo);
	
	public String nowpwcheck(MemberVo vo);
	
	public boolean updatepw(MemberVo vo);
	
	public String signoutuserchk(MemberVo vo);
	
	public boolean signoutuser(String id);
	
	public int deleteuser();
}
