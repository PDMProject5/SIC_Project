package com.sic.pdm.model.product;

import java.util.List;

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

}
