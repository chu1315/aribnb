package com.project.aircnc.msg;

import java.util.List;

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
	
	@RequestMapping(value="/crtMsg", method=RequestMethod.GET)
	public String crtMsg(HttpSession hs) {
		
		TUserVO uservo = new TUserVO(); 
		uservo.setI_user(1);
		uservo.setNm("현욱간지");
		uservo.setE_mail("111");
		hs.setAttribute("loginUser",uservo);
		
		return "msgcreate";
	}
	
	@RequestMapping(value="/crtMsg", method=RequestMethod.POST)
	public String crtMsg(MsgVO param) {
//		System.out.println(param.getHost_num());
//		System.out.println(param.getI_reser());
//		System.out.println(param.getI_host());
//		System.out.println(param.getI_user());
//		System.out.println(param.getMs_title());
		
		service.crtMsg(param);
		
		return "redirect:/aircnc/message";
	}
	
	@RequestMapping(value="/message", method=RequestMethod.GET)
	public String message(MsgVO param, HttpSession hs) {
//		세션에서 꺼내와서 밑에 i_user 세팅
		
		
		//현욱이가 바꿔야할 ID값 // 지우기
		TUserVO uservo = new TUserVO(); 
		uservo.setI_user(2);
		uservo.setNm("현욱간지");
		uservo.setE_mail("111");
		hs.setAttribute("loginUser",uservo);
		
		
		param.setI_user(2); // 임시용(hs에 들어가있는 로그인유저의 i_user를 받아넣을것이다)
		
		hs.setAttribute("msgList", service.msgList(param));
		
		return "message";
	}
	
	@RequestMapping(value="/mdetail", method=RequestMethod.GET)
	public String mdetail(HttpSession hs, MsgVO param, DtlMsgVO dvo) {
		dvo.setI_reser(param.getI_reser());
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
		param.setI_reser(mvo2.getI_reser());
		param.setHost_num(2);
		
		service.insMsg(param);
		return "redirect:/aircnc/mdetail?i_mlist="+mvo2.getI_mlist()
		+"&i_host="+mvo2.getI_host()+"&i_user="+mvo2.getI_user()
		+"&host_num="+mvo2.getHost_num()+"&i_reser="+mvo2.getI_reser();
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
