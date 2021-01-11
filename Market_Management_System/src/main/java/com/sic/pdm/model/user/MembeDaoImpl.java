package com.sic.pdm.model.user;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sic.pdm.vo.user.MemberVo;

@Repository
public class MembeDaoImpl implements IMemberDao{

	private final String NS ="com.sic.pdm.sql.Member.";
	
	@Autowired
	private SqlSessionTemplate service;

	@Override
	public boolean singup(MemberVo vo) {
		int n  = service.insert(NS+"singup", vo);
		return n>0?true:false;
	}

	@Override
	public boolean userdeliverylist(MemberVo vo) {
		int n = service.insert(NS+"userdeliverylist", vo);
		return n>0?true:false;
	}

	@Override
	public String idchk(String id) {
		String chkid = service.selectOne(NS+"idchk", id);
		return chkid;
	}

	@Override
	public String loginchk(MemberVo vo) {
		String login = service.selectOne(NS+"loginchk", vo);
		return login;
	}

	@Override
	public String nowpwcheck(MemberVo vo) {
		String nowpw = service.selectOne(NS+"nowpwcheck", vo);
		return nowpw;
	}

	@Override
	public boolean updatepw(MemberVo vo) {
		int n = service.update(NS+"updatepw", vo);
		return n>0?true:false;
	}

	@Override
	public String signoutuserchk(MemberVo vo) {
		String id = service.selectOne(NS+"signoutuserchk", vo);
		return id;
	}

	@Override
	public boolean signoutuser(String id) {
		int n  = service.update(NS+"signoutuser", id);
		return n>0?true:false;
	}


	@Override
	public boolean signoutusercoupon(String id) {
		int n = service.delete(NS+"signoutusercoupon", id);
		return n>0?true:false;
	}

	@Override
	public boolean signoutusermileage(String id) {
		int n = service.delete(NS+"signoutusermileage", id);
		return n>0?true:false;
	}

	@Override
	public boolean signoutuserdeliverylist(String id) {
		int n = service.delete(NS+"signoutuserdeliverylist", id);
		return n>0?true:false;
	}
	
	@Override
	public int deleteuser() {
		int n = service.delete(NS+"deleteuser");
		return n;
	}
	
	
}
