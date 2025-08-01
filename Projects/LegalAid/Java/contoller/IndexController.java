package com.legalAid.contoller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.legalAid.Dao.CitizenDao;
import com.legalAid.Dao.LawyerDao;
import com.legalAid.model.Citizen;
import com.legalAid.model.Lawyer;

@Controller
public class IndexController {
	
	ApplicationContext context = new ClassPathXmlApplicationContext("config.xml");
	Lawyer lawyer = (Lawyer) context.getBean("lawyer");
	LawyerDao lawyerDao = (LawyerDao) context.getBean("lawyerDao");
	Citizen citizen = (Citizen) context.getBean("citizen");
	CitizenDao citizenDao = (CitizenDao) context.getBean("citizenDao");
	
	@RequestMapping("/")
	public String login() {
		return "index";
	}
	
	@RequestMapping("/adminLogin")
	public String AdminLogin() {
		return "adminLogin";
	}
	
	@RequestMapping("/index")
	public String index() {
		return "index";
	}
	
	@RequestMapping("/admin_dashboard")
	public String dashboard() {
		return "admin_dashboard";
	}
	
	@RequestMapping(path = "/adminLogin", method = RequestMethod.POST)
	public String adminLogin(HttpServletRequest request) {
		String email = request.getParameter("email");
		String pass = request.getParameter("password");
		
		if(email.equals("Drup@mail.com") && pass.equals("D123")) {
			return "admin_dashboard";
		} else {
			return "adminLogin";
		}
	}
	
	@RequestMapping(path = "/RegisterLawyerServlet", method = RequestMethod.POST)
	public String AddLawyer(HttpServletRequest request) {
		
		lawyer.setContact(Long.parseLong(request.getParameter("contact")));
		lawyer.setEmail(request.getParameter("email"));
		lawyer.setName(request.getParameter("name"));
		lawyer.setSpecialization(request.getParameter("specialization"));
		lawyer.setPassword(request.getParameter("password"));
		
		long i = lawyerDao.addLawyer(lawyer);
		if(i>0) {
			return "redirect:/viewLawyer";
		} else {
			return "addLawyer";
		}
	}
	
	
	
	@RequestMapping("/viewLawyer")
	public String showLawyers(Model m) {
		List<Lawyer> allLawyer = lawyerDao.displayAll();
		m.addAttribute("allLawyer", allLawyer);
		return "viewLawyer";
	}
	
	@RequestMapping("/addLawyer")
	public String addLawyer() {
		return "addLawyer";
	}
	
	@RequestMapping(path="/delete", method = RequestMethod.GET)
	public String deleteLawyer(HttpServletRequest request) {
		long id = Long.parseLong(request.getParameter("Lid"));
		lawyerDao.deleteLawyer(id);
		return "redirect:/viewLawyer";
	}
	
	@RequestMapping("/viewCitizen")
	public String showCitizen(Model m) {
		List<Citizen> allCitizen = citizenDao.displayAll();
		m.addAttribute("allCitizen", allCitizen);
		return "viewCitizen";
	}
	
	
}
