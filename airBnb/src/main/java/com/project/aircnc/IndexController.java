package com.project.aircnc;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class IndexController {
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index () {
		
		return "index";
	}
	
	@RequestMapping(value = "/aircnc", method = RequestMethod.GET)
	public String home(Model model) {
		
		return "index";
	}
	
}
