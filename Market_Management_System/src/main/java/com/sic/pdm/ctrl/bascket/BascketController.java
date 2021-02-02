package com.sic.pdm.ctrl.bascket;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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

import com.sic.pdm.model.bascket.BascketIService;
import com.sic.pdm.model.del.DelIService;
import com.sic.pdm.model.mileage.Mileage_IService;
import com.sic.pdm.model.product.IProductService;
import com.sic.pdm.model.user.ISellerService;
import com.sic.pdm.vo.bascket.BascketVo;
import com.sic.pdm.vo.del.DelVo;
import com.sic.pdm.vo.mileage.MileageVo;
import com.sic.pdm.vo.product.ProductVo;
import com.sic.pdm.vo.user.SellerVo;


@Controller
public class BascketController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private BascketIService bservice; 
	
	@Autowired
	private IProductService pservice;
	
	@Autowired
	private DelIService dservice;
	
	@Autowired
	private Mileage_IService mservice;
	
	@Autowired
	private ISellerService selService;
	
	// 장바구니 조회
	@RequestMapping(value = "/bascketList.do", method=RequestMethod.GET)
	public String bascketList(Model model,HttpSession session) {
		String store = (String)session.getAttribute("store");
		String id = (String)session.getAttribute("id");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		
		SellerVo svo = selService.sellerOne(store);
		String sellerid = svo.getSellerid();
		System.out.println("판매자"+sellerid);

		System.out.println("지점명"+store);
		map.put("store", store);
		if(id == null) {
			return "sessionexpiration";
		}else {
		List<BascketVo> lists = bservice.getAllBascket(map);
		model.addAttribute("lists", lists);
		logger.info("리스트 값: "+lists);

		return "LYM_bascketList";
		}
	}
	
	// 장바구니 추가
	@RequestMapping(value = "/insertBascket.do", method=RequestMethod.POST)
	public String insertBascket(BascketVo vo, HttpSession session,Model model) {
		String id = (String)session.getAttribute("id");
		vo.setId(id);
		String store = (String)session.getAttribute("store");
		vo.setStore(store);		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("store", store);
		
		if(bservice.checkBascket(map) == null ) {
			bservice.addBascket(vo);
			bservice.addDetailBascket(vo);
		}else {
			BascketVo bvo = bservice.checkBascket(map);
			System.out.println(bvo);
			// 장바구니 페이지에 값이 없으면 addbascket 그 외엔 addDetaill
			String state = bvo.getOstate();
			String chkStore = bvo.getStore();
			System.out.println("state값"+state);
			System.out.println("chkstore값"+chkStore);
						
			if(state.equalsIgnoreCase("B") && chkStore.equalsIgnoreCase(store)) {
				bservice.addDetailBascket(vo);			
			}	
		}
		return "redirect:/bascketList.do";
	}
	
	// 장바구니 삭제
	@RequestMapping(value = "/multiDel.do", method=RequestMethod.POST)
	public String multiDel(@RequestParam(value = "chkVal", required = true) List<String> chkVal) {
		logger.info("welcome multiDel.do : \t {}",chkVal);
		
		boolean isc =bservice.deleteBascket(chkVal);
		System.out.println("삭제 확인"+isc);
		return "redirect:/bascketList.do";
	}
	
	@RequestMapping(value = "/multiDel2.do", method=RequestMethod.POST)
	public String multiDel2(@RequestParam(value = "chkVal", required = true) List<String> chkVal, HttpSession session) {
		logger.info("welcome multiDel2.do : \t {}",chkVal);
		String store = (String)session.getAttribute("store");
		String id = (String)session.getAttribute("id");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("store", store);
		map.put("id", id);
		BascketVo bvo = (BascketVo)bservice.getAllBascket(map);
		String onum = bvo.getOnum();
		bservice.deleteBascket(chkVal);
		boolean isc = bservice.deleteBascketOne(onum);
		System.out.println("삭제 확인"+isc);
		return "redirect:/bascketList.do";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/modifyStock.do", method = RequestMethod.POST, 
					produces = "application/text; charset=UTF-8;")
	@ResponseBody
	public String modifyForm(String odnum, HttpSession session) {
		
		String id = (String)session.getAttribute("id");
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("odnum", odnum);
		map.put("id", id);
		BascketVo bvo = bservice.getOneBascket(map);
		System.out.println("odnum값확인"+odnum);
		JSONObject json = new JSONObject();
		json.put("odnum", bvo.getOdnum());
		json.put("id", bvo.getId());
		json.put("iname", bvo.getIname());
		json.put("oprice", bvo.getOprice());
		
		System.out.println(json.toString());
		return json.toString();
	}
	
	// 장바구니 제품 수량 변경
	@RequestMapping(value = "/StoUpdate.do",method= RequestMethod.POST)
	public String StoUpdate(BascketVo vo) {
		Map<String, Object> map = new HashMap<String, Object>();
		String odstock = vo.getOdstock();
		map.put("odstock", odstock);
		System.out.println("odstock값"+odstock);
		
		String odnum = vo.getOdnum();
		map.put("odnum", odnum);
		System.out.println("odnum값"+odnum);
		
		bservice.modifyBascket(map);
		
		return "redirect:/bascketList.do";
	}
	
	
	@RequestMapping(value="/order.do" , method = RequestMethod.POST)
	public String Order(@RequestParam List<String> chkVal,Model model, HttpSession session) {
		System.out.println(chkVal);
		String id = (String)session.getAttribute("id");
		List<BascketVo> list = bservice.getOrderInfo(chkVal);
		System.out.println(list);
		model.addAttribute("list", list);
		DelVo vo = dservice.getdefaultAddr(id);
		model.addAttribute("vo", vo);
		
		String store = (String)session.getAttribute("store");
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("id", id);
        map.put("store", store);
        BascketVo bvo = bservice.getOrder(map);
        System.out.println("오더페이지에 전달되는 값"+bvo);
        System.out.println(bvo.getOnum());
        model.addAttribute("bvo", bvo);
		
		return "LYM_orderPage";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/selectOne.do", method = RequestMethod.POST, produces = "application/text; charset=UTF-8;")
	@ResponseBody
	public String selectOne(String dnum, Model model) {
		DelVo dvo = dservice.getOneDelList(dnum);
		System.out.println("번호확인"+dnum);

		JSONObject json = new JSONObject();
		json.put("dnum", dvo.getDnum());
		json.put("dname", dvo.getDname());
		json.put("roadaddr", dvo.getRoadaddr());
		json.put("addr", dvo.getAddr());
		json.put("phone", dvo.getPhone());
		
		System.out.println(json.toString());
		return json.toString();
	}
	
	@RequestMapping(value="/modalSel.do", method=RequestMethod.GET)
	public String selModal(HttpSession session, Model model) {
		String id = (String)session.getAttribute("id");
		List<DelVo> lists = dservice.getDelList(id);
		model.addAttribute("del", lists);
		return "LYM_delModal";
	}
}
