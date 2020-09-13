package com.project.aircnc.search;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.aircnc.common.HostPicVO;
import com.project.aircnc.common.HostUserVO;
import com.project.aircnc.common.TUserVO;

@Service
public class SearchSevice {
	
	@Autowired
	private SearchMapper mapper;

	public List<HostUserVO> searchList(String addr) {
		List<HostUserVO> list = mapper.searchListTwo(addr);
		return list;
	}
	
	public HostUserVO detail(int i_host){
		HostUserVO user = mapper.detail(i_host);
		return user;
	}
	
	public TUserVO writer(int i_user){
		TUserVO host = mapper.writer(i_user);
		return host;
	}
	
	public List<HostPicVO> hostPic(int i_host) {
		List<HostPicVO> list = mapper.hostPic(i_host);
		return list;
	}
	
	public void delete(int i_host) {
		mapper.searchDelete(i_host);//집정보 지우기
		mapper.thumDelete(i_host);// 썸네일 사진 지우기
		mapper.picDelete(i_host);// 사진지우기
	}
	
	

}
