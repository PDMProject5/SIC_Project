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
	
	@RequestMapping(value = "/bascketList.do", method=RequestMethod.GET)
	public String bascketList(Model model,HttpSession session) {
		String store = (String)session.getAttribute("store");
		String id = (String)session.getAttribute("id");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		
		String sellerid = (String)session.getAttribute("sellerid");
		System.out.println("판매자"+sellerid);
//		SellerVo svo = selService.sellerOne(sellerid);
//		System.out.println("판매자정보"+svo);
//		String store = svo.getStore();
		System.out.println("지점명"+store);
		map.put("store", store);
		if(id == null) {
			return "sessionexpiration";
		}else {
		List<BascketVo> lists = bservice.getAllBascket(map);
		model.addAttribute("lists", lists);
		logger.info("리스트 값: "+lists);

		// 장바구니에서 선택한 제품 재고와  재고수량 비교
//		List<ProductVo> plists = pservice.getProdList("admin01");
//		model.addAttribute("plists", plists);
		return "LYM_bascketList";
		}
	}
	
	@RequestMapping(value = "/insertBascket.do", method=RequestMethod.POST)
	public String insertBascket(BascketVo vo, HttpSession session,Model model) {
		String id = (String)session.getAttribute("id");
		vo.setId(id);
		String store = (String)session.getAttribute("store");
		vo.setStore(store);		
		
		bservice.addBascket(vo);
		bservice.addDetailBascket(vo);

		return "redirect:/bascketList.do";
	}
	
	@RequestMapping(value = "/multiDel.do", method=RequestMethod.POST)
	public String multiDel(@RequestParam(value = "chkVal", required = true) List<String> chkVal) {
		logger.info("welcome multiDel.do : \t {}",chkVal);
		
		boolean isc =bservice.deleteBascket(chkVal);
		System.out.println("삭제 확인"+isc);
		return "redirect:/bascketList.do";
	}
	
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/modifyStock.do", method = RequestMethod.POST, produces = "application/text; charset=UTF-8;")
	@ResponseBody
	public String modifyForm(String onum, HttpSession session) {
		
		String id = (String)session.getAttribute("id");
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("onum", onum);
		map.put("id", id);
		BascketVo bvo = bservice.getOneBascket(map);
		System.out.println("onum값확인"+onum);
		JSONObject json = new JSONObject();
		json.put("onum", bvo.getOnum());
		json.put("id", bvo.getId());
		json.put("iname", bvo.getIname());
		json.put("oprice", bvo.getOprice());
		
		System.out.println(json.toString());
		return json.toString();
	}
	
	@RequestMapping(value = "/StoUpdate.do",method= RequestMethod.POST)
	public String StoUpdate(BascketVo vo) {
		Map<String, Object> map = new HashMap<String, Object>();
		String odstock = vo.getOdstock();
		map.put("odstock", odstock);
		System.out.println("odstock값"+odstock);
		
		String onum = vo.getOnum();
		map.put("onum", onum);
		System.out.println("onum값"+onum);
		
		bservice.modifyBascket(map);
		
		return "redirect:/bascketList.do";
	}
	
	
	@RequestMapping(value="/order.do" , method = RequestMethod.POST)
	public String Order(@RequestParam List<String> chkVal, Model model, HttpSession session) {
		System.out.println(chkVal);
		String id = (String)session.getAttribute("id");
		MileageVo mil = mservice.totalMiles(id);
		List<BascketVo> list = bservice.getOrderInfo(chkVal);
		System.out.println(list);
		model.addAttribute("list", list);
		model.addAttribute("mil",mil);
		DelVo vo = dservice.getdefaultAddr(id);
		model.addAttribute("vo", vo);
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
