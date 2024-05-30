package com.mm.linkflow.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mm.linkflow.dto.DeptDto;
import com.mm.linkflow.dto.ScheduleDto;
import com.mm.linkflow.dto.ShaSchDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class CalenderDao {
	private final SqlSessionTemplate sqlSessionTemplate;

	
	 //캘린더 메인 - 일정 등록 
	 public int insertSch(ScheduleDto schedule) { 
		 return sqlSessionTemplate.insert("calendarMapper.insertSch", schedule); }
	 
	
	//캘린더 메인 - 일정 전체조회
	public List<ScheduleDto> selectSchList(Map<String, Object> sch) {
        return sqlSessionTemplate.selectList("calendarMapper.selectScheduleList", sch);
	}

	//휴지통 - 일정 상세조회
	public ScheduleDto detailSch(String schNo) {
		return sqlSessionTemplate.selectOne("calendarMapper.detailSch", schNo);
	}

	
	//캘린더 메인 - 일정 삭제(상태변경)
	public int deleteSch(String schNo) {
		return sqlSessionTemplate.update("calendarMapper.deleteSch", schNo);
	}

	//휴지통 - 일정조회
	public List<ScheduleDto> selectSchWasteList(String schCalSubCode) {
		return sqlSessionTemplate.selectList("calendarMapper.selectSchWasteList", schCalSubCode);

	}
	
	//휴지통 -일정복구   
	public int wasteSchRestore(String schNo) {
		return sqlSessionTemplate.update("calendarMapper.wasteSchRestore", schNo);
	}

	//휴지통 -일정완전삭제(스케줄러)
	public int wasteSchCompletely() {
		return sqlSessionTemplate.delete("calendarMapper.wasteSchCompletely");
	}   
	


	//제이트리 조직도 멤버 조회
	public List<DeptDto> selecteMemberList() {
		return sqlSessionTemplate.selectList("calendarMapper.selecteMemberList");
	}

	//공유일정 삭제(상태변경)
	public int deleteShareSch(String schNo) {
		return sqlSessionTemplate.delete("calendarMapper.deleteShareSch", schNo);
	}

	//공유일정 등록
	public int insertSharedSch(String shareId, String userId) {
		 Map<String, Object> sch = new HashMap<>();
			sch.put("userId", userId);
			sch.put("shareId", shareId);
		return sqlSessionTemplate.insert("calendarMapper.insertSharedSch", sch);
	}

	//공유일정 복구
	public int wasteShareRestore(String schNo) {
		return sqlSessionTemplate.update("calendarMapper.wasteShareRestore", schNo);
	}

	//공유일정 삭제
	public int wasteShareRemoval(String schNo) {
        return sqlSessionTemplate.delete("calendarMapper.wasteShareRemoval", schNo);
    }
	
	// 휴지통 -일정완전삭제
    public int deleteSchWaste(String schNo) {
        return sqlSessionTemplate.delete("calendarMapper.deleteSchWaste", schNo);
    }

    //캘린더 메인 - 수정
	public int updateSch(Map<String, String> data) {
		return sqlSessionTemplate.update("calendarMapper.updateSch", data);
	}

	 //공유일정 수정
	public int updateSharedSch(Map<String, String> data) {
		return sqlSessionTemplate.update("calendarMapper.updateSharedSch", data);
	}

	
}
