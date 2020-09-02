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

@Controller
@RequestMapping("/host")
public class HostController {
	
	@Autowired
	HostService service;
	// 숙소 등록 버튼 페이지  
	@RequestMapping(value = "/hosting", method = RequestMethod.GET)
	public String hosting (HttpSession hs, Model model) {
		
		return "/host/hosting";
	}
	// 숙소 등록 1단계
	@RequestMapping(value = "/hostSave", method = RequestMethod.POST)
	public String save (HttpSession hs, Model model) {
		
		return "host/hostSave";
	}
	//2단계  숙소- 등록 1단계 - > 2단계
	@RequestMapping(value = "/hostSaveOne", method = RequestMethod.POST)
	public String saveOne (HostUserVO param,HttpSession hs, Model model) {
		int result = service.insHostSaveOne(param);
		model.addAttribute("i_host",service.getI_Host(param));
		return "host/hostSaveOne";
	}
	//3단계  숙소- 등록 2단계 - > 3단계
	@RequestMapping(value = "/hostSaveTwo", method = RequestMethod.POST)
	public String saveTwo (BuildTypeVO param,HttpSession hs, Model model) {
		int result = service.insHostSaveTwo(param);
		model.addAttribute("i_host",param.getI_host());
		return "host/hostSaveTwo";
	}
	//4단계  숙소- 등록 3단계 - > 4단계
	@RequestMapping(value = "/hostSaveThree", method = RequestMethod.POST)
	public String saveThree (FaciliteVO param1,SafePlantVO param2 ,HttpSession hs, Model model) {
		int result1 = service.insHostSaveThree(param1);
		int result2 = service.insHostSaveThree1(param2);
		model.addAttribute("i_host",param1.getI_host());
		return "host/hostSaveThree";
	}
	//5단계  숙소- 등록 4단계 - > 5단계
	@RequestMapping(value = "/hostSaveFour", method = RequestMethod.POST)
	public String saveFour (GestSpaceVO param,HttpSession hs, Model model) {
		int result1 = service.insHostSaveFour(param);
		model.addAttribute("i_host",param.getI_host());
		return "host/hostSaveFour";
	}
	
	//5단계  숙소- 등록 4단계 - > 5단계
	@RequestMapping(value = "/hostSaveFive", method = RequestMethod.POST)
	public String saveFive (SpaceInfoVO param,HttpSession hs, Model model) {
		int result1 = service.insHostSaveFive(param);
		model.addAttribute("i_host",param.getI_host());
		model.addAttribute("locaInfo",MyUtils.getSTRFilter(param.getLoca_info()));		
		return "host/hostSaveFive";
	}
	
}
