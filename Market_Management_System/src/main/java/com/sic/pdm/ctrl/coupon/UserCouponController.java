package com.sic.pdm.ctrl.coupon;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sic.pdm.model.coupon.ICouponService;
import com.sic.pdm.model.user.ISellerService;
import com.sic.pdm.vo.coupon.CouponBoxVo;
import com.sic.pdm.vo.coupon.CouponVo;
import com.sic.pdm.vo.user.SellerVo;

@Controller
public class UserCouponController {
	
	@Autowired
	private ICouponService icsvc;
	
	@Autowired
	private ISellerService selService;
	
	// 회원 시점
	// 매장 행사 정보
	@RequestMapping(value = "/userViewListCoupon.do", method = RequestMethod.GET)
	public String userViewListCoupon(String store, Model model,HttpSession session) {
		if (store.equals("")) {
			return "CHS_noStore";
		} else {
			SellerVo vo = selService.sellerOne(store);
			String sellerid = vo.getSellerid();
			String store2 = vo.getStore();
			session.setAttribute("store", store2);
			List<CouponVo> ucvList = icsvc.userViewListCoupon(sellerid);
			model.addAttribute("sell",vo);
			model.addAttribute("ucvList",ucvList);
			return "CHS_userViewListCoupon";
		}
	}
	
	// 선택 쿠폰 조회
	@RequestMapping(value = "/userViewOneCoupon.do" , method = RequestMethod.GET)
	public String userViewOneCoupon(String cseq,Model model) {
		CouponVo ucv = icsvc.userViewOneCoupon(cseq);
		model.addAttribute("ucv",ucv);
		return "CHS_userViewOneCoupon";
	}

	// 회원 보유 쿠폰 조회
	@RequestMapping(value = "/myCouponList.do", method = RequestMethod.GET)
	public String getCouponList(HttpSession session, Model model) {
		String id = (String) session.getAttribute("id");
		List<CouponVo> cbList = icsvc.getCouponList(id);
		model.addAttribute("id",id);
		model.addAttribute("cbList",cbList);
		return "CHS_myCouponList";
	}
	

	// 회원 쿠폰 받기
	@RequestMapping(value = "/getCoupon.do", method = RequestMethod.GET)
	public String getCoupon(String cseq, HttpSession session) {
		String cvo = icsvc.getSellerId(cseq);
		String id= (String) session.getAttribute("id");
		if(id == null) { // 비회원 로그인시 loginform.do 이동
			return "redirect:/loginForm.do";
		} else { // 세션 값이 id에 담겨져있으면 쿠폰 받기 로직 실행
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("id", id);
			map.put("cseq", cseq);
			map.put("sellerid", cvo);
			icsvc.getCoupon(map);
			return "redirect:/myCouponList.do";
		}
	}
	
	// 회원 쿠폰 중복 수령 불가능
	@RequestMapping(value = "/getCouponChk.do", method = RequestMethod.POST)
	@ResponseBody
	public String getCouponChk(String cseq, HttpSession session) {
		String couponChk = null;
		String id= (String) session.getAttribute("id");
		if(id == null) { //비회원 쿠폰 수령할려고 할때 loginform.do 이동
			couponChk = "loginFail";
			return couponChk;
		} else {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("id", id);
			map.put("cseq", cseq);
			couponChk = icsvc.couponChk(map);
			return couponChk;
		}
	}
	
	// -------------- 혜수 -------------- //
	@RequestMapping(value = "/coupon.do", method = RequestMethod.GET)
	public String coupon(Model model, HttpSession session) {
		String id = (String) session.getAttribute("id");
		List<CouponVo> cList = icsvc.getCouponList(id);
		model.addAttribute("cList",cList);
		return "LHS_coupon";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/couponSelect.do", method = RequestMethod.POST, produces = "application/text; charset=UTF-8;")
	@ResponseBody
	public String couponSelect(String cseq, Model model) {
		CouponVo cvo = icsvc.userViewOneCoupon(cseq);
		System.out.println("쿠폰번호 확인" + cseq);
		
		JSONObject json = new JSONObject();
		json.put("cseq", cvo.getCseq());
		json.put("coupon", cvo.getCoupon());
		
		System.out.println(json.toString());
		
		return json.toString();
	}

}
