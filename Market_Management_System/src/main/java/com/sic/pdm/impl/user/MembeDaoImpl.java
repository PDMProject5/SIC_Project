package com.sic.pdm.impl.user;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sic.pdm.dao.user.IMemberDao;
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
	
	
	
}
