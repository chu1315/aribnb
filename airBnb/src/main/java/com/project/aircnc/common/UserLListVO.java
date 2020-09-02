package com.project.aircnc.common;

import org.apache.ibatis.type.Alias;

@Alias("UserLListVO")
public class UserLListVO {
	private int i_list;
	private int i_user;
	private String check_in;
	private String check_out;
	private String search_nm;
	private String r_dt;
	private int gest_qty;
	private int count;


	public int getGest_qty() {
		return gest_qty;
	}
	public void setGest_qty(int gest_qty) {
		this.gest_qty = gest_qty;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getI_list() {
		return i_list;
	}
	public void setI_list(int i_list) {
		this.i_list = i_list;
	}
	public int getI_user() {
		return i_user;
	}
	public void setI_user(int i_user) {
		this.i_user = i_user;
	}
	public String getCheck_in() {
		return check_in;
	}
	public void setCheck_in(String check_in) {
		this.check_in = check_in;
	}
	public String getCheck_out() {
		return check_out;
	}
	public void setCheck_out(String check_out) {
		this.check_out = check_out;
	}
	public String getSearch_nm() {
		return search_nm;
	}
	public void setSearch_nm(String search_nm) {
		this.search_nm = search_nm;
	}
	public String getR_dt() {
		return r_dt;
	}
	public void setR_dt(String r_dt) {
		this.r_dt = r_dt;
	}
	
	

}
