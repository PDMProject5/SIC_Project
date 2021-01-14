package com.sic.pdm.ctrl.coupon;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.sic.pdm.model.coupon.ICouponService;
import com.sic.pdm.util.UploadFileUtils;
import com.sic.pdm.vo.coupon.CouponVo;


@Controller
public class CouponController {
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@Autowired
	private ICouponService icsvc;

	// 쿠폰 목록
	@RequestMapping(value = "/viewListCoupon.do", method = RequestMethod.GET)
	public String viewListCoupon(HttpSession session, Model model) {
		String sellerId = (String) session.getAttribute("sellerid");
		List<CouponVo> cList = icsvc.viewListCoupon(sellerId);
		model.addAttribute("cList", cList);
		
		return "CHS_list";
	}
	
	// 쿠폰 클릭시 이동
	@RequestMapping(value = "/viewOneCoupon.do")
	public String viewOneCoupon (String cseq, Model model) {
		CouponVo cv = icsvc.viewOneCoupon(cseq);
		model.addAttribute("cv", cv);
		
		return "CHS_viewOneCoupon";
	}
	
	// 쿠폰 등록 페이지 이동
	@RequestMapping(value = "/goInsertCoupon.do", method = RequestMethod.GET)
	public String goInsertCoupon() {
		
		return "CHS_insert";
	}
	
	// 쿠폰 등록
	@RequestMapping(value = "/insertCoupon.do", method = RequestMethod.POST)
	public String insertCoupon(CouponVo cDto,  
			@RequestParam(value = "cdstate") String cdstate, 
			HttpSession session, MultipartFile file) {
		
		String sellerid = (String) session.getAttribute("sellerid");
		cDto.setSellerid(sellerid);
		
		try {
			
			// 이미지를 업로드하였을때 이미지를 저장하는 폴더 생성
			String imgUploadPath = uploadPath + File.separator + "imageUpload";
			String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
			String fileName = null;
			System.out.println(uploadPath);
			System.out.println(imgUploadPath);

			if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
				// 파일 인풋박스에 첨부된 파일이 없다면(=첨부된 파일이 이름이 없다면)
				
				fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
		
				// gdsImg에 원본 파일 경로 + 파일명 저장
				cDto.setCimg(File.separator + "imgeUpload" + ymdPath + File.separator + fileName);
				// gdsThumbImg에 썸네일 파일 경로 + 썸네일 파일명 저장
				cDto.setCthumbimg(File.separator + "imgeUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
				
			} else {  // 첨부된 파일이 없으면
				
				fileName = File.separator + "images" + File.separator + "none.png";
				
				// 미리 준비된 none.png파일을 대신 출력함
				cDto.setCimg(fileName);
				cDto.setCthumbimg(fileName);
			}
			
			icsvc.insertCoupon(cDto);
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("sellerid",sellerid);
			map.put("cdstate",cdstate);
			
			// CouponDetail 상태 입력
			icsvc.insertCouponState(map);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/viewListCoupon.do";
	}
	
	// 쿠폰 수정
	@RequestMapping(value = "/updateCoupon.do", method = RequestMethod.POST)
	public String updateCoupon(CouponVo cDto,
			@RequestParam(value = "cdstate" , required = false) String cdstate, MultipartFile file, HttpServletRequest req) {
		try {
			if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
				
				// 파일 인풋박스에 첨부된 파일이 없다면(=첨부된 파일이 이름이 없다면)
				new File(uploadPath + req.getParameter("cimg")).delete();
				new File(uploadPath + req.getParameter("cthumbimg")).delete();
				
				String imgUploadPath = uploadPath + File.separator + "imageUpload";
				String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
				String fileName = null;
				
				// gdsImg에 원본 파일 경로 + 파일명 저장
				cDto.setCimg(File.separator + "imgeUpload" + ymdPath + File.separator + fileName);
				// gdsThumbImg에 썸네일 파일 경로 + 썸네일 파일명 저장
				cDto.setCthumbimg(File.separator + "imgeUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
				
			} else {  // 새로운 파일이 등록되지 않았다면
				
				// 기존 이미지 그대로 사용함
				cDto.setCimg(req.getParameter("cimg"));
				cDto.setCthumbimg(req.getParameter("cthumbimg"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		icsvc.updateCoupon(cDto);
		// CouponDetail 상태 수정
		icsvc.updateCouponState(cdstate);
		
		return "redirect:/viewListCoupon.do";
	}
	
	// 쿠폰 삭제
	@RequestMapping(value = "/deleteCoupon.do", method = RequestMethod.GET)
	public String deleteCoupon(String cseq) {
		icsvc.deleteCoupon(cseq);
		return "redirect:/viewListCoupon.do";
	}

}
