package com.sic.pdm.ctrl.or;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sic.pdm.model.or.Refound_IService;
import com.sic.pdm.vo.or.RefoundVo;
import com.sic.pdm.vo.or.RefounddetailVo;

@Controller
public class RefoundController {
	
	@Autowired
	private Refound_IService iService;
	
	@RequestMapping(value = "/refoundList.do", method = RequestMethod.GET)
	public String refoundList(Model model) {
		List<RefoundVo> list = iService.refoundList();
		System.out.println(list);
		
		model.addAttribute("list", list);
		
		return "refoundList";
	}
	
	@RequestMapping(value = "/refounddetail.do", method = RequestMethod.GET)
	public String refoundDetail(Model model) {
		RefounddetailVo list = iService.refoundDetail();
		System.out.println(list);
		
		model.addAttribute("list", list);
		
		return "refounddetail";
	}
	
	@RequestMapping(value = "/refoundModify.do", method = RequestMethod.GET)
	public String refoundModify(String onum) {
		boolean isc = iService.refoundModify(onum);
		System.out.println("환불 요청 완료" +isc);
		return "redirect:/orderlist.do";
	}
	
	@RequestMapping(value = "/refoundApprove.do", method = RequestMethod.GET)
	public String refoundApprove(String onum) {
		boolean isc = iService.refoundApprove(onum);
		System.out.println("환불 요청 승인 완료" +isc);
		return "redirect:refoundList.do";
	}
	
	@RequestMapping(value = "/refoundRefuse.do", method = RequestMethod.GET)
	public String refoundRefuse(String onum) {
		boolean isc = iService.refoundRefuse(onum);
		System.out.println("환불 요청 거절 완료" +isc);
		return "redirect:refoundList.do";
	}

}
