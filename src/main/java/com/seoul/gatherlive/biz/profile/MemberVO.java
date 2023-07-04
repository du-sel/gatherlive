package com.seoul.gatherlive.biz.profile;

import java.sql.Timestamp;

public class MemberVO {
	
	private int member_id;
	private String mail;
	private String password;
	private String user_name;
	private String cell;
	private String gender;
	private String birth;
	private int open;
	private String pref_genre;
	private String pref_musician;
	private String pref_music;
	private String pref_day;
	private String pref_time;
	private String hope;
	private String introduce;
	private Timestamp join_date;
	
	
	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getCell() {
		return cell;
	}
	public void setCell(String cell) {
		this.cell = cell;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public int getOpen() {
		return open;
	}
	public void setOpen(int open) {
		this.open = open;
	}
	public String getPref_genre() {
		return pref_genre;
	}
	public void setPref_genre(String pref_genre) {
		this.pref_genre = pref_genre;
	}
	public String getPref_musician() {
		return pref_musician;
	}
	public void setPref_musician(String pref_musician) {
		this.pref_musician = pref_musician;
	}
	public String getPref_music() {
		return pref_music;
	}
	public void setPref_music(String pref_music) {
		this.pref_music = pref_music;
	}
	public String getPref_day() {
		return pref_day;
	}
	public void setPref_day(String pref_day) {
		this.pref_day = pref_day;
	}
	public String getPref_time() {
		return pref_time;
	}
	public void setPref_time(String pref_time) {
		this.pref_time = pref_time;
	}
	public String getHope() {
		return hope;
	}
	public void setHope(String hope) {
		this.hope = hope;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public Timestamp getJoin_date() {
		return join_date;
	}
	public void setJoin_date(Timestamp join_date) {
		this.join_date = join_date;
	}
	

}
