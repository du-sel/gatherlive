package com.seoul.gatherlive.biz.profile;

import java.sql.Timestamp;

public class MemberInstVO {

	private int member_id;
	private String inst_name;
	private String inst_level;
	private Timestamp inst_time;
	private String inst_month;
	private int inst_timeValue;
	
	
	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	public String getInst_name() {
		return inst_name;
	}
	public void setInst_name(String inst_name) {
		this.inst_name = inst_name;
	}
	public String getInst_level() {
		return inst_level;
	}
	public void setInst_level(String inst_level) {
		this.inst_level = inst_level;
	}
	public Timestamp getInst_time() {
		return inst_time;
	}
	public void setInst_time(Timestamp inst_time) {
		this.inst_time = inst_time;
	}
	public String getInst_month() {
		return inst_month;
	}
	public void setInst_month(String inst_month) {
		this.inst_month = inst_month;
	}
	public int getInst_timeValue() {
		return inst_timeValue;
	}
	public void setInst_timeValue(int inst_timeValue) {
		this.inst_timeValue = inst_timeValue;
	}


	
	
}
