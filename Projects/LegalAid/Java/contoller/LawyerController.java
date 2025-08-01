package com.legalAid.contoller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.legalAid.Dao.CasesDao;
import com.legalAid.Dao.LawyerDao;
import com.legalAid.model.Cases;
import com.legalAid.model.Citizen;
import com.legalAid.model.Lawyer;

import get_foreignkey.GetSet_lawyerId;
import get_foreignkey.Getset_citizen;

@Controller
public class LawyerController {
	
	ApplicationContext context = new ClassPathXmlApplicationContext("config.xml");
	Lawyer lawyer = (Lawyer) context.getBean("lawyer");
	LawyerDao lawyerDao = (LawyerDao) context.getBean("lawyerDao");
	Cases cases = (Cases) context.getBean("cases");
	CasesDao casesDao = (CasesDao) context.getBean("casesDao");
	
	@RequestMapping("/lawyerLogin")
	public String lawyerLogin(){
		return "lawyerLogin";
	}
	
	@RequestMapping(path="/LoginLawyer", method = RequestMethod.POST)
	public String LoginLawyer(HttpServletRequest request) {
		long contact = Long.parseLong(request.getParameter("contact"));
		String pass = request.getParameter("password");
		GetSet_lawyerId.setLawyerid(contact);
		Lawyer l = lawyerDao.getLawyer(contact);
		
		if(l != null) {
			return "redirect:/lawyer_dashboard";
		} else {
			return "lawyerLogin";
		}
}
	
		@RequestMapping("/lawyer_dashboard")
		public String lawyer_dashboard(Model m) {
			List<Cases> allCases = casesDao.displayAll();
			m.addAttribute("allCases", allCases);
			return "lawyer_dashboard";
		}
}
