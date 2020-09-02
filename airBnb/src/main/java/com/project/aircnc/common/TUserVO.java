package com.project.aircnc.common;

import org.apache.ibatis.type.Alias;

@Alias("TUserVO")
public class TUserVO {
	private int i_user;
	private String e_mail;
	private String nm;
	private String c_pw;
	private String bir_day;
	private String r_dt;
	public int getI_user() {
		return i_user;
	}
	public void setI_user(int i_user) {
		this.i_user = i_user;
	}
	public String getE_mail() {
		return e_mail;
	}
	public void setE_mail(String e_mail) {
		this.e_mail = e_mail;
	}
	public String getNm() {
		return nm;
	}
	public void setNm(String nm) {
		this.nm = nm;
	}
	public String getC_pw() {
		return c_pw;
	}
	public void setC_pw(String c_pw) {
		this.c_pw = c_pw;
	}
	public String getBir_day() {
		return bir_day;
	}
	public void setBir_day(String bir_day) {
		this.bir_day = bir_day;
	}
	public String getR_dt() {
		return r_dt;
	}
	public void setR_dt(String r_dt) {
		this.r_dt = r_dt;
	}
	
	


}
