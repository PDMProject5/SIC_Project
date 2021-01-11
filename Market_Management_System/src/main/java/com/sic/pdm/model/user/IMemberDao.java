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
	
	public boolean signoutuser(String id);
	
	public boolean signoutusercoupon(String id);
	
	public boolean signoutusermileage(String id);
	
	public boolean signoutuserdeliverylist(String id);
	
	public int deleteuser();
}
