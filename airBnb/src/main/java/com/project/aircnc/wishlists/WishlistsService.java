package com.project.aircnc.wishlists;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.aircnc.common.HostUserVO;
import com.project.aircnc.common.UserWishVO;

@Service
public class WishlistsService {
	
	@Autowired
	private WishlistsMapper mapper;
	
	public void insertWish(int i_host, int loginUseri_user) {
		UserWishVO uvo = new UserWishVO();
		uvo.setI_host(i_host);
		uvo.setI_user(loginUseri_user);
		
		mapper.insertWish(uvo);
	}
	
	public List<HostUserVO> wishList(int i_user) {
		List<HostUserVO> list = mapper.wishList(i_user);
		return list;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/*
	 * public List<UserLListVO> selWishL() { List<UserLListVO> result =
	 * mapper.selWishL();
	 * 
	 * for(UserLListVO vo : result) {
	 * vo.setCount(mapper.WishLCount(vo.getI_list())); } return result; } public
	 * UserLListVO selLinfo(UserLListVO param) { UserLListVO result =
	 * mapper.selLinfo(param);
	 * result.setCount(mapper.WishLCount(result.getI_list())); return result; }
	 * 
	 * public void insWishL(UserLListVO param) { mapper.insWishL(param); }
	 * 
	 * public List<UserLikeVO> selWishD(UserLListVO param) { List<UserLikeVO> result
	 * = mapper.selWishD(param); return result; } public List<WishlistsVO>
	 * selHInfo(List<UserLikeVO> param) { List<WishlistsVO> result = new
	 * ArrayList<WishlistsVO>();
	 * 
	 * for(UserLikeVO vo : param) { WishlistsVO temp = new WishlistsVO();
	 * 
	 * HostUserVO hinfo = mapper.selHostInfo(vo);
	 * 
	 * temp.setB_room(hinfo.getB_room()); temp.setBed_qty(hinfo.getBed_qty());
	 * temp.setRoom_title(hinfo.getRoom_title());
	 * 
	 * result.add(temp); } return result; }
	 * 
	 * public void insLfromS (UserLListVO param) { mapper.insLfromS(param); }
	 * 
	 * public void insHost (UserLikeVO param) { mapper.insHost(param); }
	 */
	
	

}
