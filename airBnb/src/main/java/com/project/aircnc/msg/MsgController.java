package com.project.aircnc.msg;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.project.aircnc.common.TUserVO;

@Controller
@RequestMapping(value="/aircnc")
public class MsgController {
	
	@Autowired
	private MsgService service;
	// get에서 데이터를 받아서 톡방 바로 만들고 msg로 location 해주면 될 듯
	@RequestMapping(value="/crtMsg", method=RequestMethod.GET)
	public String crtMsg(HttpSession hs, int i_host, String room_title,int i_user, HttpServletResponse response) {
		
		TUserVO loginUser = (TUserVO)hs.getAttribute("loginUser");
		if(loginUser == null) {
			response.setContentType("text/html; charset=UTF-8");
			 
			PrintWriter out;
			try {
				out = response.getWriter();
				
				out.println("<script>alert('로그인 후 접근해주세요.');</script>");
				 
				out.flush();
				return "/index";
			} catch (IOException e) {
				System.out.println("/crtMsg() GET방식  오류 : "+e);
			}
		}
//		System.out.println("i_user : " + i_user); // 글 쓴 사람의 user번호
//		System.out.println("room_title : " + room_title); // 방 이름
//		System.out.println("i_host : " + i_host); // 방의 pk번호 
		
		
		service.crtMsg(i_user, room_title, i_host, loginUser.getI_user());
		
		return "redirect:/aircnc/message";
	}
	
	
	@RequestMapping(value="/message", method=RequestMethod.GET)
	public String message(MsgVO param, HttpSession hs, HttpServletResponse response) {
		
		TUserVO loginUser = (TUserVO)hs.getAttribute("loginUser");
		
		if(loginUser == null) {
			response.setContentType("text/html; charset=UTF-8");
			 
			PrintWriter out;
			try {
				out = response.getWriter();
				
				out.println("<script>alert('로그인 후 접근해주세요.');</script>");
				 
				out.flush();
				return "/index";
			} catch (IOException e) {
				System.out.println("/message() GET방식  오류 : "+e);
			}
		}
		
		
		param.setI_user(loginUser.getI_user());
		
		hs.setAttribute("msgList", service.msgList(param));
		
		return "message";
	}
	
	@RequestMapping(value="/mdetail", method=RequestMethod.GET)
	public String mdetail(HttpSession hs, MsgVO param, DtlMsgVO dvo) {
		TUserVO loginUser = (TUserVO)hs.getAttribute("loginUser");
		param.getI_mlist();
		param.getI_host();
		param.getI_user();
		param.getHost_num();
		
		
		dvo.setI_host(param.getI_host());
		dvo.setI_mlist(param.getI_mlist());
		dvo.setI_user(param.getI_user());
		dvo.setHost_num(2);
		
		
		hs.setAttribute("msgDetailList", service.msgDetailList(dvo));
		hs.setAttribute("msgVo", param);
		return "mdetail";
	}
	
	
	@RequestMapping(value="/mdetail", method=RequestMethod.POST)
	public String insMsg(DtlMsgVO param, MsgVO mvo, HttpSession hs) {
		MsgVO mvo2 = (MsgVO)hs.getAttribute("msgVo");
//		UserVO loginUser = (UserVO)hs.getAttribute("loginUser");
		
		String cmt = param.getCmt();
		System.out.println("cmt : " + cmt); // 테스트용 // 잘들어감
		param.setI_host(mvo2.getI_host());
		param.setI_mlist(mvo2.getI_mlist());
		param.setI_user(mvo2.getI_user()); // loginUser에서 i_user 가져오기
//		param.setI_reser(mvo2.getI_reser());
		param.setHost_num(2);
		
		service.insMsg(param);
		
		return "redirect:/aircnc/mdetail?i_mlist="+mvo2.getI_mlist()
		+"&i_host="+mvo2.getI_host()+"&i_user="+mvo2.getI_user()
		+"&host_num="+mvo2.getHost_num();
	}
	
	@RequestMapping(value="/delMsg", method=RequestMethod.GET)
	public String delMsg(HttpSession hs, MsgVO param) {
		int i_mlist = param.getI_mlist();
		service.delMsgOne();
		service.delMsgTwo(i_mlist);
		service.delMsgThree(i_mlist);
		service.delMsgFour();
		return "redirect:/aircnc/message";
	}
	
}
