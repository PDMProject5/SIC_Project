package com.sic.pdm.impl.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sic.pdm.dao.user.ISellerDao;
import com.sic.pdm.service.user.ISellerService;
import com.sic.pdm.vo.user.SellerVo;
@Service
public class SellerServiceImpl implements ISellerService {

	@Autowired
	private ISellerDao dao;
	
	@Override
	public String sellerloginchk(SellerVo vo) {
		return dao.sellerloginchk(vo);
	}

}
