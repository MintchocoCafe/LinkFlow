package com.mm.linkflow.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.mm.linkflow.dao.CalenderDao;
import com.mm.linkflow.dto.CalendarDto;
import com.mm.linkflow.dto.ScheduleDto;
import com.mm.linkflow.service.service.CalendarService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CalendarServiceImpl implements CalendarService {
	
	private final CalenderDao calendarDao;

	//���� ���
	@Override
	public int insertSch(ScheduleDto schedule) {
		return calendarDao.insertSch(schedule);
	}

	/*
	 * //���� ��� - ���̵�� �����ڵ�� calNo��ȸ
	 * 
	 * @Override public String getSelectCalNo(Map<String, String> selectCalNo) {
	 * return calendarDao.getSelectCalNo(selectCalNo); }
	 */

	//Ư�� Ķ���� ���� ��ü ��ȸ
	@Override
	public List<ScheduleDto> selectSchList(String schCalSubCode) {
		return calendarDao.selectSchList(schCalSubCode);
	}


	
	


	
}
