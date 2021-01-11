package com.sic.pdm.model.user;

import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sic.pdm.service.user.IMemberService;
import com.sic.pdm.util.API_Service;
import com.sic.pdm.vo.user.MemberVo;

@Controller
public class MemberController {

	@Autowired
	private API_Service phoneservice;
	
	@Autowired
	private IMemberService service;
	
	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public String main() {
		
		return "mainPage";
	}
	
	@RequestMapping(value = "/loginForm.do", method = RequestMethod.GET)
	public String loginForm() {
		return "loginForm";
	}
	
	@RequestMapping(value = "/singUp.do", method = RequestMethod.GET)
	public String singUp() {
		return "singUp";
	}
	
	@RequestMapping(value = "/idchk.do", method = RequestMethod.GET)
	public String idchk() {
		return "idchk";
	}
	
	@RequestMapping(value = "/duplicate.do", method = RequestMethod.POST)
	@ResponseBody
	public String duplicate(String id) {
		String idchk = service.idchk(id);
		return idchk;
	}
	
	@RequestMapping(value = "/phonechk.do", method = RequestMethod.GET)
	public String Phonechk() {
		return "phonechk";
	}
	
	@RequestMapping(value = "/sendSMS.do",method = RequestMethod.POST)
	@ResponseBody
	public String sendSMS(String phoneNumber) {

        Random rand  = new Random();
        String numStr = "";
        for(int i=0; i<4; i++) {
            String ran = Integer.toString(rand.nextInt(10));
            numStr+=ran;
        }

        System.out.println("수신자 번호 : " + phoneNumber);
        System.out.println("인증번호 : " + numStr);
        phoneservice.certifiedPhoneNumber(phoneNumber,numStr);
        return numStr;
    }
	
	@RequestMapping(value = "/newSingup", method = RequestMethod.POST)
	public String newSingup(MemberVo vo) {
		System.out.println(vo.getAddr());
		
		boolean isc = service.singup(vo);
			return "mainPage";
	}
	
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String login(String id, HttpSession session, String judgment) {
		System.out.println(judgment);
		if(judgment.trim().equals("seller")) {
			session.setAttribute("id", id);
			return "sellermainPage";
		}else {
			session.setAttribute("id", id);
			return "mainPage";
		}
		
	}
	
	@RequestMapping(value = "/loginchk.do", method = RequestMethod.POST)
	@ResponseBody
	public String loginchk(MemberVo vo) {
		System.out.println(vo.getId());
		System.out.println(vo.getPw());
		String logindata = service.loginchk(vo);
		return logindata;
	}
}
