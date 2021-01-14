package com.sic.pdm.model.product;

import java.util.List;
import java.util.Map;

import com.sic.pdm.vo.product.ProductVo;

public interface IProductService {
	
	/**
	 * 사용자 시점에서의 제품목록을 시각화해줌
	 * @author KGH 김기홍
	 * @return ProductVo(INAME, STOCK(SUM))
	 */
	public List<ProductVo> getProdList(String sellerid);
	
	/**
	 * 대분류 카테고리 전체를 조회
	 * @author KGH 김기홍
	 * @return ProductVo(LCODE, LNAME)
	 */
	public List<ProductVo> getLcate();
	
	/**
	 * 중분류 카테고리 전체를 조회
	 * @author KGH 김기홍
	 * @return ProductVo(MCODE, LCODE, MNAME)
	 */
	public List<ProductVo> getMcate();
	
	/**
	 * 선택된 중분류에 해당하는 재고 목록
	 * @author KGH 김기홍
	 * @param String(mcode)
	 * @return ProductVo(ICODE, MCODE, INAME)
	 */
	public List<ProductVo> getInven(String mcode);
	
	/**
	 * 재고 상세 정보
	 * @param Map<String, String> (sellerid, iname)
	 * @return ProductVo(PCODE, SELLERID, ICODE, ROTNUM, PDATE, LIFETIME, STOCK, INAME)
	 * 
	 */
	public ProductVo getProdDetail(Map<String, String> map);
	
	/**
	 * 제품등록(식품)
	 * 유통기한을 입고일기준 7일 후
	 * @param insertMap(String SELLERID, String[] ICODE)
	 * @return boolean
	 */
	public boolean insertProdFood(Map<String, Object> insertMap);
	
	/**
	 * 판매자 재고현황 Main Grid 
	 * @author KGH 김기홍
	 * @param sellerid
	 * @return ProductVo(INAME, ROTNUM, OPRICE, STOCK)
	 */
	public List<ProductVo> getProdMain(String sellerid);

}
