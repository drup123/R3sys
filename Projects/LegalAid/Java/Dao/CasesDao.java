package com.legalAid.Dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.legalAid.model.Cases;
import com.legalAid.model.Citizen;

@Component
public class CasesDao {
	@Autowired
    HibernateTemplate hibernateTemplate;
	
	
	@Transactional
	public int addCase(Cases cases) {
		int i = (Integer) hibernateTemplate.save(cases);
		return i;
	}
	
	public List<Cases> displayAll() {
		List<Cases> allCases = hibernateTemplate.loadAll(Cases.class);
		return allCases;
	}
}
