package com.legalAid.contoller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.legalAid.Dao.CasesDao;
import com.legalAid.Dao.CitizenDao;
import com.legalAid.model.Cases;
import com.legalAid.model.Citizen;
import com.legalAid.model.Lawyer;

import get_foreignkey.Getset_citizen;

@Controller
public class CaseController {
	
	ApplicationContext context = new ClassPathXmlApplicationContext("config.xml");
	Citizen citizen = (Citizen) context.getBean("citizen");
	CitizenDao citizenDao = (CitizenDao) context.getBean("citizenDao");
	Cases cases = (Cases) context.getBean("cases");
	CasesDao casesDao = (CasesDao) context.getBean("casesDao");
	
	@RequestMapping("/addCaseRequest")
	public String addcase() {
		return "addCaseRequest";
	}
	
	@RequestMapping("/addCase")
	public String AddCase(HttpServletRequest request) {
		int id =0;
		long contact = Getset_citizen.getCitizenId();
		
		cases.setCaseType(request.getParameter("caseType"));
		cases.setId(id);
		cases.setDescription(request.getParameter("description"));
		cases.setDate(request.getParameter("date"));
		cases.setStatus("Pending");
		cases.setCitizenContactId(contact);
		
		int i = casesDao.addCase(cases);
		if(i>0) {
			return "waiting";
		} else {
			return "addCaseRequest";
		}
	}
	
	@RequestMapping("/waiting")
	public String waiting() {
		return "waiting";
	}
	
	
	
	@RequestMapping("/viewCases")
	public String showLawyers(Model m) {
		List<Cases> allCases = casesDao.displayAll();
		m.addAttribute("allCases", allCases);
		return "viewCases";
	}
}
