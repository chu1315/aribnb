package com.project.aircnc.wishlists;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.aircnc.common.HostReviewVO;
import com.project.aircnc.common.HostUserVO;
import com.project.aircnc.common.RoomFeeVO;
import com.project.aircnc.common.UserLListVO;
import com.project.aircnc.common.UserLikeVO;
import com.project.aircnc.common.WishlistsVO;

@Service
public class WishlistsService {
	
	@Autowired
	private WishlistsMapper mapper;
	
	public List<UserLListVO> selWishL() {
		List<UserLListVO> result = mapper.selWishL();
		
		for(UserLListVO vo : result) {
			vo.setCount(mapper.WishLCount(vo.getI_list()));
		}
		return result;
	}
	public UserLListVO selLinfo(UserLListVO param) {
		UserLListVO result = mapper.selLinfo(param);
		result.setCount(mapper.WishLCount(result.getI_list()));
		return result;
	}
	
	public void insWishL(UserLListVO param) {
		mapper.insWishL(param);
	}
	
	public List<UserLikeVO> selWishD(UserLListVO param) {
		List<UserLikeVO> result = mapper.selWishD(param);
		return result;
	}
	public List<WishlistsVO> selHInfo(List<UserLikeVO> param) {
		List<WishlistsVO> result = new ArrayList<WishlistsVO>();
		
		for(UserLikeVO vo : param) {
			WishlistsVO temp = new WishlistsVO();
			
			HostUserVO hinfo = mapper.selHostInfo(vo);
			RoomFeeVO hfee = mapper.selHostFee(vo);
			HostReviewVO heval = mapper.selHostEval(vo);
			
			temp.setB_room(hinfo.getB_room());
			temp.setBed_qty(hinfo.getBed_qty());
			temp.setRoom_title(hinfo.getRoom_title());
			temp.setFee(hfee.getFee());
			temp.setCount(heval.getCount());
			temp.setAvg(heval.getAvg());
			
			result.add(temp);
		}	
		return result;
	}
	
	public void insLfromS (UserLListVO param) {
		mapper.insLfromS(param);
	}
	
	public void insHost (UserLikeVO param) {
		mapper.insHost(param);
	} 

}
