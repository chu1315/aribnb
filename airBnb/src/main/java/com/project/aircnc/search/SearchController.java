package com.project.aircnc.search;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
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

import com.project.aircnc.common.TUserVO;

@Controller
public class SearchController {

	@Autowired
	private SearchSevice service;

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
			HttpServletResponse response, Model model) {
		
		System.out.println("addr : " + addr);
		hs.setAttribute("data", service.searchList(addr));
		hs.setAttribute("addr", addr);
		return "search/searchMain";
	}
	
	@RequestMapping(value="/search/searchDetail", method=RequestMethod.GET)
	public String searchDetail(int i_host, int i_user, HttpSession hs) {
		TUserVO loginUser = (TUserVO)hs.getAttribute("loginUser");
		
//		System.out.println("Detail i_host : " + i_host); // i_host를 이용해서 host_user에 있는 정보를 불러올것
//		그리고 i_host를 이용해서 host_pic에서도 사진을 다 불러올 것
//		System.out.println("Detail i_user : " + i_user); //글쓴이 이름 가져올 것
		
		hs.setAttribute("detailData", service.detail(i_host)); // host_user테이블에 있는 정보 다 불러옴.
		hs.setAttribute("writer", service.writer(i_user)); // t_user 테이블의 nm과 e_mail 가져온다
		hs.setAttribute("hostPic", service.hostPic(i_host)); // host_pic 테이블의 사진을 다 불러올 것
		hs.setAttribute("i_host", i_host);
		
		return "search/searchDetail";
	}
	
	@RequestMapping(value="/search/searchDelete", method=RequestMethod.GET)
	public String searchDelete(HttpSession hs, int i_host) throws UnsupportedEncodingException {
		String addr = (String)hs.getAttribute("addr");
		System.out.println("searchDelete i_host : " + i_host);
		System.out.println("searchDelete addr : " + addr );
		service.delete(i_host);
		String encodedParam = URLEncoder.encode(addr, "UTF-8");
		
		
		return "redirect:/search/searchMain?addr="+encodedParam;
	}
	


}
