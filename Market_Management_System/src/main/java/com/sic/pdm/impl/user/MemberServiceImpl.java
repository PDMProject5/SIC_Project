package com.sic.pdm.impl.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sic.pdm.dao.user.IMemberDao;
import com.sic.pdm.service.user.IMemberService;
import com.sic.pdm.vo.user.MemberVo;

@Service
public class MemberServiceImpl implements IMemberService {

	@Autowired
	IMemberDao dao;
	
	@Override
	public boolean singup(MemberVo vo) {
		boolean isc1 = dao.singup(vo);
		boolean isc2 = dao.userdeliverylist(vo);
		return (isc1||isc2)?true:false;
	}


	@Override
	public String idchk(String id) {
		return dao.idchk(id);
	}


	@Override
	public String loginchk(MemberVo vo) {
		return dao.loginchk(vo);
	}

	
}
