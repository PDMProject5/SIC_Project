package com.sic.pdm.ctrl.product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sic.pdm.model.product.IProductService;
import com.sic.pdm.model.user.ISellerService;
import com.sic.pdm.vo.product.ProductVo;
import com.sic.pdm.vo.user.SellerVo;

@Controller
public class ProductController {
	
	@Autowired
	private IProductService pService;
	
	@Autowired 
	private ISellerService selService;
	
	@RequestMapping(value = "/product.do")
	public String test(String sellerid,Model model) {
		List<ProductVo> lists = pService.getProdList(sellerid); 
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
	public String productDetail(@RequestParam String iname, Model model, HttpSession session) {
		System.out.println(iname);
		ProductVo vo = null;
		String store = (String)session.getAttribute("store");
		SellerVo svo = selService.sellerOne(store);
		String sellerid= svo.getSellerid();
		Map<String, String> map = new HashMap<String, String>();
		map.put("iname", iname);
		map.put("sellerid", sellerid);
		vo = pService.getProdDetail(map);
		model.addAttribute("vo", vo);
		return "KGH_productDetail";
	}
	
	@RequestMapping(value = "/productInsert.do", method = RequestMethod.POST)
	public String productInsert(@RequestParam String[] code, @RequestParam String[] stock) {
		Map<String, Object> insertMap = new HashMap<String, Object>();
		List<ProductVo> insertList = new ArrayList<ProductVo>();
		ProductVo pvo = new ProductVo();
		
		// 대분류 체크를 위한 String변수
		String chkFood = pService.chkFood(code[0]);
		// 대분류를 보여줌
		System.out.println(chkFood);
		
		for (int i = 0; i < stock.length; i++) {
			pvo.setIcode(code[i]);
			pvo.setStock(stock[i]);
			
			insertList.add(pvo);
		}
		
		insertMap.put("sellerid", "admin01");
		insertMap.put("productList", insertList);

		// 대분류가 AA인 경우(식품)
		if (chkFood.equals("AA")) {
			pService.insertProdFood(insertMap);
		}else { // 대분류가 식품이 아닌 경우
			pService.insertProd(insertMap);
		}
		return "redirect:/product.do";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/productGridMain.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONArray productGridMain(@RequestParam String mcode, @RequestParam String sellerid) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("mcode", mcode);
		map.put("sellerid", sellerid);
		List<ProductVo> lists = pService.getProdMain(map);
		JSONObject jsonObject = null;
		JSONArray jsonArray = new JSONArray();
		
		for (ProductVo vo : lists) {
			jsonObject = new JSONObject();
			jsonObject.put("name", vo.getIname());
			jsonObject.put("rotnum", vo.getRotnum());
			jsonObject.put("price", vo.getOprice());
			jsonObject.put("stock", vo.getStock());
			jsonArray.add(jsonObject);
		}
		
		return jsonArray;
	}
	
	@RequestMapping(value = "/productGridMainDetail.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONArray productGridMainDetail(@RequestParam String name, @RequestParam String sellerid) {
		System.out.println(name);
		System.out.println(sellerid);
		Map<String, String> map = new HashMap<String, String>();
		map.put("iname", name);
		map.put("sellerid", sellerid);
		List<ProductVo> lists = pService.getProdMainDetail(map);
		
		JSONObject jsonObject = null;
		JSONArray jsonArray = new JSONArray();
		
		for (ProductVo vo : lists) {
			jsonObject = new JSONObject();
			jsonObject.put("code", vo.getPcode());
			jsonObject.put("name", vo.getIname());
			jsonObject.put("pdate", vo.getPdate());
			jsonObject.put("lifetime", vo.getLifetime());
			jsonObject.put("stock", vo.getStock());
			jsonArray.add(jsonObject);
		}
		
		return jsonArray;
	}
	
}
