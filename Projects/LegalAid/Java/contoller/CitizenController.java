package com.legalAid.contoller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.legalAid.Dao.CitizenDao;
import com.legalAid.model.Citizen;

import get_foreignkey.Getset_citizen;

@Controller
public class CitizenController {
	ApplicationContext context = new ClassPathXmlApplicationContext("config.xml");
	Citizen citizen = (Citizen) context.getBean("citizen");
	CitizenDao citizenDao = (CitizenDao) context.getBean("citizenDao");
	
	@RequestMapping("/addCitizen")
	public String addCitizen() {
		return "addCitizen";
	}
	
	@RequestMapping(path="/RegisterCitizen", method=RequestMethod.POST)
	public String AddCitizen(HttpServletRequest request) {
		citizen.setContact(Long.parseLong(request.getParameter("contact")));
		citizen.setName(request.getParameter("name"));
		citizen.setEmail(request.getParameter("email"));
		citizen.setAdress(request.getParameter("address"));
		citizen.setPassword(request.getParameter("password"));
		
		long i = citizenDao.addCitizen(citizen);
		if(i>0) {
			return "loginCitizen";
		} else {
			return "addCitizen";
		}
	}
	
	
	@RequestMapping("/loginCitizen")
	public String loginCitizen() {
		return "loginCitizen";
	}
	
	@RequestMapping(path="/CitizenLogin", method = RequestMethod.POST)
	public String CitizenLogin(HttpServletRequest request) {
		long contact = Long.parseLong(request.getParameter("contact"));
		String pass = request.getParameter("password");
		Getset_citizen.setCitizenId(contact);
		Citizen c = citizenDao.getCitizen(contact);
		
		if(c != null) {
			return "citizen_dashboard";
		} else {
			return "loginCitizen";
		}
		
	}
	
	@RequestMapping("/citizen_dashboard")
	public String citizen_dashboard() {
		return "citizen_dashboard";
	}
}
