package com.sic.pdm.ctrl.coupon;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sic.pdm.model.coupon.ICouponService;
import com.sic.pdm.vo.coupon.CouponBoxVo;
import com.sic.pdm.vo.coupon.CouponVo;

@Controller
public class UserCouponController {
	
	@Autowired
	private ICouponService icsvc;
	
	// 회원 보유 쿠폰 조회
	@RequestMapping(value = "/myCouponList.do")
	public String getCouponList(HttpSession session,Model model) {
		String id = (String) session.getAttribute("id");
		System.out.println(id);
		List<CouponVo> cbList = icsvc.getCouponList(id);
		model.addAttribute("cbList",cbList);
		return "CHS_MyCouponList";
	}
	
	// 회원 쿠폰 받기
	@RequestMapping(value = "/getCoupon.do")
	public String getCoupon(String cseq, HttpSession session) {
		String id= (String) session.getAttribute("id");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cseq", cseq);
		map.put("id", id);
		icsvc.getCoupon(map);
		return "redirect:/MyCouponList.do";
	}

}
