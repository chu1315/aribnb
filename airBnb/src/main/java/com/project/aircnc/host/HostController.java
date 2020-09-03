package com.project.aircnc.host;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.aircnc.common.BuildTypeVO;
import com.project.aircnc.common.FaciliteVO;
import com.project.aircnc.common.GestSpaceVO;
import com.project.aircnc.common.HostUserVO;
import com.project.aircnc.common.SafePlantVO;
import com.project.aircnc.common.SpaceInfoVO;
import com.project.aircnc.common.TUserVO;

@Controller
@RequestMapping("/host")
public class HostController {
	
	@Autowired
	HostService service;
	// 숙소 등록 버튼 페이지  
	@RequestMapping(value = "/hostSave", method = RequestMethod.GET)
	public String hosting (HttpSession hs, Model model) {
		
		TUserVO loginUser = (TUserVO)hs.getAttribute("loginUser");
		if(loginUser == null) {
			return "/index";
		}
		
		return "/host/hostSave";
	}
	// 숙소등록페이지에서 완료 누르면 포스트로 와서 DB등록하고 인덱스로 다시 넘어간다 -> 인덱스로 넘어가는걸 상세보기 페이지로 넘어가게 만들것이다.
	@RequestMapping(value = "/hostSave", method = RequestMethod.POST)
	public String saveOne (HostUserVO param,HttpSession hs, Model model) {
		TUserVO loginUser = (TUserVO)hs.getAttribute("loginUser");
		if(loginUser == null) {
			return "/index";
		}
		
		int result = service.insHostSaveOne(param);
		model.addAttribute("i_host",service.getI_Host(param));
		return "/index";
	}
	
}
