package com.project.aircnc.msg;
// 톡방 리스트 테이블 VO
public class MsgVO {
	private int i_mlist;
	private int host_num;
	private int i_host;
	private int i_user;
	private String ms_title;
	private String r_dt;
	
	
	public int getHost_num() {
		return host_num;
	}
	public void setHost_num(int host_num) {
		this.host_num = host_num;
	}
	public int getI_mlist() {
		return i_mlist;
	}
	public void setI_mlist(int i_mlist) {
		this.i_mlist = i_mlist;
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
	public String getMs_title() {
		return ms_title;
	}
	public void setMs_title(String ms_title) {
		this.ms_title = ms_title;
	}
	public String getR_dt() {
		return r_dt;
	}
	public void setR_dt(String r_dt) {
		this.r_dt = r_dt;
	}
	
	
	
}
