package com.sic.pdm.ctrl.product;

import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sic.pdm.model.product.IProductService;
import com.sic.pdm.vo.product.ProductVo;

@Controller
public class ProductController {
	
	@Autowired
	private IProductService pService;
	
	@RequestMapping(value = "product.do")
	public String test(Model model) {
		List<ProductVo> lists = pService.getProdList("admin01"); 
		model.addAttribute("list", lists);
		return "KGH_product";
	}
	
	@RequestMapping(value = "productTree.do")
	@ResponseBody
	public JSONArray productTree() {
		JSONObject jsonObject = null;
		JSONArray jsonArray = null;
		
		
		return jsonArray;
	}
	
}
