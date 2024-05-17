package com.mm.linkflow.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mm.linkflow.dto.MemberDto;
import com.mm.linkflow.dto.ScheduleDto;
import com.mm.linkflow.service.service.CalendarService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/calendar")
@RequiredArgsConstructor
public class CalendarController {
	
	private final CalendarService calendarService;

	
	//calendarMain ����   
	@GetMapping("/calMain.page")
	public String calendarMain() {
		return "calendar/calendarMain";
	}
	
	//schWasteList ����
	@GetMapping("/wasteList.page")
	public String schWasteList() {
		return "calendar/schWasteList";
	}
	
	//calMain - ���� ��� 
	@ResponseBody
	@PostMapping(value="/regist.do", produces="text/html; charset=utf-8")//
	public String insertSch(ScheduleDto schedule, HttpSession session) {  
		String userId = ((MemberDto)session.getAttribute("loginUser")).getUserId();
		schedule.setModId(userId);
		log.debug(userId);
		/*
		 * String schCalSubCode = schedule.getCalSubCode();
		 * 
		 * Map<String, String> selectCalNo = new HashMap<>();
		 * selectCalNo.put("schCalSubCode", schCalSubCode); selectCalNo.put("userId",
		 * userId);
		 * 
		 * calendarService.getSelectCalNo(selectCalNo);
		 */
		
	    int result = calendarService.insertSch(schedule);
	    if (result == 1) {  
	        return "success"; // ����  
	    } else {
	        return "fail"; // ��� ����
	    }
	}
  
	//���� ��ü ��ȸ(Ư�� Ķ����)
	@ResponseBody
	@GetMapping(value="/schList.do", produces="application/json")
	public List<ScheduleDto> selectSchList(@RequestParam("schCalSubCode") String[] schCalSubCode) { 

		List<ScheduleDto> result = calendarService.selectSchList(schCalSubCode);
		return result;
	}
	  
}
