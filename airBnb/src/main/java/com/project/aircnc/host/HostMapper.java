package com.project.aircnc.host;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.project.aircnc.common.HostUserVO;

@Mapper
public interface HostMapper {
	public int insHostSaveOne(HostUserVO param);
	public int getI_Host(HostUserVO param);
	public int upload(@Param("i_user")int i_user, @Param("i_host")int i_host, @Param("pic_nm")String pic_nm);
	public int thumUpload(@Param("i_user")int i_user, @Param("i_host")int i_host, @Param("pic_nm")String pic_nm);
	
}
