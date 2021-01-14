package com.sic.pdm.model.product;

import java.util.List;
import java.util.Map;

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

	@Override
	public List<ProductVo> getLcate() {
		logger.info("ProductDaoImpl getLcate()");
		List<ProductVo> lists = null;
		lists = service.selectList(NS + "getLcate");
		return lists;
	}

	@Override
	public List<ProductVo> getMcate() {
		logger.info("ProductDaoImpl getMcate()");
		List<ProductVo> lists = null;
		lists = service.selectList(NS + "getMcate");
		return lists;
	}

	@Override
	public List<ProductVo> getInven(String mcode) {
		logger.info("ProductDaoImpl getInven()");
		List<ProductVo> lists = null;
		lists = service.selectList(NS + "getInven", mcode);
		return lists;
	}

	@Override
	public ProductVo getProdDetail(Map<String, String> map) {
		logger.info("ProductDaoImpl getProdDetail()");
		ProductVo vo = service.selectOne(NS + "getProdDetail", map);
		return vo;
	}

	@Override
	public boolean insertProdFood(Map<String, Object> insertMap) {
		logger.info("ProductDaoImpl insertProdFood()");
		int count = service.insert(NS + "insertProdFood", insertMap);
		return count > 0 ? true : false;
	}

	@Override
	public List<ProductVo> getProdMain(Map<String, String> map) {
		logger.info("ProductDaoImpl getProdMain()");
		List<ProductVo> lists = null;
		lists = service.selectList(NS + "getProdMain", map);
		return lists;
	}

	@Override
	public List<ProductVo> getProdMainDetail(Map<String, String> map) {
		logger.info("ProductDaoImpl getProdMainDetail()");
		List<ProductVo> lists = null;
		lists = service.selectList(NS + "getProdMainDetail", map);
		return lists;
	}
	
	@Override
	public boolean insertProd(Map<String, Object> insertMap) {
		logger.info("ProductDaoImpl insertProd()");
		int count = service.insert(NS+"insertProd", insertMap);
		return count > 0 ? true : false;
	}
	
	@Override
	public String chkFood(String icode) {
		logger.info("ProductDaoImpl chkFood()");
		String chkFood = service.selectOne(NS+"chkFood", icode);
		return chkFood;
	}

}
