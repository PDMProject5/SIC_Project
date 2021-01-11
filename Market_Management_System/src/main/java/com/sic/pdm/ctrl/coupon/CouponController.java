package com.sic.pdm.ctrl.coupon;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;

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
	
	@RequestMapping(value = "/goInsertCoupon.do", method = RequestMethod.GET)
	public String goInsertCoupon() {
		
		return "CHS_insert";
	}
	
	// 쿠폰 목록
	@RequestMapping(value = "/list.do", method = RequestMethod.GET)
	public String listCoupon(Model model) {
		
		List<CouponVo> list = icsvc.CouponList();
		model.addAttribute("cList", list);
		
		return "CHS_list";
	}
	
	@RequestMapping(value = "/ViewListCoupon.do", method = RequestMethod.GET)
	public String ViewListCoupon(Model model) {
		return "CHS_list";
	}
	
	// 쿠폰 등록
	@RequestMapping(value = "/insertCoupon.do", method = RequestMethod.POST)
	public String insertCoupon(CouponVo cDto,  
			@RequestParam(value = "cdState") String cState, MultipartFile file) {
//		Map<String, String[]> map = new HashMap<String, String[]>();
//		map.put("cState", cState);
//		icsvc.insertCouponState(map);
		
		try {
			
			// 이미지를 업로드하였을때 이미지를 저장하는 폴더 생성
			String imgUploadPath = uploadPath + File.separator + "imageUpload";
			String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
			String fileName = null;

			if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
				// 파일 인풋박스에 첨부된 파일이 없다면(=첨부된 파일이 이름이 없다면)
				
				fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
		
				// gdsImg에 원본 파일 경로 + 파일명 저장
				cDto.setcImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
				// gdsThumbImg에 썸네일 파일 경로 + 썸네일 파일명 저장
				cDto.setcTumbImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
				
			} else {  // 첨부된 파일이 없으면
				fileName = File.separator + "images" + File.separator + "none.png";
				// 미리 준비된 none.png파일을 대신 출력함
				
				cDto.setcImg(fileName);
				cDto.setcTumbImg(fileName);
			}
			
			boolean result = icsvc.insertCoupon(cDto);
			
			// CouponDetail 체크박스를 통해 상태 변경
			icsvc.insertCouponState(cState);
			
		} catch (Exception e) {

		}
		
		return "redirect:/CHS_list.do";
	}
	
	// 쿠폰 수정
	@RequestMapping(value = "/updateCoupon.do", method = RequestMethod.POST)
	public String updateCoupon() {
		return "redirect:/CHS_list.do";
	}
	
	// 쿠폰 삭제
	@RequestMapping(value = "/deleteCoupon.do", method = RequestMethod.GET)
	public String deleteCoupon(String cSeq) {
		icsvc.deleteCoupon(cSeq);
		return "redirect:/CHS_list.do";
	}
	
	

}
