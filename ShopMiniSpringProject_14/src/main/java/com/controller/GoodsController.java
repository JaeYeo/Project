package com.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dto.CartDTO;
import com.dto.GoodsDTO;
import com.dto.MemberDTO;
import com.dto.OrderDTO;
import com.service.GoodsService;
import com.service.MemberService;

@Controller
public class GoodsController {
	@Autowired
	GoodsService service;
	@Autowired
	MemberService mService;

	@RequestMapping(value = "/loginCheck/cartDelete")
	@ResponseBody
	public String cartDelete(@RequestParam int num) {
		System.out.println("cartDelete====" + num);
		service.cartDelete(num);
		return "redirect:../cartList";
	}
	
	@RequestMapping(value = "/loginCheck/cartUpdate")
	@ResponseBody
	public String cartUpdate(@RequestParam Map<String, String> map) {
		System.out.println("cartUpdate====" + map);
		service.cartUpdate(map);
		return "redirect:../cartList";
	}

	@RequestMapping(value = "/loginCheck/cartList")
	public String cartList(RedirectAttributes attr, HttpSession session) {
		MemberDTO mDTO = (MemberDTO) session.getAttribute("login");
		String userid = mDTO.getUserid();
		List<CartDTO> list = service.cartList(userid);
		for (CartDTO c : list) {
			System.out.println(c);
		}
		attr.addFlashAttribute("cartList", list);
		return "redirect:../cartList";
	}

	@RequestMapping(value = "/loginCheck/cartAdd")
	public String cartAdd(CartDTO dto, HttpSession session) {// 파싱
		MemberDTO mDTO = (MemberDTO) session.getAttribute("login"); // 세션에서 회원정보얻기
		dto.setUserid(mDTO.getUserid()); // 회원정보에서 id를 꺼내 cartDTO에 넣어주기
		session.setAttribute("mesg", dto.getgCode());
		service.cartAdd(dto); // db insert
		return "redirect:../goodsRetrieve?gCode=" + dto.getgCode();
	}

	@RequestMapping(value = "/goodsRetrieve") // 뷰페이지
	@ModelAttribute("goodsRetrieve") // 키값
	public GoodsDTO goodsRetrieve(@RequestParam String gCode) { // 리턴타입 주의 ,
		System.out.println("goodsController=====" + gCode);
		GoodsDTO dto = service.goodsRetrieve(gCode);
		return dto;

	}

	@RequestMapping(value = "/goodsList")
	public ModelAndView goodsList(@RequestParam String gCategory) {
		if (gCategory == null) {
			gCategory = "top"; // 데이터가 없을 경우 기본값(top)으로 설정
		}
		List<GoodsDTO> list = service.goodsList(gCategory);
		ModelAndView mav = new ModelAndView();
		mav.addObject("goodsList", list);
		// request.setAttribute("goodsList", list)와 동일
		mav.setViewName("main"); // main.jsp
		return mav;
	}
	@RequestMapping(value = "/loginCheck/delAllCart")
	public String cartAllDel(@RequestParam("check") ArrayList<String> list) {
		System.out.println(list);
		int n = service.cartAllDel(list);
		return "redirect../loginCheck/cartList";
	}
	
	@RequestMapping(value = "/loginCheck/orderConfirm")
	public String orderConfirm(@RequestParam("num") int num, HttpSession session, RedirectAttributes xxx) {
		MemberDTO mdto = (MemberDTO) session.getAttribute("login");
		String userid = mdto.getUserid();
		mdto = mService.myPage(userid);
		CartDTO cdto = service.orderConfirmByNum(num);
		System.out.println(mdto +"\n" + cdto);
		xxx.addFlashAttribute("mdto", mdto);
		xxx.addFlashAttribute("cdto", cdto);
		return "redirect:../orderConfirm";
	}
	
	
	@RequestMapping(value = "/loginCheck/orderDone")
	public String orderDone(OrderDTO odto, int orderNum, HttpSession session, RedirectAttributes xxx ) {
		MemberDTO mdto = (MemberDTO) session.getAttribute("login");
		System.out.println(odto);
		String userid = mdto.getUserid();
		odto.setUserid(userid);
		
		service.orderDone(odto, orderNum);
		xxx.addFlashAttribute("odto", odto);
		return "redirect:../orderDone";
//		return null;
	}
	
	

}
