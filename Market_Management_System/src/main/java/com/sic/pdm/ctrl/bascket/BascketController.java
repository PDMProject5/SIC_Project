package com.sic.pdm.ctrl.bascket;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sic.pdm.model.bascket.BascketIService;

import com.sic.pdm.vo.bascket.BascketVo;


@Controller
public class BascketController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private BascketIService bservice; 
	

	
	@RequestMapping(value = "/bascketList.do", method=RequestMethod.GET)
	public String bascketList(Model model,HttpSession session) {
		String id = (String)session.getAttribute("id");
		List<BascketVo> lists = bservice.getAllBascket(id);
		model.addAttribute("lists", lists);
		logger.info("리스트 값: "+lists);
		return "LYM_bascketList";
	}
	
	@RequestMapping(value = "/insertBascket.do", method=RequestMethod.POST)
	public String insertBascket(BascketVo vo, HttpSession session) {
		String id = (String)session.getAttribute("id");
		vo.setId(id);
		String store = "가산디지털단지점";
		vo.setStore(store);
		
		
		bservice.addBascket(vo);
		bservice.addDetailBascket(vo);

		return "redirect:/bascketList.do";
	}
	
	
}
