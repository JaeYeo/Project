package com.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dto.AirlineDTO;
import com.dto.AirportDTO;
import com.dto.ScheduleSearchDTO;
import com.dto.SearchBtnDTO;
import com.dto.SelectBtnDTO;
import com.service.IataService;
import com.service.ScheduleSearchService;

// by jungwoo 20201204
@Controller
public class SearchController {
	@Autowired
	private IataService iataService;
	@Autowired
	private ScheduleSearchService scheduleSearchService;
	
	//1207
	@RequestMapping("/scheduleSearch")
	public String scheduleSearch(SearchBtnDTO searchBtnDTO, HttpSession session) {
		System.out.println("scheduleSearch START");
		//SearchBtnDTO 생성 RequestParam으로 쓰기엔 input값이 많기 때문에 새로운 값을 받는 용도의 dto 생성
		//그이후에는 session에 담아 쓰기때문에 다시 안쓰일 예정
		// 날짜 포맷 변경
		String outboundPartialDate = searchBtnDTO.getOutboundPartialDate().replaceAll("\\.", "/");
		String inboundPartialDate = searchBtnDTO.getInboundPartialDate().replaceAll("\\.", "/");
		searchBtnDTO.setOutboundPartialDate(outboundPartialDate);
		searchBtnDTO.setInboundPartialDate(inboundPartialDate);
		
		// 사람수만 받아오기위한 작업
		String passenger = searchBtnDTO.getPassenger().substring(0, 1);
		searchBtnDTO.setPassenger(passenger);
		searchBtnDTO.setPassengerInt(Integer.parseInt(passenger));
		session.setAttribute("searchBtnDTO", searchBtnDTO);
		
		//승객수 자체를 바로 알수있게하기위하여 searchBtnDTO의 passengerInt에 담았지만 사용하지않을 예정
		session.setAttribute("passenger", Integer.parseInt(passenger));
		
		//공항이 위치한 지역명에서 공항 IATA CODE를 받음
		String originPlaceAcode = iataService.selectIata(searchBtnDTO.getOriginPlace());
		String destinationPlaceAcode = iataService.selectIata(searchBtnDTO.getDestinationPlace());
		session.setAttribute("originPlaceAcode", originPlaceAcode);
		session.setAttribute("destinationPlaceAcode", destinationPlaceAcode);
		
		// 공항코드와 날짜를 이용하여 항공 스케쥴 받음
		ScheduleSearchDTO scheduleSearchDTO = new ScheduleSearchDTO();
		scheduleSearchDTO.setDEPARTURE_ACODE(originPlaceAcode);
		scheduleSearchDTO.setDESTINATION_ACODE(destinationPlaceAcode);
		scheduleSearchDTO.setDEPART_DATE(outboundPartialDate);
		scheduleSearchDTO.setARRIVE_DATE(inboundPartialDate);
		// 왕복기준 I/O가 두번 일어나 list들을 출발/도착 구분하여 map에 담겨서 옴
		// map을 넘기면 jsp에서 작업하기 해야하기때문에 스프링기준 자동완성 속도가 느려 list에 뽑아 session에 담음
		Map<String, List<ScheduleSearchDTO>> map = scheduleSearchService.selectScheduleSearch(scheduleSearchDTO);
		List<ScheduleSearchDTO> list_DepartScheduleSearchDTO = map.get("list_D");
		List<ScheduleSearchDTO> list_ArrivalScheduleSearchDTO = map.get("list_A");
		session.setAttribute("list_DepartScheduleSearchDTO", list_DepartScheduleSearchDTO);
		session.setAttribute("list_ArrivalScheduleSearchDTO", list_ArrivalScheduleSearchDTO);
		
		System.out.println("scheduleSearch END");
		return "search";
	}
	
	// by jungwoo 20201206
	@RequestMapping("/flightConfirm")
	public String flightConfirm(SelectBtnDTO selectBtnDTO, HttpSession session) {
		System.out.println("flightConfirm START");
		// selectBtnDTO로 넘기려고햇으나 totalPriceInt문제 
		// jsp에서는 int->값을받을땐 String -> int로 변환해야하기때문에 혼동이 올것이라 생각하여 수정하지않음
		// 또한 ReservationDTO의 totalPriceInt의 타입은 int이나 완벽히 될것이라는 확신이 없기때문에
		// 추후에 수정을 하기로 정함
		session.setAttribute("list_D_priceFormat", selectBtnDTO.getList_D_priceFormat());
		session.setAttribute("list_A_priceFormat", selectBtnDTO.getList_A_priceFormat());
		session.setAttribute("total_priceFormat", selectBtnDTO.getTotal_priceFormat());
		
		int totalPriceInt = Integer.parseInt(selectBtnDTO.getTotalPriceInt());
		String totalPrice = selectBtnDTO.getTotalPrice();
		session.setAttribute("totalPriceInt", totalPriceInt);
		session.setAttribute("totalPrice", totalPrice);
		
		List<ScheduleSearchDTO> list_DepartScheduleSearchDTO = (List<ScheduleSearchDTO>) session.getAttribute("list_DepartScheduleSearchDTO");
		List<ScheduleSearchDTO> list_ArrivalScheduleSearchDTO = (List<ScheduleSearchDTO>) session.getAttribute("list_ArrivalScheduleSearchDTO");
		
		int num = Integer.parseInt(selectBtnDTO.getI());
		ScheduleSearchDTO selected_DepartScheduleSearchDTO = list_DepartScheduleSearchDTO.get(num);
		ScheduleSearchDTO selected_ArrivalScheduleSearchDTO = list_ArrivalScheduleSearchDTO.get(num);
		session.setAttribute("selected_DepartScheduleSearchDTO", selected_DepartScheduleSearchDTO);
		session.setAttribute("selected_ArrivalScheduleSearchDTO", selected_ArrivalScheduleSearchDTO);
		
		// 선택된 스케쥴표에 대한 항공사정보
		String aCode_D = selected_DepartScheduleSearchDTO.getAIRCRAFT_NAME().substring(0, 2);
		String aCode_A = selected_ArrivalScheduleSearchDTO.getAIRCRAFT_NAME().substring(0, 2);
		String ANAME_K_D = iataService.selectAirlineNameKorean(aCode_D); 
		String ANAME_K_A = iataService.selectAirlineNameKorean(aCode_A); 
		AirlineDTO departAirlineDTO = iataService.selectAirline(aCode_D);
		AirlineDTO ArrivalAirlineDTO = iataService.selectAirline(aCode_A);
		session.setAttribute("ANAME_K_D", ANAME_K_D); // 한글 항공사명
		session.setAttribute("ANAME_K_A", ANAME_K_A); // 한글 항공사명
		session.setAttribute("departAirlineDTO", departAirlineDTO); // 항공사 정보
		session.setAttribute("ArrivalAirlineDTO", ArrivalAirlineDTO); // 항공사 정보
		
		// 선택된 스케쥴표에 대한 공항정보
		AirportDTO Airport_Names_Depart = iataService.selectAirportNameKorean(selected_DepartScheduleSearchDTO.getDEPARTURE_ACODE());
		AirportDTO Airport_Names_Desti = iataService.selectAirportNameKorean(selected_DepartScheduleSearchDTO.getDESTINATION_ACODE());
		session.setAttribute("Airport_Names_Depart", Airport_Names_Depart);
		session.setAttribute("Airport_Names_Desti", Airport_Names_Desti);
		
		System.out.println("flightConfirm END");
		// flightConfirmList.jsp로 data전송
		return "flightConfirmList";
	}
}
