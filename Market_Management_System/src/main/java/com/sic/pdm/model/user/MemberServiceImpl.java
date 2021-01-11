package com.sic.pdm.model.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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


	@Override
	public String nowpwcheck(MemberVo vo) {
		return dao.nowpwcheck(vo);
	}


	@Override
	public boolean updatepw(MemberVo vo) {
		return dao.updatepw(vo);
	}


	@Override
	public String signoutuserchk(MemberVo vo) {
		return dao.signoutuserchk(vo);
	}


	@Override
	public boolean signoutuser(String id) {
		boolean isc1 = dao.signoutuser(id);
		boolean isc2 = dao.signoutusercoupon(id);
		boolean isc3 = dao.signoutusermileage(id);
		return false;
	}


	@Override
	public int deleteuser() {
		return dao.deleteuser();
	}

	
}
