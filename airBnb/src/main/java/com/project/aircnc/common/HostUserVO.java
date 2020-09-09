package com.project.aircnc.common;

import org.apache.ibatis.type.Alias;

@Alias("HostUserVO")
public class HostUserVO {
	private String pic_nm; // 이미지 불러오려고 임의로 만듦
	private int i_host;
	private int i_user;
	private String addr;
	private String addrDetail;
	private int r_vastion;
	private int b_room;
	private int bed_qty;
	private String bth_room;
	private String room_title;
	private String acc;
	private String acc_bank;
	private String acc_owner;
	private String r_dt;
	
	
	public String getPic_nm() {
		return pic_nm;
	}
	public void setPic_nm(String pic_nm) {
		this.pic_nm = pic_nm;
	}
	public String getAddrDetail() {
		return addrDetail;
	}
	public void setAddrDetail(String addDetail) {
		this.addrDetail = addDetail;
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
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public int getR_vastion() {
		return r_vastion;
	}
	public void setR_vastion(int r_vastion) {
		this.r_vastion = r_vastion;
	}
	public int getB_room() {
		return b_room;
	}
	public void setB_room(int b_room) {
		this.b_room = b_room;
	}
	public int getBed_qty() {
		return bed_qty;
	}
	public void setBed_qty(int bed_qty) {
		this.bed_qty = bed_qty;
	}
	public String getBth_room() {
		return bth_room;
	}
	public void setBth_room(String bth_room) {
		this.bth_room = bth_room;
	}
	public String getRoom_title() {
		return room_title;
	}
	public void setRoom_title(String room_title) {
		this.room_title = room_title;
	}
	public String getAcc() {
		return acc;
	}
	public void setAcc(String acc) {
		this.acc = acc;
	}
	public String getAcc_bank() {
		return acc_bank;
	}
	public void setAcc_bank(String acc_bank) {
		this.acc_bank = acc_bank;
	}
	public String getAcc_owner() {
		return acc_owner;
	}
	public void setAcc_owner(String acc_owner) {
		this.acc_owner = acc_owner;
	}
	public String getR_dt() {
		return r_dt;
	}
	public void setR_dt(String r_dt) {
		this.r_dt = r_dt;
	}
	

	
	
}
