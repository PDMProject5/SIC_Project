package com.sic.pdm.ctrl.payment;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sic.pdm.model.mileage.Mileage_IService;
import com.sic.pdm.model.payment.Payment_IService;
import com.sic.pdm.vo.coupon.CouponVo;
import com.sic.pdm.vo.mileage.MileageVo;
import com.sic.pdm.vo.payment.PaymentVo;

@Controller
public class PaymentController {
	
	@Autowired
	private Payment_IService Pservice;
	
	@Autowired
	private Mileage_IService Mservice;
	
	
	
	@RequestMapping(value = "/payment.do", method = RequestMethod.GET)
	public String orderDetailpull(PaymentVo pvo, MileageVo mvo, CouponVo cvo, HttpSession session, String onum,
			@RequestParam (value = "radio") String radio) {
		System.out.println("어디니");
		String id = (String)session.getAttribute("id");
		System.out.println(id);
		System.out.println(onum);
		System.out.println(pvo.getOnum());
		System.out.println(radio);
		if(radio == "1") {
			Pservice.orderdel(pvo);
		}else {
			Pservice.orderdel2(onum);
		}
		
		Pservice.orderDetailpull(pvo);
		Pservice.delCoupon(cvo);
		 Mservice.useMileage(mvo);
		
		
		return "redirect:/orderdetail.do";
	}
	
	

}
