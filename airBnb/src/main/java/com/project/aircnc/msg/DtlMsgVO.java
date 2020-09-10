package com.project.aircnc.msg;
// 톡방 디테일 리스트 
public class DtlMsgVO {
	private int i_mlist;
	private int host_num;
	private int i_msg;
	private int i_host;
	private int i_user;
	private String cmt;
	private String r_dt;
	private String m_dt;
	private String state;
	
	
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
	public int getI_msg() {
		return i_msg;
	}
	public void setI_msg(int i_msg) {
		this.i_msg = i_msg;
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
	public String getCmt() {
		return cmt;
	}
	public void setCmt(String cmt) {
		this.cmt = cmt;
	}
	public String getR_dt() {
		return r_dt;
	}
	public void setR_dt(String r_dt) {
		this.r_dt = r_dt;
	}
	public String getM_dt() {
		return m_dt;
	}
	public void setM_dt(String m_dt) {
		this.m_dt = m_dt;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
	
}
