package com.project.aircnc.search;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.aircnc.common.HostPicVO;
import com.project.aircnc.common.HostUserVO;
import com.project.aircnc.common.TUserVO;

@Mapper
public interface SearchMapper {
	
	public List<HostUserVO> searchListTwo(String addr);
	public HostUserVO detail(int i_host);
	public TUserVO writer(int i_user);
	public List<HostPicVO> hostPic(int i_host);
}
