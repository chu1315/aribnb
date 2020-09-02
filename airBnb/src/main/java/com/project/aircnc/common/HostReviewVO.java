package com.project.aircnc.common;

import org.apache.ibatis.type.Alias;

@Alias("HostReviewVO")
public class HostReviewVO {
	
	private int i_contents;
	private int i_host;
	private int i_user;
	private int contents;
	private String r_dt;
	private String m_dt;
	private float evaluate_val;
	
	private int count;
	private float avg;
	
	
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public float getAvg() {
		return avg;
	}
	public void setAvg(float avg) {
		this.avg = avg;
	}
	public int getI_contents() {
		return i_contents;
	}
	public void setI_contents(int i_contents) {
		this.i_contents = i_contents;
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
	public int getContents() {
		return contents;
	}
	public void setContents(int contents) {
		this.contents = contents;
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
	public float getEvaluate_val() {
		return evaluate_val;
	}
	public void setEvaluate_val(float evaluate_val) {
		this.evaluate_val = evaluate_val;
	}
	

}
