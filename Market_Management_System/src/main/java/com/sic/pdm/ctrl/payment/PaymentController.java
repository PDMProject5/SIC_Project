package com.sic.pdm.ctrl.payment;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sic.pdm.model.bascket.BascketIService;
import com.sic.pdm.model.mileage.Mileage_IService;
import com.sic.pdm.model.or.OrderList_IService;
import com.sic.pdm.model.payment.Payment_IService;
import com.sic.pdm.vo.bascket.BascketVo;
import com.sic.pdm.vo.coupon.CouponVo;
import com.sic.pdm.vo.del.DelVo;
import com.sic.pdm.vo.mileage.MileageVo;
import com.sic.pdm.vo.payment.PaymentVo;

@Controller
public class PaymentController {
   
   @Autowired
   private Payment_IService Pservice;
   
   @Autowired
   private Mileage_IService Mservice;
   
   @Autowired
   private OrderList_IService Oservice;
   
   @Autowired
   private BascketIService Bservice;
      
   // 주문페이지에서 결제페이지로 이동
   
   @RequestMapping(value = "/payment.do", method = RequestMethod.POST)
    public String payment(Model model, BascketVo bvo, DelVo delvo, HttpSession session) {
        System.out.println("배송지명:"+delvo.getDname());
      System.out.println(bvo.getOdnum());
        System.out.println(bvo.getOnum());
        String odnum = bvo.getOdnum();

        List<String> arr= Arrays.asList(odnum.split(","));

        System.out.println(arr);
        int n = Oservice.getPrice(arr);
        System.out.println("가격"+n);
        model.addAttribute("price",n);


        String id = (String)session.getAttribute("id");
        MileageVo mil = Mservice.totalMiles(id);
        model.addAttribute("mil",mil);

        model.addAttribute("delvo",delvo);
         
        return "LHS_payment";
    }
   

    //결제 완료 후 order테이블 상태업데이트
   @RequestMapping(value = "/orderupdate.do", method = RequestMethod.POST)
   public String updateorder(Model model, HttpSession session, PaymentVo pvo, CouponVo cvo, MileageVo mvo) {
      String id = (String)session.getAttribute("id");
      System.out.println("아이디 확인"+id);
      
      Map<String, Object>map = new HashMap<String, Object>();
      
      String store = (String)session.getAttribute("store");
        map.put("id", id);
        map.put("store", store);
        BascketVo bvo = Bservice.getOrder(map);
        System.out.println("오더페이지에 전달되는 값"+bvo);
        System.out.println(bvo.getOnum());
        String onum = bvo.getOnum();
        
      System.out.println(onum);
      pvo.setOnum(onum);
      System.out.println(pvo.getAddr());
      
      // 배송지 여부 판단 후 주문에 배송 업데이트
      if(pvo.getRoadaddr() == "") {
         Pservice.orderdel2(onum);
         
      }else {
         Pservice.orderdel(pvo);
      }
      
      
      System.out.println("주문 업데이트 성공"+onum);
      
      
      // 결제 확인
      boolean isc = Pservice.payment(pvo);
      System.out.println("결제 성공 " + isc);
      
      
      // 쿠폰 사용 확인
      System.out.println(cvo.getCseq());
      cvo.setId(id);
      System.out.println(cvo.getId());
      System.out.println("판매금액"+pvo.getSaleamt());
      System.out.println("할인금액"+pvo.getDiscountamt());
      System.out.println("결제금액"+pvo.getPaymentamt());
      String coupon =cvo.getCseq();
      if(!coupon.isEmpty()) {
         boolean sc = Pservice.delCoupon(cvo);
         System.out.println("사용한 쿠폰 삭제" + sc);
         
      }
      
      // 마일리지 사용 확인
      mvo.setId(id);
      int n = mvo.getMmoney();
      System.out.println("사용 마일리지"+mvo.getMmoney());
      if(n>0) {         
         boolean msc = Mservice.useMileage(mvo);
         System.out.println("마일리지 사용 확인"+msc);
         
      }
      
      // 마일리지 적립
      int sale = pvo.getSaleamt();
      mvo.setMmoney(sale);
      System.out.println(mvo.getMmoney());
      boolean isc2 = Pservice.mileage(mvo);
      System.out.println("마일리지 적립 성공"+isc2);
      
      
      
      return "redirect:/orderlist.do";
   }
   
   // 주문 업데이트 성공 후 결제 내역 insert
   @RequestMapping(value = "/paymentinsert.do", method = RequestMethod.POST)
   public String paymentinsert(PaymentVo pvo,HttpSession session) {
      String paymentnum = (String)session.getAttribute("paymentnum");
      
      Map<String, Object> map = new HashMap<String, Object>();
      map.put("paymentnum", paymentnum);
//      map.put("onum", onum);
      boolean isc = Pservice.payment(pvo);
      System.out.println("결제 성공 " + isc);
      return "redirect:/orderdetail.do";
   }
   
   // 결제내역 insert성공 후 마일리지 적립/사용 insert
   @RequestMapping(value = "/mileageinsert.do", method = RequestMethod.POST)
   public String mileageinsert(MileageVo mvo) {
      boolean isc = Pservice.mileage(mvo);
      System.out.println("마일리지 사용/적립 성공"+isc);
      return "redirect:/coupondelete.do";
   }
   
   // 마일리지 성공 후 사용한 쿠폰 삭제 
   @RequestMapping(value = "/coupondelete.do", method = RequestMethod.GET)
   public String coupondelete(CouponVo cvo) {
      Pservice.delCoupon(cvo);
      return "redirect:/orderdetail.do";
   }
   
   
   @RequestMapping(value = "/milchk.do", method = RequestMethod.POST)
   @ResponseBody
   public String milChk(String id) {
      boolean isc = Oservice.mmoney(id);
      return isc?"true":"false";
   }
   

   

}