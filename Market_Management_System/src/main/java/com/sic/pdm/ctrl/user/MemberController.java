package com.sic.pdm.ctrl.user;

import java.util.Random;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	// 서버가 처음 돌았을 때 mainPage로 갈 수 있게 해주는 메소드
	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public String main() {
		return "mainPage";
	}
	
	// 로그인 페이지로 이동할 수 있게 해주는 메소드
	@RequestMapping(value = "/loginForm.do", method = RequestMethod.GET)
	public String loginForm(HttpSession session) {
		session.removeAttribute("sessionchk");
		return "loginForm";
	}
	
	// 회원가입 페이지로 이동할 수 있게 해주는 메소드
	@RequestMapping(value = "/singUp.do", method = RequestMethod.GET)
	public String singUp() {
		return "signUp";
	}
	
	// 회원가입페이지에서 중복확인을 눌렀을 때 아이디중복검사 페이지로 이동할 수 있게 해주는 메소드
	@RequestMapping(value = "/idchk.do", method = RequestMethod.GET)
	public String idchk() {
		return "idchk";
	}
	
	// 입력한 아이디값을 가져와서 db안에 중복된 아이디가 있는지 확인하고 ajax로 반환값을 보내주는 메소드
	@RequestMapping(value = "/duplicate.do", method = RequestMethod.POST)
	@ResponseBody
	public String duplicate(String id) {
		String idchk = service.idchk(id);
		return idchk;
	}
	
	// 휴대폰 인증 버튼을 눌렀을 때 휴대폰 인증페이지를 열어 주는 메소드
	@RequestMapping(value = "/phonechk.do", method = RequestMethod.GET)
	public String Phonechk() {
		return "phonechk";
	}
	
	// 휴대폰 인증을 하기 위해서 휴대폰인증번호 4자리를 ajax로 태워서 보내주는 메소드
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
	
	// 회원가입페이지에 있는 값을 모두 입력했을 때 그값을 받아와서 회원가입을 진행하는 메소드
	@RequestMapping(value = "/newSingup", method = RequestMethod.POST)
	public String newSingup(MemberVo vo) {
		System.out.println(vo.getAddr());
		
		boolean isc = service.singup(vo);
			return "mainPage";
	}
	
	// loginchk()에서 로그인 정보가 있다면 그 정보를 가져와서 로그인을 하고 세션에 로그인 아이디를 담아서 로그인 페이지로 이동시켜주는 메소드
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String login(String id, HttpSession session, String judgment, HttpServletResponse response) {
		System.out.println(judgment);
		String sessionchk = (String)session.getAttribute("sessionchk");
		System.out.println(sessionchk);
		if(sessionchk!=null) {
			return "sessionexpiration";
		}else{
			response.setHeader("Pragma", "no-cache");
			response.setHeader("Cache-Control", "no-cache");
			response.setHeader("Cache-Control", "no-store");
			response.setHeader("Expires", "0");
			if(judgment.trim().equals("seller")) {
				session.setAttribute("sellerid", id);
				return "sellermainPage";
			}else{
				session.setAttribute("id", id);
				return "usermainPage";
			}
		}
	}
	// 로그인 할 때 로그인 정보가 db에 있는지 ajax로 판단하는 메소드
	@RequestMapping(value = "/loginchk.do", method = RequestMethod.POST)
	@ResponseBody
	public String loginchk(MemberVo vo) {
//		System.out.println(vo.getId());
//		System.out.println(vo.getPw());
		String logindata = service.loginchk(vo);
		return logindata;
	}
	
	// 로그아웃 버튼을 누르면 동작되는 메소드
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("id");
		session.setAttribute("sessionchk", "로그인실패");
		return "mainPage";
	}
	
	
	// 회원정보 수정을 눌렀을 때 화면이 이동할 수 있게 해주는 메소드
	@RequestMapping(value = "/userModified.do", method = RequestMethod.GET)
	public String userupdate(HttpSession session) {
		
		// 세션에 있는 아이디를 넣은 변수
		String sessionchk = (String)session.getAttribute("id");
		if(sessionchk == null) {
			return "sessionexpiration";
		}else {
			return "userModified";
		}
		
	}
	
	// 비밀번호 변경 버튼을 눌렀을 때 비밀번호 변경 페이지로 이동할 수 있게 해주는 메소드
	@RequestMapping(value = "/updatepw.do")
	public String updatepw(HttpSession session) {
		String sessionchk = (String)session.getAttribute("id");
		if(sessionchk == null) {
			return "sessionexpiration";
		}else {
			return "updatepw";
		}
		
		
	}
	
	// 비밀번호 변경에서 현재비밀번호를 확인하기 위해서 ajax로 화면에서 입력한 값과 db에 있는 값을 비교하는 메소드
	@RequestMapping(value = "/nowpwcheck.do", method = RequestMethod.POST)
	@ResponseBody
	public String nowpwcheck(String pw, HttpSession session) {
		MemberVo vo = new MemberVo();
		vo.setId((String)session.getAttribute("id"));
		vo.setPw(pw);
//		System.out.println(vo.getId());
//		System.out.println(vo.getPw());
		String nowpwcheck = service.nowpwcheck(vo);
		return nowpwcheck;
	}
	
	// 입력한 값이 문제가 없을 때 비밀번호가 변경되게 해주는 메소드
	@RequestMapping(value = "/modifypw.do", method = RequestMethod.POST)
	public String modifypw(String modifypw, HttpSession session) {
			String id = (String)session.getAttribute("id");
			MemberVo vo = new MemberVo();
			vo.setId(id);
			vo.setPw(modifypw);
//			System.out.println(vo.getId());
//			System.out.println(vo.getPw());
			boolean isc = service.updatepw(vo);
//			System.out.println(isc);
			return "userModified";
	}
	
	// 회원탈퇴 버튼을 눌렀을 때 회원탈퇴 페이지로 이동시켜주는 메소드
	@RequestMapping(value = "/singout.do", method = RequestMethod.GET)
	public String singoutform(HttpSession session) {
		String sessionchk = (String)session.getAttribute("id");
		System.out.println(sessionchk);
		if(sessionchk == null) {
			return "sessionexpiration";
		}else {
			return "signoutPage";
		}
	}
	
	// 회원탈퇴 진행시 현재 비밀번호가 맞는지 판단해주는 ajax메소드
	@RequestMapping(value = "/signoutuserchk.do", method = RequestMethod.POST)
	@ResponseBody
	public String signoutuserchk(String pw, HttpSession session) {
		MemberVo vo = new MemberVo();
		vo.setId((String)session.getAttribute("id"));
		vo.setPw(pw);
//		System.out.println(vo.getId());
//		System.out.println(vo.getPw());
		String id = service.signoutuserchk(vo);
		return id;
	}
	
	// 현재 비밀번호가 맞다면 회원탈퇴시 주의사항을 알려주는 페이지로 이동시켜주는 메소드
	@RequestMapping(value = "/signoutuser.do", method = RequestMethod.POST)
	public String signoutuser() {
		return "signoutuser";
	}
	
	// 주의사항을 확인하고 확인버튼을 눌렀을 때 db에 있는 사용자 정보를 삭제시키는 메소드
	@RequestMapping(value = "/updateuser.do", method = RequestMethod.GET)
	public String updateuser(HttpSession session) {
		String id = (String)session.getAttribute("id");
		if(id == null) {
			return "sessionexpiration";
		}else {
//			System.out.println(id);
			boolean isc = service.signoutuser(id);
//			System.out.println(isc);
			session.invalidate();
			return "signoutsuccess";
		}
	}
	
	// 아이디 찾기 버튼을 눌렀을 때 아이디 찾기 페이지로 이동시켜주는 메소드
	@RequestMapping(value = "/findid.do", method = RequestMethod.GET)
	public String findid(){
		return "findid";
	}
	
	// 입력한 값이 db에 있다면 findid 등록된 아이디를, 없다면 계정이 없다고 현제 페이지에 띄워주는 메소드
	@RequestMapping(value = "/resultid.do", method = RequestMethod.POST)
	public String resultid(MemberVo vo, Model model){
//		System.out.println(vo.getName());
//		System.out.println(vo.getPhone());
		String id = service.findid(vo);
		System.out.println(id);
		if(id == null || id.equals("")) {
			model.addAttribute("nodata", "등록된 계정이 존재하지 않습니다.");
			return "findid";
		}else{
			model.addAttribute("findid", id);
			return "resultid";
		}
	}
	
	// 비밀번호 찾기 페이지로 이동시켜주는 메소드
	@RequestMapping(value = "/findpw.do", method = RequestMethod.GET)
	public String findpw() {
		return "findpw";
	}
	
	// 화면에서 입력한 정보가 db에 있다면 resultpw페이지로 없다면 계정이 없다고 해당 페이지에 출력시켜주는 메소드
	@RequestMapping(value = "/resultpw.do", method = RequestMethod.POST)
	public String resultpw(MemberVo vo, Model model){
//		System.out.println(vo.getName());
//		System.out.println(vo.getPhone());
		String id = service.findpw(vo);
//		System.out.println(id);
		if(id == null || id.equals("")) {
			model.addAttribute("nodata", "등록된 계정이 존재하지 않습니다.");
			return "findpw";
		}else{
			model.addAttribute("findid", id);
			return "resultpw";
		}
	}
	
	// 비밀번호 찾기 페이지에서 수정할 비밀번호를 입력후 화면에 있는 정보를 가져와서 비밀번호를 바꿔주는 메소드
	@RequestMapping(value = "/findpwform.do", method = RequestMethod.POST)
	public String findpwform(MemberVo vo) {
//		System.out.println(vo.getId());
//		System.out.println(vo.getPw());
		boolean isc = service.updatepw(vo);
		return "succeesfindpw";
	}
}
