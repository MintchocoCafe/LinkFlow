package com.mm.linkflow.service.service;

import java.util.List;
import java.util.Map;

import com.mm.linkflow.dto.CalendarDto;
import com.mm.linkflow.dto.ScheduleDto;

public interface CalendarService {
	//�������
	int insertSch(ScheduleDto schedule);
	
	//�� Ķ������ ��� ���� ��ȸ
	List<ScheduleDto> selectSchList(String[] schCalSubCode);

	/*
	 * //�����շ� -calNo��ȸ String getSelectCalNo(Map<String, String> selectCalNo);
	 */
}
