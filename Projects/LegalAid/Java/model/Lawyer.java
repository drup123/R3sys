package com.legalAid.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table
@Component
public class Lawyer {
	
	@Id
	long contact;
	@Override
	public String toString() {
		return "Lawyer [contact=" + contact + ", name=" + name + ", specialization=" + specialization + ", email="
				+ email + ", password=" + password + "]";
	}
	public Lawyer() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Lawyer(long contact, String name, String specialization, String email, String password) {
		super();
		this.contact = contact;
		this.name = name;
		this.specialization = specialization;
		this.email = email;
		this.password = password;
	}
	public long getContact() {
		return contact;
	}
	public void setContact(long contact) {
		this.contact = contact;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSpecialization() {
		return specialization;
	}
	public void setSpecialization(String specialization) {
		this.specialization = specialization;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	String name;
	String specialization;
	String email;
	String password;
}
