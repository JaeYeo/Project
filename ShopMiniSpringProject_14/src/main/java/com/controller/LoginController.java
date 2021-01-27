package com.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dto.MemberDTO;
import com.service.MemberService;

@Controller
public class LoginController {
	@Autowired
	MemberService service;
	
	@RequestMapping(value = "/loginCheck/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:../"; //.xml에 설정 main.jsp
		//return "../";  // ../ 을 이용하여 /loginCheck의 상위 주소로 이동하여 주소를 사용함
	}
	
	@RequestMapping(value = "/login")
	public String login(@RequestParam HashMap<String, String> map, Model model, HttpSession session) {
		System.out.println(map); //key값은 네임값으로 value값은 입력값으로 저장됨. 
		MemberDTO dto = service.login(map);
		System.out.println(dto);
		String nextPage = "";
		if(dto!=null) {
			session.setAttribute("login", dto);
			nextPage="redirect:/goodsList?gCategory=top"; //로그인시 상품목록을 가져오도록 리다이렉트함
			//nextPage="main"에서 상품목록가져오려고 바꿈
			//return "main";
		} else {
			model.addAttribute("mesg", "등록된 회원이 아닙니다..");
			//return "loginForm";
			nextPage="loginForm";
		}
		return nextPage;

	}
}
