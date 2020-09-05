package com.project.aircnc.search;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SearchController {

	@Autowired
	private SearchSearvice service;

	// 검색창 자동 완성 메소드 구현중
	
	
	@RequestMapping(value = "/index/search", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> goAddr(@RequestParam String
	s_addr){// @ResponseBody 모든 객체 데이터 
		Map<String, Object> map = new HashMap<String, Object>(); 
		map.put("result", service.searchList(s_addr));
	return map; 
	}
	
	@RequestMapping(value = "/search/searchMain", method = RequestMethod.GET)
	public String goSearchMain(@RequestParam("addr") String addr, HttpSession hs,
			HttpServletResponse response) {
		
//		response.setCharacterEncoding("UTF-8");
		System.out.println("addr : " + addr);
		hs.setAttribute("data", service.searchList(addr));
		
		return "search/searchMain";
	}
	
	@RequestMapping(value="/searchMain", method=RequestMethod.GET)
	public String gosearchmain() {
		return "searchMain";
	}

	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping(value="/getSearchList", method=RequestMethod.GET) public
	 * Map<String, Object> getSearchList(@RequestParam("addr")String addr, Model
	 * model ,HttpSession hs, HttpServletResponse response) { Map<String, Object>
	 * map = new HashMap();
	 * 
	 * 
	 * return map; }
	 */

//	@RequestMapping(value = "/search/map", method = RequestMethod.GET)
//	public String goSearchMap( SearchVO param, Model model ,HttpSession hs) 
//	{
//		// 세션의 i_user 로그인 유저 정보 
//		TUserVO vo = (TUserVO)hs.getAttribute("loginUser");
//		param.setI_user(vo.getI_user());
//		
//		// 날짜 데이터 형변환시 예외처리가 필요 
//		try {
//			model.addAttribute("data",service.hostList(param));
//			model.addAttribute("sData", param);
//		} catch (ParseException e) {
//			e.printStackTrace();
//		} catch (java.text.ParseException e) {
//			e.printStackTrace();
//		}
//		
//		return "search/map";
//	}

}
