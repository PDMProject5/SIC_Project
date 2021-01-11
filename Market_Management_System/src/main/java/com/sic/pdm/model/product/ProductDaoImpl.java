package com.sic.pdm.model.product;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sic.pdm.vo.product.ProductVo;

@Repository
public class ProductDaoImpl implements IProductDao {
	
	private final String NS ="com.sic.pdm.sql.Product.";
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private SqlSessionTemplate service;

	@Override
	public List<ProductVo> getProdList(String sellerid) {
		logger.info("ProductDaoImpl getProdList()");
		List<ProductVo> lists = null;
		lists = service.selectList(NS + "getProdList", sellerid);
		return lists;
	}

}
