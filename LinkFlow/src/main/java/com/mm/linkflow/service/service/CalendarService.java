package com.mm.linkflow.service.service;

import java.util.List;

import com.mm.linkflow.dto.ScheduleDto;

public interface CalendarService {
	//�������
	int insertSch(ScheduleDto schedule);
	
	//�� Ķ������ ��� ���� ��ȸ
	List<ScheduleDto> selectSchList(String calNo);
}
