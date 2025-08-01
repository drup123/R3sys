package com.legalAid.Dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.legalAid.model.Appointment;
import com.legalAid.model.Citizen;

@Component
public class AppointmentDao {
	@Autowired
	HibernateTemplate hibernateTemplate;
	
	@Transactional
	public int addAppointment(Appointment appointment) {
		int i = (Integer) hibernateTemplate.save(appointment);
		return i;
	}
	
	public List<Appointment> displayAll() {
		List<Appointment> allAppointment = hibernateTemplate.loadAll(Appointment.class);
		return allAppointment;
	}
}
