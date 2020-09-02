package com.project.aircnc.wishlists;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.aircnc.common.UserLListVO;
import com.project.aircnc.common.UserLikeVO;

@Controller
@RequestMapping(value="/wishlists")
public class WishlistsController {

	@Autowired
	private WishlistsService service;
	
	@RequestMapping(method=RequestMethod.GET)
	public String wishlists (Model model) {
		
		model.addAttribute("lists", service.selWishL());
		
		return "wish/wishlists";
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public String wishlists (Model model, UserLListVO param) {
		
		param.setI_user(1);
		//테스트용 set. 후에 삭제하기. 매퍼와 서비스는 고칠 필요 없다.
		service.insWishL(param);
		model.addAttribute("lists", service.selWishL());
		
		return "wish/wishlists";
	}
	
	@RequestMapping(value="/detail", method=RequestMethod.GET)
	public String wishdetail (UserLListVO param, Model model) {
		
		// 리스트 정보
		model.addAttribute("list", service.selLinfo(param));
		
		model.addAttribute("hinfo", service.selHInfo(service.selWishD(param)));

		return "wish/wishdetail";
	}
}
