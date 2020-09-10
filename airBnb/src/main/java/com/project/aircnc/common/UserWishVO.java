package com.project.aircnc.common;

import org.apache.ibatis.type.Alias;

@Alias("UserWishVO")
public class UserWishVO {
	private int i_wish;
	private int i_host;
	private int i_user;
	public int getI_wish() {
		return i_wish;
	}
	public void setI_wish(int i_wish) {
		this.i_wish = i_wish;
	}
	public int getI_host() {
		return i_host;
	}
	public void setI_host(int i_host) {
		this.i_host = i_host;
	}
	public int getI_user() {
		return i_user;
	}
	public void setI_user(int i_user) {
		this.i_user = i_user;
	}
	
	
}
