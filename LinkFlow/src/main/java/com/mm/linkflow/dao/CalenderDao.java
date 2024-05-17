package com.mm.linkflow.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mm.linkflow.dto.ScheduleDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class CalenderDao {
	private final SqlSessionTemplate sqlSessionTemplate;

	//�������
	public int insertSch(ScheduleDto schedule) {
		return sqlSessionTemplate.insert("calendarMapper.insertSch", schedule);
	}

	/*
	 * //���� ��� - ���̵�� �����ڵ�� calNo��ȸ public String getSelectCalNo(Map<String, String>
	 * selectCalNo) { return
	 * sqlSessionTemplate.selectOne("calendarMapper.getSelectCalNo", selectCalNo); }
	 */  
	
	//Ư�� Ķ���� ��ü ���� ��ȸ 
	public List<ScheduleDto> selectSchList(String schCalSubCode) {
        return sqlSessionTemplate.selectList("calendarMapper.selectScheduleList", schCalSubCode);
	}
}
