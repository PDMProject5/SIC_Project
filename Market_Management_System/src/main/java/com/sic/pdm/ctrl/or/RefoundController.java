package com.sic.pdm.ctrl.or;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sic.pdm.model.mileage.Mileage_IService;
import com.sic.pdm.model.or.Refound_IService;
import com.sic.pdm.vo.mileage.MileageVo;
import com.sic.pdm.vo.or.OrderVo;
import com.sic.pdm.vo.or.RefoundVo;
import com.sic.pdm.vo.or.RefounddetailVo;

@Controller
public class RefoundController {
	
	@Autowired
	private Refound_IService iService;
	
	@Autowired
	private Mileage_IService mService;
	
	@RequestMapping(value = "/refoundList.do", method = RequestMethod.GET)
	public String refoundList(Model model) {
		List<RefoundVo> list = iService.refoundList();
		System.out.println(list);
		
		model.addAttribute("list", list);
		
		return "LHS_refundList";
	}
	
	@RequestMapping(value = "/refounddetail.do", method = RequestMethod.GET)
	public String refoundDetail(Model model, RefoundVo vo) {
		Map<String, Object> map = new HashMap<String, Object>();
		String id = vo.getId();
		map.put("id", id);
		System.out.println(id);
		map.put("onum", vo.getOnum());
		System.out.println(vo.getOnum());
		RefounddetailVo list = iService.refoundDetail(map);
		
		System.out.println(list);
		
		model.addAttribute("list", list);
		
		return "LHS_refounddetail";
	}
	
	// 환불요청 페이지 이동
	@RequestMapping(value = "/refundinsert.do", method = RequestMethod.GET)
	public String refundinsert(String onum, Model model) {
		System.out.println(onum);
		OrderVo vo = iService.gorefund(onum);
		
		model.addAttribute("vo",vo);
		
		return "LHS_orderrefund";
	}
	
	
	@RequestMapping(value = "/refund.do", method = RequestMethod.POST)
	public String refund(String onum, String reason) {
		
		System.out.println(onum);
		System.out.println(reason);
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("onum",onum);
		map.put("reason",reason);
		iService.refund(map);
		
		System.out.println(onum);
		boolean isc = iService.refoundModify(onum);
		System.out.println("환불 요청 완료" +isc);
		
		return "redirect:/orderlist.do";
	}
	
//	// 환불 대기 
//	@RequestMapping(value = "/refoundModify.do", method = RequestMethod.GET)
//	public String refoundModify(String onum) {
//		System.out.println(onum);
//		boolean isc = iService.refoundModify(onum);
//		System.out.println("환불 요청 완료" +isc);
//		return "redirect:/orderlist.do";
//	}
	
	@RequestMapping(value = "/refoundApprove.do", method = RequestMethod.GET)
	public String refoundApprove(String onum, MileageVo mvo) {
		
		System.out.println(onum);
		boolean isc = iService.refoundApprove(onum);
		System.out.println("환불 요청 승인 완료" +isc);
		
//		boolean msc = mService.mileagerefund(mvo);
//		System.out.println("환불금액 마일리지로 반환 완료" + msc);
		
		return "redirect:/refoundList.do";
	}
	
	@RequestMapping(value = "/refoundRefuse.do", method = RequestMethod.GET)
	public String refoundRefuse(String onum) {
		boolean isc = iService.refoundRefuse(onum);
		System.out.println("환불 요청 거절 완료" +isc);
		return "redirect:/refoundList.do";
	}

}
