package com.sic.pdm.ctrl.mileage;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sic.pdm.model.mileage.Mileage_IService;
import com.sic.pdm.model.or.OrderList_IService;
import com.sic.pdm.vo.mileage.MileageVo;
@Controller
public class MileageController {
	
	@Autowired
	private Mileage_IService iService;
	
	@Autowired
	private OrderList_IService oService;
	
	@RequestMapping(value = "/mileage.do", method = RequestMethod.GET)
	public String Mileage(Model model, HttpSession session) {
		String id = (String) session.getAttribute("id");
		System.out.println(id);
		MileageVo list = iService.totalMiles(id);
		List<MileageVo> lists = iService.detailMiles(id);
		System.out.println(list);
		System.out.println(lists);
		
		model.addAttribute("mil",list);
		model.addAttribute("lists",lists);
		
		return "LHS_mileage";
	}
	
	@RequestMapping(value = "/mileageaply.do", method = RequestMethod.POST)
	@ResponseBody
	public int mileageApply(HttpSession session, Model model) {
		String id = (String) session.getAttribute("id");
		
		Integer mm = oService.getMPrice(id);
		if(mm.equals(null)) {
			mm = 0;
		}
		System.out.println("아이디 확인"+ id);
		
		
		System.out.println(mm);
		return mm;
	}
	
	

}
