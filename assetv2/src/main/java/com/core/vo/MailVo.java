package com.core.vo;

import java.util.Arrays;
import java.util.List;

import com.calendar.vo.CalendarVo;

public class MailVo {

	private List<CalendarVo> list;
	private String[] cc;
	private String[] to;
	private String content;
	private String type;
	private String subject;
	private String entry_date;
	private String entry_time;
	
	public List<CalendarVo> getList() {
		return list;
	}
	public void setList(List<CalendarVo> list) {
		this.list = list;
	}
	public String[] getCc() {
		return cc;
	}
	public void setCc(String[] cc) {
		this.cc = cc;
	}
	public String[] getTo() {
		return to;
	}
	public void setTo(String[] to) {
		this.to = to;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getEntry_date() {
		return entry_date;
	}
	public void setEntry_date(String entry_date) {
		this.entry_date = entry_date;
	}
	public String getEntry_time() {
		return entry_time;
	}
	public void setEntry_time(String entry_time) {
		this.entry_time = entry_time;
	}
	@Override
	public String toString() {
		return "MailVo [list=" + list + ", cc=" + Arrays.toString(cc) + ", to=" + Arrays.toString(to) + ", content="
				+ content + ", type=" + type + ", subject=" + subject + ", entry_date=" + entry_date + ", entry_time="
				+ entry_time + "]";
	}
	
	
	
	
	
}
