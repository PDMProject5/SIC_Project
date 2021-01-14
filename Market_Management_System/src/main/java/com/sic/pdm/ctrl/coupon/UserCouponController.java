package com.sic.pdm.ctrl.coupon;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sic.pdm.model.coupon.ICouponService;
import com.sic.pdm.vo.coupon.CouponBoxVo;
import com.sic.pdm.vo.coupon.CouponVo;

@Controller
public class UserCouponController {
	
	@Autowired
	private ICouponService icsvc;
	
	// 회원 시점
	// 매장 행사 정보
	@RequestMapping(value = "/userViewListCoupon.do")
	public String userViewListCoupon(HttpSession session,Model model) {
		String sellerid = "admin01";
		List<CouponVo> ucvList = icsvc.userViewListCoupon(sellerid);
		model.addAttribute("ucvList",ucvList);
		return "CHS_userViewListCoupon";
	}
	
	// 선택 쿠폰 조회
	@RequestMapping(value = "/userViewOneCoupon.do" , method = RequestMethod.GET)
	public String userViewOneCoupon(String cseq,Model model) {
		System.out.println("///UserCouponController "+cseq);
		CouponVo ucv = icsvc.userViewOneCoupon(cseq);
		model.addAttribute("ucv",ucv);
		return "CHS_userViewOneCoupon";
	}

	// 회원 보유 쿠폰 조회
	@RequestMapping(value = "/myCouponList.do", method = RequestMethod.GET)
	public String getCouponList(HttpSession session, Model model) {
		String id = (String) session.getAttribute("id");
		List<CouponVo> cbList = icsvc.getCouponList(id);
		model.addAttribute("cbList",cbList);
		return "CHS_myCouponList";
	}
	

	// 회원 쿠폰 받기
	@RequestMapping(value = "/getCoupon.do", method = RequestMethod.GET)
	public String getCoupon(String cseq, HttpSession session) {
		String id= (String) session.getAttribute("id");
		if(id == null) { // 비회원 로그인시 loginform.do 이동
			return "redirect:/loginForm.do";
		} else { // 세션 값이 id에 담겨져있으면 쿠폰 받기 로직 실행
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("id", id);
			map.put("cseq", cseq);
			icsvc.getCoupon(map);
			return "redirect:/myCouponList.do";
		}
	}

}
