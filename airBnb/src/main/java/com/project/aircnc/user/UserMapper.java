package com.project.aircnc.user;

import org.apache.ibatis.annotations.Mapper;

import com.project.aircnc.common.TUserVO;

@Mapper
public interface UserMapper {
	public int join (TUserVO param);
	
	public TUserVO login (TUserVO param);
	
	public int chkE_mail(String e_mail);
}
