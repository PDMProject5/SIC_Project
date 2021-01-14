package com.sic.pdm.model.product;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sic.pdm.vo.product.ProductVo;

@Service
public class ProductServiceImpl implements IProductService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private IProductDao dao;

	@Override
	public List<ProductVo> getProdList(String sellerid) {
		logger.info("ProductServiceImpl getProdList()");
		return dao.getProdList(sellerid);
	}

	@Override
	public List<ProductVo> getLcate() {
		logger.info("ProductServiceImpl getLcate()");
		return dao.getLcate();
	}

	@Override
	public List<ProductVo> getMcate() {
		logger.info("ProductServiceImpl getMcate()");
		return dao.getMcate();
	}

	@Override
	public List<ProductVo> getInven(String mcode) {
		logger.info("ProductServiceImpl getInven()");
		return dao.getInven(mcode);
	}

	@Override
	public ProductVo getProdDetail(Map<String, String> map) {
		logger.info("ProductServiceImpl getProdDetail()");
		return dao.getProdDetail(map);
	}

	@Override
	public boolean insertProdFood(Map<String, Object> insertMap) {
		logger.info("ProductServiceImpl insertProdFood()");
		return dao.insertProdFood(insertMap);
	}

	@Override
	public List<ProductVo> getProdMain(Map<String, String> map) {
		logger.info("ProductServiceImpl getProdMain()");
		return dao.getProdMain(map);
	}

	@Override
	public List<ProductVo> getProdMainDetail(Map<String, String> map) {
		logger.info("ProductServiceImpl getProdMainDetail()");
		return dao.getProdMainDetail(map);
	}
	
	@Override
	public boolean insertProd(Map<String, Object> insertMap) {
		logger.info("ProductServiceImpl insertProd()");
		return dao.insertProd(insertMap);
	}
	
	@Override
	public String chkFood(String icode) {
		logger.info("ProductServiceImpl chkFood()");
		return dao.chkFood(icode);
	}

}
