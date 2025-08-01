package com.legalAid.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;
@Entity
@Table
@Component
public class Citizen {
	@Id
	long contact;
	@Override
	public String toString() {
		return "Citizen [contact=" + contact + ", name=" + name + ", adress=" + adress + ", email=" + email
				+ ", password=" + password + "]";
	}
	public Citizen() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Citizen(long contact, String name, String adress, String email, String password) {
		super();
		this.contact = contact;
		this.name = name;
		this.adress = adress;
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
	public String getAdress() {
		return adress;
	}
	public void setAdress(String adress) {
		this.adress = adress;
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
	String adress;
	String email;
	String password;
}
