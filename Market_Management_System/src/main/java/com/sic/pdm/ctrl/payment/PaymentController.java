package com.sic.pdm.ctrl.payment;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sic.pdm.model.payment.Payment_IService;
import com.sic.pdm.vo.coupon.CouponVo;
import com.sic.pdm.vo.payment.PaymentVo;

@Controller
public class PaymentController {
	
//	@Autowired
//	private Payment_IService iService;
	
	@RequestMapping(value = "/payment.do", method = RequestMethod.GET)
	public String orderDetailpull(PaymentVo pvo, HttpSession session) {
		
		
		
		return "redirect:/.do";
	}
	
	

}
