package com.sic.pdm.ctrl.autoorder;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sic.pdm.model.autoorder.IAutoOrderService;
import com.sic.pdm.vo.autoorder.AutoOrderVo;

@Controller
public class AutoOrderController {

	@Autowired
	IAutoOrderService service;
	
	@RequestMapping(value = "/sellermain.do", method = RequestMethod.GET)
	public String sellermain() {
		return "sellermainPage";
	}
	
	@RequestMapping(value = "/autoOrderform.do", method = RequestMethod.GET)
	public String autoOrderform(Model model, HttpSession session) {
		String sellerid = (String)session.getAttribute("sellerid");
		System.out.println(sellerid);
		List<AutoOrderVo> lists = service.autoOrderList(sellerid);
		System.out.println(lists.size());
		model.addAttribute("lists", lists);
		return "autoOrderForm";
	}
	
	@RequestMapping(value = "/autoOrderDetail.do", method = RequestMethod.GET)
	public String autoOrderDetail(String iname, Model model) {
		System.out.println(iname);
		AutoOrderVo vo = service.autoOrderDetail(iname);
		model.addAttribute("detaillist", vo);
		return "autoOrderDetail";
	}
	
	@RequestMapping(value = "/updateautoOrder.do", method = RequestMethod.POST)
	public String updateautoOrder(AutoOrderVo vo, HttpSession session) {
		vo.setSellerid((String)session.getAttribute("sellerid"));
		service.updateautoOrder(vo);
		return "redirect:/autoOrderform.do";
	}
	
	@RequestMapping(value = "/searchitemform.do", method = RequestMethod.GET)
	public String searchitemform() {
		return "searchitemform";
	}
	
	@RequestMapping(value = "/searchitem.do", method = RequestMethod.POST)
	public String searchitemList(String iname, Model model) {
		List<AutoOrderVo>lists = service.searchitem(iname);
		model.addAttribute("searchlist", lists);
		return "searchitem";
	}
	
	@RequestMapping(value = "/insertAutoOrderForm.do")
	public String insertAutoOrderForm(String iname, Model model) {
		model.addAttribute("iname", iname);
		return "insertAutoOder";
	}
	
	@RequestMapping(value = "/insertAutoOrder.do", method = RequestMethod.POST)
	public String insertAutoOrder(AutoOrderVo vo, HttpSession session) {
		vo.setSellerid((String)session.getAttribute("sellerid"));
		service.insertAutoOrder(vo);
		return "redirect:/autoOrderform.do";
	}
	
	@RequestMapping(value = "/autoOrderDel.do", method = RequestMethod.GET)
	public String autoOrderDel(String itemlist, HttpSession session) {
		System.out.println(itemlist);
		String[] dellist = itemlist.split(",");
		Map<String, Object> inames = new HashMap<String, Object>();
		inames.put("inames", dellist);
		inames.put("sellerid", (String)session.getAttribute("sellerid"));
		service.deleteAutoOrder(inames);
		return "redirect:/autoOrderform.do";
	}
	
	
	public void autoOrder() {
		List<AutoOrderVo> orderList = 
				service.autoOrder();
		AutoOrderVo data = null;
		AutoOrderVo vo = null;
		for (int i = 0; i < orderList.size(); i++) {
			data = orderList.get(i);
			vo = service.autoOrderchk(data);
			System.out.println(vo);
			if(vo != null) {
				String itemchk = vo.getIname();
				System.out.println(itemchk);
				String foodchk = service.foodchk(itemchk);
				System.out.println(foodchk);
				if(foodchk.equals("AA")) {
					service.insertAutoFood(vo);
				}else {
					service.insertAuto(vo);
				}
			}
		}
	}
}
