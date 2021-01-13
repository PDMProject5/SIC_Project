package com.sic.pdm.ctrl.or;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sic.pdm.model.or.OrderList_IService;
import com.sic.pdm.vo.or.OrderVo;
import com.sic.pdm.vo.or.OrderdetailVo;
import com.sic.pdm.vo.or.RefoundVo;

@Controller
public class OrderListController {
	
	@Autowired
	private OrderList_IService iService;
	
	@RequestMapping(value = "/orderlist.do", method = RequestMethod.GET)
	public String orderList(Model model) {
		List<OrderVo> list = iService.orderList();
		System.out.println(list);
		
		model.addAttribute("list", list);
		
		return "LHS_orderlist";
	}
	
	@RequestMapping(value = "/orderdetail.do", method = RequestMethod.GET)
	public String orderDetail(Model model) {
		List<OrderdetailVo> list = iService.orderDetail();
		System.out.println(list);
		
		model.addAttribute("list", list);
		
		return "LHS_orderdetail";
	}
	
	
}
