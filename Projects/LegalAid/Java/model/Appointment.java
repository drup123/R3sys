package com.legalAid.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;
@Entity
@Table
@Component
public class Appointment {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	int id;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getCaseId() {
		return caseId;
	}
	public void setCaseId(int caseId) {
		this.caseId = caseId;
	}
	@Override
	public String toString() {
		return "Appointment [id=" + id + ", caseId=" + caseId + ", lawyerContactId=" + lawyerContactId + ", date="
				+ date + ", time=" + time + "]";
	}
	public Appointment() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Appointment(int id, int caseId, long lawyerContactId, String date, String time) {
		super();
		this.id = id;
		this.caseId = caseId;
		this.lawyerContactId = lawyerContactId;
		this.date = date;
		this.time = time;
	}
	public long getLawyerContactId() {
		return lawyerContactId;
	}
	public void setLawyerContactId(long lawyerContactId) {
		this.lawyerContactId = lawyerContactId;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	int caseId;
	long lawyerContactId;
	String date;
	String time;
}
