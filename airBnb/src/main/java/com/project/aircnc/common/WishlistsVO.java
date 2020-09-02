package com.project.aircnc.common;

public class WishlistsVO {
	private int b_room;
	private int bed_qty;
	private String room_title;
	private int fee;
	private int count;
	private float avg;
	
	
	
	
	public int getBed_qty() {
		return bed_qty;
	}
	public void setBed_qty(int bed_qty) {
		this.bed_qty = bed_qty;
	}
	public float getAvg() {
		return avg;
	}
	public void setAvg(float avg) {
		this.avg = avg;
	}
	public int getB_room() {
		return b_room;
	}
	public void setB_room(int b_room) {
		this.b_room = b_room;
	}
	public String getRoom_title() {
		return room_title;
	}
	public void setRoom_title(String room_title) {
		this.room_title = room_title;
	}
	public int getFee() {
		return fee;
	}
	public void setFee(int fee) {
		this.fee = fee;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
	
}
