package com.project.aircnc.search;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.aircnc.common.HostUserVO;

@Mapper
public interface SearchMapper {
	
	public List<HostUserVO> searchListTwo(String addr);

}
