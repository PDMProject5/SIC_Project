package com.sic.pdm.model.user;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sic.pdm.vo.user.SellerVo;

@Repository
public class SellerDaoImpl implements ISellerDao {

	@Autowired
	private SqlSessionTemplate service;
	
	private String NS = "com.sic.pdm.sql.Seller.";
	
	@Override
	public String sellerloginchk(SellerVo vo) {
		String sellerData = service.selectOne(NS+"sellerloginchk", vo);
		return sellerData;
	}

	

}
