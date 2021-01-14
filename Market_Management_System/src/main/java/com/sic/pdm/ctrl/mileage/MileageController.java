package com.sic.pdm.ctrl.mileage;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sic.pdm.model.mileage.Mileage_IService;
import com.sic.pdm.vo.mileage.MileageVo;
@Controller
public class MileageController {
	
	@Autowired
	private Mileage_IService iService;
	
	@RequestMapping(value = "/mileage.do", method = RequestMethod.GET)
	public String Mileage(Model model, HttpSession session) {
		String id = (String) session.getAttribute("id");
		
		MileageVo list = iService.totalMiles(id);
		List<MileageVo> lists = iService.detailMiles(id);
		System.out.println(list);
		System.out.println(lists);
		
		model.addAttribute("list",list);
		model.addAttribute("lists",lists);
		
		return "LHS_mileage";
	}

}
