package com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.omg.CORBA.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.dto.MemberDTO;
import com.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	MemberService service;

	@RequestMapping(value = "/memberAdd") //memberForm.jsp 데이터 전송옴
	public String memberAdd(MemberDTO m, Model model) { //폼에서 넘어온 데이터를 MemberDTO에 자동저장
		service.memberAdd(m);
		model.addAttribute("success", "회원가입성공"); //main.jsp에서 출력할 success문구 저장
		return "main"; //main.jsp
	}
	
	@RequestMapping(value = "loginCheck/myPage")
	public String myPage(HttpSession session) {
		//세션에서 id얻기
		//db에서 id에 해당하는 DTO정보 얻기 myPage(사용자 id이용)
		//dto정보 콘솔에 출력
		MemberDTO dto = (MemberDTO)session.getAttribute("login");
		String userid = dto.getUserid();
		System.out.println("id=="+userid);
		dto = service.myPage(userid);
		session.setAttribute("login", dto);
		return "redirect:../myPage"; //servlet-context에등록
	}
	
	@RequestMapping(value = "/idDuplicateCheck", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String idDuplicatedCheck(@RequestParam("id") String userid) { //@RequestParam String id
		MemberDTO dto = service.myPage(userid);
		System.out.println("idDuplicatedCheck===="+userid);
		String mesg="아이디 사용가능";
		if(dto!=null) {
			mesg="아이디 중복";
		}
		return mesg;
	}
	
	@RequestMapping(value = "loginCheck/memberUpdate")
	public String memberUpdate(MemberDTO m) {
		System.out.println("받아온 값==="+m);
		service.memberUpdate(m);//회원정보 업데이트
		return "redirect:../loginCheck/myPage";
		
	}
}
