package com.project.aircnc.wishlists;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.aircnc.common.HostUserVO;
import com.project.aircnc.common.TUserVO;
import com.project.aircnc.common.UserWishVO;

@Controller
public class WishlistsController {

	@Autowired
	private WishlistsService service;
	
	@RequestMapping(value="/wish", method=RequestMethod.GET)
	public String wishList(HttpSession hs, HttpServletResponse response) {
		TUserVO loginUser = (TUserVO)hs.getAttribute("loginUser");
		if(loginUser == null) {
			response.setContentType("text/html; charset=UTF-8");
			 
			PrintWriter out;
			try {
				out = response.getWriter();
				
				out.println("<script>alert('로그인 후 이용하실 수 있습니다.');</script>");
				 
				out.flush();
				return "/index";
			} catch (IOException e) {
				System.out.println("/hostSave() GET방식  오류 : "+e);
			}
		}
		hs.setAttribute("data", service.wishList(loginUser.getI_user()));
		
		
		return "search/searchMain";
	}
	
	@RequestMapping(value="/wish", method=RequestMethod.POST)
	public String wish(HttpSession hs, HttpServletResponse response) {
		TUserVO loginUser = (TUserVO)hs.getAttribute("loginUser");
		
		if(loginUser == null) { // 로그인 안되어있을 경우
			response.setContentType("text/html; charset=UTF-8");
			
			PrintWriter out;
			try {
				out = response.getWriter();
				
				out.println("<script>alert('로그인 후 이용하실 수 있습니다.');</script>");
				
				out.flush();
				return "/index";
			} catch (IOException e) {
				System.out.println("wish POST방식  오류 : "+e);
			}
		}
		int i_host = (Integer) hs.getAttribute("i_host");
		HostUserVO tvo = (HostUserVO)hs.getAttribute("detailData");
//		System.out.println("wish i_host : " + i_host); // 이동, wishVO에 넣기 위함
//		System.out.println("wish i_user : " + tvo.getI_user()); // 이동하기위해 필요한 거
		
		
		service.insertWish(i_host, loginUser.getI_user());
		
		return "redirect:/search/searchDetail?i_host="+i_host+"&i_user="+tvo.getI_user();
	}
	
	
	
	
	
	/*
	 * 
	 * 
	 * @RequestMapping(method=RequestMethod.GET) public String wishlists (Model
	 * model) {
	 * 
	 * model.addAttribute("lists", service.selWishL());
	 * 
	 * return "wish/wishlists"; }
	 * 
	 * @RequestMapping(method=RequestMethod.POST) public String wishlists (Model
	 * model, UserLListVO param) {
	 * 
	 * param.setI_user(1); //테스트용 set. 후에 삭제하기. 매퍼와 서비스는 고칠 필요 없다.
	 * service.insWishL(param); model.addAttribute("lists", service.selWishL());
	 * 
	 * return "wish/wishlists"; }
	 * 
	 * @RequestMapping(value="/detail", method=RequestMethod.GET) public String
	 * wishdetail (UserLListVO param, Model model) {
	 * 
	 * // 리스트 정보 model.addAttribute("list", service.selLinfo(param));
	 * 
	 * model.addAttribute("hinfo", service.selHInfo(service.selWishD(param)));
	 * 
	 * return "wish/wishdetail"; }
	 */
}
