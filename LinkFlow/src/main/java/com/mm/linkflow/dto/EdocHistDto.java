package com.mm.linkflow.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import lombok.experimental.SuperBuilder;

@SuperBuilder
@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class EdocHistDto extends CommonDto {
	private String userId; 
	private String edNo; 
	private int edHistOrder; 
	private String edHistSubCode; 
	private String edHistDate; 
	private String edHistComment;  
	
	private List<EdocFormDto> edocFormList;
	
}
