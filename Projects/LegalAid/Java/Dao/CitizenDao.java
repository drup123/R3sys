package com.legalAid.Dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.legalAid.model.Citizen;
import com.legalAid.model.Lawyer;

@Component
public class CitizenDao {
	@Autowired
	HibernateTemplate hibernateTemplate;
	
	@Transactional
	public long addCitizen(Citizen citizen) {
		long i = (Long) hibernateTemplate.save(citizen);
		return i;
	}
	
	public Citizen getCitizen(long contact) {
		Citizen c = hibernateTemplate.get(Citizen.class, contact);
		return c;
	}
	
	public List<Citizen> displayAll() {
		List<Citizen> allCitizen = hibernateTemplate.loadAll(Citizen.class);
		return allCitizen;
	}
}
