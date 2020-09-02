package com.project.aircnc.user;

import java.util.HashMap;
import java.util.Map;

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
public class UserController {
	@Autowired
	private UserService service;
	
	@RequestMapping(value="/login", method= RequestMethod.POST)
	public String login (Model model, TUserVO param ,HttpSession hs) {
		int result = service.login(param,hs);
		
		if (result ==1) {
			return "redirect:/aircnc";
		} else {
			model.addAttribute("msg", "아이디 혹은 비밀번호를 확인해주세요.");
			return "redirect:/aircnc";
		}
		
	}
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String join (Model model, TUserVO param) {
		int result= 0;
		result = service.join(param);
		
		if (result==1) {
			return "redirect:/aircnc";
		} else {
			model.addAttribute("msg", "회원가입 실패");
			return "redirect:/aircnc";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/checkE_mail", method=RequestMethod.GET)
	public Map<String, Object> chkeckE_mail(@RequestParam("e_mail")String e_mail, Model model){
		System.out.println("email : " + e_mail); // 여긴 들어온다.
		Map<String, Object> map = new HashMap();
		map.put("result", service.chkE_mail(e_mail));
		int result = service.chkE_mail(e_mail);
		System.out.println("result:"+result);
		System.out.println("돌아옴");
		
		
		return map;
		 
	 }
	
	
}
