package com.project.aircnc.host;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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
	public String hosting (HttpSession hs, Model model, HttpServletResponse response) {
		
		// 로그인유저 null인 경우
		TUserVO loginUser = (TUserVO)hs.getAttribute("loginUser");
		if(loginUser == null) {
			response.setContentType("text/html; charset=UTF-8");
			 
			PrintWriter out;
			try {
				out = response.getWriter();
				
				out.println("<script>alert('세션이 만료되었습니다 다시 로그인해주세요');</script>");
				 
				out.flush();
				return "/index";
			} catch (IOException e) {
				System.out.println("/hostSave() GET방식  오류 : "+e);
			}
		}
		return "/host/hostSave";
	}
	// 숙소등록페이지에서 완료 누르면 포스트로 와서 DB등록하고 사진등록 페이지로 넘어간다.
	@RequestMapping(value = "/hostSave", method = RequestMethod.POST)
	public String saveOne (HostUserVO param,HttpSession hs, Model model, HttpServletResponse response) {
		TUserVO loginUser = (TUserVO)hs.getAttribute("loginUser");
		if(loginUser == null) {
			response.setContentType("text/html; charset=UTF-8");
			 
			PrintWriter out;
			try {
				out = response.getWriter();
				
				out.println("<script>alert('세션이 만료되었습니다 다시 로그인해주세요');</script>");
				 
				out.flush();
				return "/index";
			} catch (IOException e) {
				System.out.println("/hostSave() POST방식  오류 : "+e);
			}
		}
		int result = service.insHostSaveOne(param);
		
		System.out.println("i_host : " + service.getI_Host(param));
		hs.setAttribute("i_host",service.getI_Host(param));
		
		return "redirect:/host/hostSaveTwo";
	}
	
	@RequestMapping(value = "/hostSaveTwo", method = RequestMethod.GET)
	public String hostSaveTwo(HttpServletResponse response, HttpSession hs) {
		TUserVO loginUser = (TUserVO)hs.getAttribute("loginUser");
		if(loginUser == null) {
			response.setContentType("text/html; charset=UTF-8");
			 
			PrintWriter out;
			try {
				out = response.getWriter();
				
				out.println("<script>alert('세션이 만료되었습니다 다시 로그인해주세요');</script>");
				 
				out.flush();
				return "/index";
			} catch (IOException e) {
				System.out.println("/hostSave() POST방식  오류 : "+e);
			}
		}
		
		return "/host/hostSaveTwo";
	}
	
	
	
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public String profile(@RequestParam("file") MultipartFile file, HttpSession hs, Model model) {
		System.out.println("/upload 들어옴");
		System.out.println(file.getOriginalFilename());
		int i_host = (Integer) hs.getAttribute("i_host");
		System.out.println("upload i_host : " + i_host);
		
		if(!file.isEmpty()) {
			service.upload(file, hs, i_host);
			
			return "/index";
		}
		
		return "/index";
	}
	
}
