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
public class Cases {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	int id;
	long citizenContactId;
	String caseType;
	@Override
	public String toString() {
		return "Cases [id=" + id + ", citizenContactId=" + citizenContactId + ", caseType=" + caseType
				+ ", description=" + description + ", date=" + date + ", status=" + status + "]";
	}
	public Cases() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Cases(int id, long citizenContactId, String caseType, String description, String date, String status) {
		super();
		this.id = id;
		this.citizenContactId = citizenContactId;
		this.caseType = caseType;
		this.description = description;
		this.date = date;
		this.status = status;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public long getCitizenContactId() {
		return citizenContactId;
	}
	public void setCitizenContactId(long citizenContactId) {
		this.citizenContactId = citizenContactId;
	}
	public String getCaseType() {
		return caseType;
	}
	public void setCaseType(String caseType) {
		this.caseType = caseType;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	String description;
	String date;
	String status;
}
