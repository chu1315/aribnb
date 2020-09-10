package com.project.aircnc.wishlists;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.aircnc.common.HostUserVO;
import com.project.aircnc.common.UserWishVO;

@Mapper
public interface WishlistsMapper {
	public void insertWish(UserWishVO uvo);
	public List<HostUserVO> wishList(int i_user);
	
	
	
	
	
	
	
	
	
	
	
	
	/*
	 * public List<UserLListVO> selWishL(); public UserLListVO selLinfo(UserLListVO
	 * param); public int WishLCount(int i_list); public void insWishL (UserLListVO
	 * param);
	 * 
	 * public List<UserLikeVO> selWishD (UserLListVO param); public HostUserVO
	 * selHostInfo(UserLikeVO param);
	 * 
	 * public void insHost(UserLikeVO param); public void insLfromS(UserLListVO
	 * param);
	 */
}
