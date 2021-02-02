package com.sic.pdm.ctrl.del;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sic.pdm.model.del.DelIService;
import com.sic.pdm.vo.del.DelVo;




@Controller
public class delController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private DelIService dservice;
	
	// 배송지 목록 조회
	@RequestMapping(value="/delList.do", method=RequestMethod.GET )
	public String getDelList(Model model,HttpSession session) {
		logger.info("welcome delList.do");
		String id = (String)session.getAttribute("id");
		
		List<DelVo> lists = dservice.getDelList(id);
		model.addAttribute("lists",lists);
		logger.info("list값 확인 \t {}",lists);
		
		DelVo vo = dservice.getdefaultAddr(id);
		model.addAttribute("dvo", vo);
		return "LYM_delList";
	}
	
	
	@RequestMapping(value = "/insertForm.do", method=RequestMethod.GET)
	public String insertForm() {
		return "LYM_insertDel";
	}
	
	// 배송지 등록
	@RequestMapping(value = "/insertDel.do", method=RequestMethod.POST)
	public String insertDel(DelVo vo, HttpSession session) {
		String mvo = (String)session.getAttribute("id");
		vo.setId(mvo);		
		System.out.println("아이디값"+vo.getId());
		dservice.insertDel(vo);
		
		return "redirect:delList.do";
	}
	
	// 배송지 수정
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/modifyForm.do", method = RequestMethod.POST, 
					produces = "application/text; charset=UTF-8;")
	@ResponseBody
	public String modifyForm(String dnum) {
		DelVo dto = dservice.getOneDelList(dnum);
		System.out.println("dnum값확인"+dto.getDnum());
		JSONObject json = new JSONObject();
		json.put("dnum", dto.getDnum());
		json.put("id", dto.getId());
		json.put("dname", dto.getDname());
		json.put("roadaddr", dto.getRoadaddr());
		json.put("addr", dto.getAddr());
		json.put("phone", dto.getPhone());
		json.put("addrflag", dto.getAddrflag());
		
		System.out.println(json.toString());
		return json.toString();
	}
	
	@RequestMapping(value = "/modify2.do", method = RequestMethod.POST)
	public String modify2(DelVo vo, HttpSession session) {
		logger.info("welcome modifyForm2.do : \t {}",vo);
		String id = (String)session.getAttribute("id");
		dservice.addrflagN(id);
		dservice.addrflag(vo);
		dservice.updateDel(vo);
				
		return "redirect:/delList.do";
	}
	
	@RequestMapping(value = "/modify.do", method = RequestMethod.POST)
	public String modify(DelVo vo, HttpSession session) {
		logger.info("welcome modifyForm.do : \t {}",vo);
		dservice.addrflag(vo);
		dservice.updateDel(vo);
		
		return "redirect:/delList.do";
	}
	
	// 배송지 삭제
	@RequestMapping(value = "/deleteDel.do", method = RequestMethod.GET)
	public String deleteDel(String dnum,HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		String id = (String)session.getAttribute("id");
		map.put("dnum", dnum); 
		map.put("id", id);
		dservice.deleteDel(map);
		return "redirect:/delList.do";
	}
}
