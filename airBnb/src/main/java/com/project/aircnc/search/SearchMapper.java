package com.project.aircnc.search;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.project.aircnc.common.AddSchVO;
import com.project.aircnc.common.HostListVO;
import com.project.aircnc.common.RoomIMGVO;
import com.project.aircnc.common.SearchVO;

@Mapper
public interface SearchMapper {
	
	public List<AddSchVO> searchList(String s_addr);
	public List<HostListVO> hostList(SearchVO param);
	public List<RoomIMGVO> room_img_list(HostListVO param);
	public SearchVO avgFee(SearchVO param);

}
