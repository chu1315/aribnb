package com.project.aircnc.common;

public class WorkplacePhVO {
	private int i_ph; // pk
	private String wp_ph; // 사업장 전화 번호
	private String gest_ok; //게스트 연락 가능 여부
	
	public int getI_ph() {
		return i_ph;
	}
	public void setI_ph(int i_ph) {
		this.i_ph = i_ph;
	}
	public String getWp_ph() {
		return wp_ph;
	}
	public void setWp_ph(String wp_ph) {
		this.wp_ph = wp_ph;
	}
	public String getGest_ok() {
		return gest_ok;
	}
	public void setGest_ok(String gest_ok) {
		this.gest_ok = gest_ok;
	}
	
	
}