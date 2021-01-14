package com.sic.pdm.ctrl.product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sic.pdm.model.product.IProductService;
import com.sic.pdm.vo.product.ProductVo;

@Controller
public class ProductController {
	
	@Autowired
	private IProductService pService;
	
	@RequestMapping(value = "/product.do")
	public String test(Model model) {
		List<ProductVo> lists = pService.getProdList("admin01"); 
		model.addAttribute("list", lists);
		return "KGH_product";
	}
	
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/productTree.do")
	@ResponseBody
	public JSONArray productTree() {
		List<ProductVo> lcate = pService.getLcate();
		List<ProductVo> mcate = pService.getMcate();
		JSONObject jsonObject = null;
		JSONArray jsonArray = new JSONArray();
		
		for (ProductVo vo : lcate) {
			jsonObject = new JSONObject();
			jsonObject.put("id", vo.getLcode());
			jsonObject.put("parent", "#");
			jsonObject.put("text", vo.getLname());
			jsonArray.add(jsonObject);
		}
		
		for (ProductVo vo : mcate) {
			jsonObject = new JSONObject();
			jsonObject.put("id", vo.getMcode());
			jsonObject.put("parent", vo.getLcode());
			jsonObject.put("text", vo.getMname());
			jsonArray.add(jsonObject);
		}
		
		
		return jsonArray;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/insertGrid.do")
	@ResponseBody
	public JSONArray insertGrid(@RequestParam String mcode) {
		System.out.println(mcode);
		List<ProductVo> lists = pService.getInven(mcode);
		JSONObject jsonObject = null;
		JSONArray jsonArray = new JSONArray();
		
		for (ProductVo vo : lists) {
			jsonObject = new JSONObject();
			jsonObject.put("code", vo.getIcode());
			jsonObject.put("name", vo.getIname());
			jsonObject.put("price", vo.getIprice());
			jsonArray.add(jsonObject);
		}
		
		return jsonArray;
	}
	
	@RequestMapping(value = "/productDetail.do")
	public String productDetail(@RequestParam String iname, Model model) {
		System.out.println(iname);
		ProductVo vo = null;
		Map<String, String> map = new HashMap<String, String>();
		map.put("iname", iname);
		map.put("sellerid", "admin01");
		vo = pService.getProdDetail(map);
		model.addAttribute("vo", vo);
		return "KGH_productDetail";
	}
	
	@RequestMapping(value = "/productInsert.do", method = RequestMethod.POST)
	public String productInsert(@RequestParam String[] code, @RequestParam String[] stock) {
		Map<String, Object> insertMap = new HashMap<String, Object>();
		Map<String, Object> tempMap = new HashMap<String, Object>();
		List<ProductVo> list = new ArrayList<ProductVo>();
		ProductVo pvo = new ProductVo();
		
		
		for (int i = 0; i < stock.length; i++) {
			pvo.setIcode(code[i]);
			pvo.setStock(stock[i]);
			list.add(pvo);
		}
//		for (String str : code) {
//			System.out.println("코드임? = " + str);
//			pvo.setIcode(str);
//		}
//		for (String str : stock) {
//			System.out.println("숫자임? = " + str);
//			tempMap.put("stock", str);
//		}
		
		insertMap.put("sellerid", "admin01");
		insertMap.put("productList", list);
		System.out.println(insertMap);
		System.out.println(code);
		pService.insertProdFood(insertMap);
		return "redirect:/product.do";
	}
	
	@RequestMapping(value = "/productGridMain.do")
	@ResponseBody
	public JSONArray productGridMain() {
		return null;
	}
	
}
