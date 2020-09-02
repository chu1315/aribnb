package com.project.aircnc.search.detail;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value = "/search")
public class DetatilController {
	
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String goAddr(@RequestParam int i_host) {// @ResponseBody 모든 객체 데이터
		
		return "/search/detail";
	}
}
