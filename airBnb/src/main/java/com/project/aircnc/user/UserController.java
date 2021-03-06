package com.project.aircnc.user;

import java.io.IOException;
import java.io.PrintWriter;
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
public class UserController {
	@Autowired
	private UserService service;
	
	@RequestMapping(value="/login", method= RequestMethod.POST)
	public String login (Model model, TUserVO param ,HttpSession hs, HttpServletResponse response) {
		int result = service.login(param,hs);
		
		if (result == 1) {
			return "redirect:/aircnc";
		} else {
			response.setContentType("text/html; charset=UTF-8");
			 
			PrintWriter out;
			try {
				out = response.getWriter();

				out.println("<script>alert('아이디 혹은 비밀번호를 확인해주세요.');</script>");
				 
				out.flush();
				return "/index";
			} catch (IOException e) {
				System.out.println("/login() 오류 : "+e);
			}
			 

			return "redirect:/aircnc";
		}
		
	}
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public void join (Model model, TUserVO param) {
		service.join(param);
	}
	
	@ResponseBody
	@RequestMapping(value="/checkE_mail", method=RequestMethod.GET)
	public Map<String, Object> chkeckE_mail(@RequestParam("e_mail")String e_mail, Model model){
		System.out.println("email : " + e_mail); // 여긴 들어온다.
		Map<String, Object> map = new HashMap();
		int result = service.chkE_mail(e_mail);
		map.put("result", result);
		System.out.println("result:"+result); // 확인용
		System.out.println("돌아옴");
		
		
		return map;
		 
	 }
	
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpSession hs) {
		hs.invalidate();
		return "redirect:/aircnc";
	}
	
	
}
