package com.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.MemberDTO;

@Repository //component-scan 자동빈생성
public class MemberDAO {
	@Autowired
	SqlSessionTemplate template; //자동주입
	
	public void memberAdd(MemberDTO m) {
		int n = template.insert("MemberMapper.memberAdd", m);
		System.out.println("회원가입 insert확인 번호 : "+n);
	}
	//컨넥션을 자동으로 반납하여 기존에 계속쓰는 servlet과 달리 close하는 작업이 필요없음.
	
	public MemberDTO login(HashMap<String, String> map) {
		MemberDTO dto = template.selectOne("MemberMapper.login", map);
		return dto;
	}
	
	public MemberDTO myPage(String userid) {
		MemberDTO dto = template.selectOne("MemberMapper.mypage", userid);
		return dto;
	}
	
	public void memberUpdate(MemberDTO m) {
		int update = template.update("MemberMapper.memberUpdate", m);
		System.out.println("1=업데이트 됨======"+update);
	}
}
