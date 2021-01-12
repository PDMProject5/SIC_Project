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

}