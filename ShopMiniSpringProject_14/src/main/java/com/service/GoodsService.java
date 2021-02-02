package com.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.GoodsDAO;
import com.dto.CartDTO;
import com.dto.GoodsDTO;
import com.dto.OrderDTO;

@Service
public class GoodsService {
	@Autowired
	GoodsDAO dao;
	
	public void cartUpdate(Map<String, String> map) {
		System.out.println("service===="+map);
		dao.cartUpdate(map);
	}
	
	public List<CartDTO> cartList(String id){
		List<CartDTO> list = dao.cartList(id);
		return list;
	}
	public int cartAdd(CartDTO dto) {
		int CA = dao.cartAdd(dto);
		return CA;
	}
	
	public GoodsDTO goodsRetrieve(String gCode) {
		GoodsDTO dto = dao.goodsRetrieve(gCode);
		return dto;
	}
	
	public List<GoodsDTO> goodsList(String gCategory){
		List<GoodsDTO> list = dao.goodsList(gCategory);
		return list;
	}

	public int cartDelete(int num) {
		int n = dao.cartDelete(num);
		return n;
	}

	public int cartAllDel(ArrayList<String> list) {
		int n = dao.cartAllDel(list);
		return n;
	}
	
	public CartDTO orderConfirmByNum(int num) {
		CartDTO dto = dao.orderConfirmByNum(num);
		return dto;
	}
	
	@Transactional
	public void orderDone(OrderDTO odto, int orderNum) {
		dao.orderDone(odto);
		dao.cartDelete(orderNum);
	}
}
