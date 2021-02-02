package com.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	// by jungwoo 20201204
	@RequestMapping("/")
	public String main(HttpSession session) {
		String sysDate = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		String sysNextDate = LocalDate.now().plusDays(1).format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		
		session.setAttribute("sysDate", sysDate);
		session.setAttribute("sysNextDate", sysNextDate);
		return "main";
	}
	

	
	
}
