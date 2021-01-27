package com.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.CartDTO;
import com.dto.GoodsDTO;
import com.dto.OrderDTO;
@Repository
public class GoodsDAO {
	@Autowired
	SqlSessionTemplate template;
	
	public void cartUpdate(Map<String, String> map) {
		System.out.println("dao==="+map);
		template.update("CartMapper.cartUpdate", map);
	}
	
	public List<CartDTO> cartList(String id){
		List<CartDTO> list =template.selectList("CartMapper.cartList", id);
		return list;
	}
	public int cartAdd(CartDTO dto) {
		int CA = template.insert("CartMapper.cartAdd", dto);
		return CA;
	}
	
	public GoodsDTO goodsRetrieve(String gCode) {
		GoodsDTO dto = template.selectOne("GoodsMapper.goodsRetrieve", gCode);
		return dto;
	}
	
	public List<GoodsDTO> goodsList(String gCategory){
		List<GoodsDTO> list = template.selectList("GoodsMapper.goodsList", gCategory);
		return list;
	}

	public int cartDelete(int num) {
		int n = template.delete("CartMapper.cartDelete", num);
		return n;
	}

	public int cartAllDel(ArrayList<String> list) {
		int n = template.delete("CartMapper.cartAllDel", list);
		return n;
	}

	public CartDTO orderConfirmByNum(int num) {
		CartDTO dto = template.selectOne("CartMapper.cartByNum", num);
		return dto;
	}

	public void orderDone(OrderDTO odto) {
		int n = template.insert("CartMapper.orderDone", odto);
	}
}
