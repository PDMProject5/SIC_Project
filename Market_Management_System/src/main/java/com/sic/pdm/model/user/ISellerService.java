package com.sic.pdm.model.user;

import java.util.List;

import com.sic.pdm.vo.user.SellerVo;

public interface ISellerService {
	
	public String sellerloginchk(SellerVo vo);
	
	public List<SellerVo> sellerList();
	
	public SellerVo sellerOne(String sellerid);
}
