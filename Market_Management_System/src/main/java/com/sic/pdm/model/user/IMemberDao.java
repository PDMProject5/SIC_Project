package com.sic.pdm.model.user;

import com.sic.pdm.vo.user.MemberVo;

public interface IMemberDao {

	
	public boolean singup(MemberVo vo);
	
	public boolean userdeliverylist(MemberVo vo);
	
	public String idchk(String id);
	
	public String loginchk(MemberVo vo);
	
	public String nowpwcheck(MemberVo vo);
	
	public boolean updatepw(MemberVo vo);
	
	public String signoutuserchk(MemberVo vo);
	
	public int signoutuser(String id);
	
	public int signoutusercoupon(String id);
	
	public int signoutusermileage(String id);
	
	public int signoutuserdeliverylist(String id);
	
	public int signoutuserrefund(String id);
	
	public int signoutuserorder(String id);
	
	public int deleteuser();
	
	public String findid(MemberVo vo);
	
	public String findpw(MemberVo vo);
}
