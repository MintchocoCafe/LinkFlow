package com.mm.linkflow.service.service;

import java.util.List;

import com.mm.linkflow.dto.DeptDto;
import com.mm.linkflow.dto.EdocDto;
import com.mm.linkflow.dto.EdocFormDto;
import com.mm.linkflow.dto.EdocHistDto;
import com.mm.linkflow.dto.PageInfoDto;

public interface EdsmProgService {

//	int selectAllListCount();
//
//	List<EdocDto> selectAllList(PageInfoDto pi);
//	
	
	// 문서 종류 (양식) 리스트 조회 용도
	List<EdocFormDto> selectFormList();
	
	// 문서 종류에 따른 양식 내용 조회 용도
	List<EdocFormDto> selectEdFrContentList(String docType);
	
	// 결재선 설정 모달 조회
	List<DeptDto> selectApprLine();
	
	// 기안서 작성 (결재 문서 insert)
	int insertDoc(EdocDto edocDto);
}
