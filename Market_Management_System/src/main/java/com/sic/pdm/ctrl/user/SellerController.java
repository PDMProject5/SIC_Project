package com.sic.pdm.ctrl.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sic.pdm.model.user.ISellerService;
import com.sic.pdm.vo.user.SellerVo;

@Controller
public class SellerController {
	
	@Autowired
	ISellerService service;
	
	@RequestMapping(value = "/sellerloginchk.do", method = RequestMethod.POST)
	@ResponseBody
	public String sellerloginchk(SellerVo vo) {
		String logindata = service.sellerloginchk(vo);
		return logindata;
	}
	
	@RequestMapping(value = "/sellermainPage.do", method = RequestMethod.GET)
	public String sellermainPage(HttpSession session) {
		String sellerid = (String)session.getAttribute("sellerid");
		if(sellerid == null) {
			return "sessionexpiration";
		}
		return "sellermainPage";
		}
	}
	
	

		

