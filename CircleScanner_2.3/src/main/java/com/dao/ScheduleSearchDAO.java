package com.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.ScheduleSearchDTO;

@Repository
public class ScheduleSearchDAO {
	@Autowired
	private SqlSessionTemplate template;
	
	public Map<String, List<ScheduleSearchDTO>> selectScheduleSearch(ScheduleSearchDTO ssDTO) {
		Map<String, List<ScheduleSearchDTO>> map = new HashMap<String, List<ScheduleSearchDTO>>();

		List<ScheduleSearchDTO> list_D = template.selectList("SearchMapper.selectScheduleSearch_D", ssDTO);
		List<ScheduleSearchDTO> list_A = template.selectList("SearchMapper.selectScheduleSearch_A", ssDTO);

		map.put("list_D", list_D);
		map.put("list_A", list_A);

//		System.out.println("list_A====================" + list_A);
//		System.out.println("list_D====================" + list_D);

		return map;
	}

}
