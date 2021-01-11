package com.sic.pdm.model.product;

import java.util.List;

import com.sic.pdm.vo.product.ProductVo;

public interface IProductService {
	
	/**
	 * 사용자 시점에서의 제품목록을 시각화해줌
	 * @author KGH 김기홍
	 * @return ProductVo(INAME, STOCK(SUM))
	 */
	public List<ProductVo> getProdList(String sellerid);

}
