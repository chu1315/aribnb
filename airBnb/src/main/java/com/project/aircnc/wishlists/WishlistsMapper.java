package com.project.aircnc.wishlists;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.aircnc.common.HostReviewVO;
import com.project.aircnc.common.HostUserVO;
import com.project.aircnc.common.RoomFeeVO;
import com.project.aircnc.common.UserLListVO;
import com.project.aircnc.common.UserLikeVO;

@Mapper
public interface WishlistsMapper {
	public List<UserLListVO> selWishL();
	public UserLListVO selLinfo(UserLListVO param);
	public int WishLCount(int i_list);
	public void insWishL (UserLListVO param);
	
	public List<UserLikeVO> selWishD (UserLListVO param);
	public HostUserVO selHostInfo(UserLikeVO param);
	public RoomFeeVO selHostFee (UserLikeVO param);
	public HostReviewVO selHostEval (UserLikeVO param);

	public void insHost(UserLikeVO param);
	public void insLfromS(UserLListVO param);
}
