package com.sic.pdm.model.user;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sic.pdm.vo.user.MemberVo;

@Repository
public class MemberDaoImpl implements IMemberDao{

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
	public int signoutuser(String id) {
		int n  = service.update(NS+"signoutuser", id);
		return n;
	}


	@Override
	public int signoutusercoupon(String id) {
		int n = service.delete(NS+"signoutusercoupon", id);
		return n;
	}

	@Override
	public int signoutusermileage(String id) {
		int n = service.delete(NS+"signoutusermileage", id);
		return n;
	}

	@Override
	public int signoutuserdeliverylist(String id) {
		int n = service.delete(NS+"signoutuserdeliverylist", id);
		return n;
	}
	
	@Override
	public int signoutuserrefund(String id) {
		int n = service.delete(NS+"signoutuserrefund", id);
		return n;
	}
	
	@Override
	public int signoutuserorder(String id) {
		int n = service.delete(NS+"signoutuserorder", id);
		return n;
	}

	@Override
	public int deleteuser() {
		int n = service.delete(NS+"deleteuser");
		return n;
	}

	@Override
	public String findid(MemberVo vo) {
		String findid = service.selectOne(NS+"findid", vo);
		return findid;
	}

	@Override
	public String findpw(MemberVo vo) {
		String findpw = service.selectOne(NS+"findpw", vo);
		return findpw;
	}
	
	
}
