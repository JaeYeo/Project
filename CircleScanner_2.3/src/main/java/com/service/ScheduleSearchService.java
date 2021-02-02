package com.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.ScheduleSearchDAO;
import com.dto.ScheduleSearchDTO;

@Service
public class ScheduleSearchService {
	@Autowired
	private ScheduleSearchDAO dao;

	public Map<String, List<ScheduleSearchDTO>> selectScheduleSearch(ScheduleSearchDTO ssDTO) {
		Map<String, List<ScheduleSearchDTO>> map = dao.selectScheduleSearch(ssDTO);
		return map;
	}

}
