package com.legalAid.Dao;

import java.util.List;


import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.legalAid.model.Citizen;
import com.legalAid.model.Lawyer;

@Component
public class LawyerDao {
	
	@Autowired
	HibernateTemplate hibernateTemplate;
	
	@Transactional
	public long addLawyer(Lawyer lawyer) {
		long i = (Long) hibernateTemplate.save(lawyer);
		return i;
	}
	
	public List<Lawyer> displayAll() {
		List<Lawyer> allLawyer = hibernateTemplate.loadAll(Lawyer.class);
		return allLawyer;
	}
	
	
	public Lawyer getLawyer(long contact) {
		Lawyer c = hibernateTemplate.get(Lawyer.class, contact);
		return c;
	}
	
	
	
	@Transactional
	public void deleteLawyer(long id) {
		Lawyer lawyers = hibernateTemplate.get(Lawyer.class, id);
		hibernateTemplate.delete(lawyers);
	}
}
