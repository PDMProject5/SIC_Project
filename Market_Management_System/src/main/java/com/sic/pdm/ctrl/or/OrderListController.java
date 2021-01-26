package com.sic.pdm.ctrl.or;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sic.pdm.model.or.OrderList_IService;
import com.sic.pdm.vo.or.OrderVo;
import com.sic.pdm.vo.or.OrderdetailVo;

@Controller
public class OrderListController {
	
	@Autowired
	private OrderList_IService iService;
	
	@RequestMapping(value = "/orderlist.do", method = RequestMethod.GET)
	public String orderList(Model model, HttpSession session) {
		String id = (String) session.getAttribute("id");
		
		List<OrderVo> list = iService.orderList(id);
		System.out.println(list);
		
		model.addAttribute("list", list);
		
		return "LHS_orderlist";
	}
	
	@RequestMapping(value = "/orderdetail.do", method = RequestMethod.GET)
	public String orderDetail(Model model, String onum, HttpSession session) {
		System.out.println(onum);
//		OrderVo vo = (OrderVo) iService.orderDetail(onum);
		List<OrderdetailVo> list = iService.orderDetail(onum);
//		OrderVo vo = iService.oVo(onum);
		System.out.println(list);
		
		model.addAttribute("list", list);
//		model.addAttribute("vo",vo);
//		model.addAttribute("vo",vo);
		
		return "LHS_orderdetail";
	}
	
	
}
