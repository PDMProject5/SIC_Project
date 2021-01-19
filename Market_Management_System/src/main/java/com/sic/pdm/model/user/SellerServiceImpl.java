package com.sic.pdm.model.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sic.pdm.vo.user.SellerVo;
@Service
public class SellerServiceImpl implements ISellerService {

	@Autowired
	private ISellerDao dao;
	
	@Override
	public String sellerloginchk(SellerVo vo) {
		return dao.sellerloginchk(vo);
	}

	@Override
	public List<SellerVo> sellerList() {
		
		return dao.sellerList();
	}

	@Override
	public SellerVo sellerOne(String sellerid) {
		
		return dao.sellerOne(sellerid);
	}

}
