package com.project.aircnc.common;

import org.apache.ibatis.type.Alias;

@Alias("HostPicVO")
public class HostPicVO {
	private int i_user;
	private int i_host;
	private String pic_nm;
	
	public int getI_user() {
		return i_user;
	}
	public void setI_user(int i_user) {
		this.i_user = i_user;
	}
	public int getI_host() {
		return i_host;
	}
	public void setI_host(int i_host) {
		this.i_host = i_host;
	}
	public String getPic_nm() {
		return pic_nm;
	}
	public void setPic_nm(String pic_nm) {
		this.pic_nm = pic_nm;
	}
	
	
}
