package com.sic.pdm.ctrl.user;

import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sic.pdm.model.user.IMemberService;
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
		return "signUp";
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
			session.setAttribute("sellerid", id);
			return "sellermainPage";
		}else {
			session.setAttribute("id", id);
			return "usermainPage";
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
	
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "mainPage";
	}
	
	@RequestMapping(value = "/userModified.do", method = RequestMethod.GET)
	public String userupdate() {
		return "userModified";
	}
	
	@RequestMapping(value = "/updatepw.do")
	public String updatepw() {
		return "updatepw";
	}
	
	@RequestMapping(value = "/nowpwcheck.do", method = RequestMethod.POST)
	@ResponseBody
	public String nowpwcheck(String pw, HttpSession session) {
		MemberVo vo = new MemberVo();
		vo.setId((String)session.getAttribute("id"));
		vo.setPw(pw);
		System.out.println(vo.getId());
		System.out.println(vo.getPw());
		String nowpwcheck = service.nowpwcheck(vo);
		return nowpwcheck;
	}
	
	@RequestMapping(value = "/modifypw.do", method = RequestMethod.POST)
	public String modifypw(String modifypw, HttpSession session) {
		MemberVo vo = new MemberVo();
		vo.setId((String)session.getAttribute("id"));
		vo.setPw(modifypw);
		System.out.println(vo.getId());
		System.out.println(vo.getPw());
		boolean isc = service.updatepw(vo);
		System.out.println(isc);
		return "userModified";
	}
	
	@RequestMapping(value = "/singout.do", method = RequestMethod.GET)
	public String singoutform() {
		return "signoutPage";
	}
	
	@RequestMapping(value = "/signoutuserchk.do", method = RequestMethod.POST)
	@ResponseBody
	public String signoutuserchk(String pw, HttpSession session) {
		MemberVo vo = new MemberVo();
		vo.setId((String)session.getAttribute("id"));
		vo.setPw(pw);
		System.out.println(vo.getId());
		System.out.println(vo.getPw());
		String id = service.signoutuserchk(vo);
		return id;
	}
	
	@RequestMapping(value = "/signoutuser.do", method = RequestMethod.POST)
	public String signoutuser() {
		return "signoutuser";
	}
	
	@RequestMapping(value = "/updateuser.do", method = RequestMethod.GET)
	public String updateuser(HttpSession session) {
		String id = (String)session.getAttribute("id");
		System.out.println(id);
		session.invalidate();
		return "signoutsuccess";
	}
}
