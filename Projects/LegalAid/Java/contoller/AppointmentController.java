package com.legalAid.contoller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.legalAid.Dao.AppointmentDao;
import com.legalAid.model.Appointment;
import com.legalAid.model.Cases;

import get_foreignkey.GetSet_lawyerId;

@Controller
public class AppointmentController {
	
	ApplicationContext context = new ClassPathXmlApplicationContext("config.xml");
	Appointment appointment = (Appointment) context.getBean("appointment");
	AppointmentDao appointmentDao = (AppointmentDao) context.getBean("appointmentDao");
	
	@RequestMapping("/addAppointment")
	public String addAppointment() {
		return "addAppointment";
	}
	
	@RequestMapping(path="/AddAppointment", method=RequestMethod.POST)
	public String AddAppointment(HttpServletRequest request) {
		int id=0;
		long contact  = GetSet_lawyerId.getLawyerid();
		appointment.setId(id);
		appointment.setCaseId(Integer.parseInt(request.getParameter("caseId")));
		appointment.setDate(request.getParameter("appointmentDate"));
		appointment.setTime(request.getParameter("appointmentTime"));
		appointment.setLawyerContactId(contact);
		
		int i = appointmentDao.addAppointment(appointment);
		if(i>0) {
			return "redirect:/lawyer_dashboard";
		} else {
			return "redirect:/lawyer_dashboard";
		}
	}
	
	
	
	
	@RequestMapping("/viewAppointment")
	public String lawyer_dashboard(Model m) {
		List<Appointment> allAppointment = appointmentDao.displayAll();
		m.addAttribute("allAppointment", allAppointment);
		return "viewAppointment";
	}
}
