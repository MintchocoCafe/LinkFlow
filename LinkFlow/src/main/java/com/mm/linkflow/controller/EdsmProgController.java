package com.mm.linkflow.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mm.linkflow.dto.EdocDto;
import com.mm.linkflow.dto.PageInfoDto;
import com.mm.linkflow.service.service.EdsmProgService;
import com.mm.linkflow.util.FileUtil;
import com.mm.linkflow.util.PagingUtil;

import lombok.RequiredArgsConstructor;

@RequestMapping("/edsm/prog")
@Controller
@RequiredArgsConstructor
public class EdsmProgController {
	private final EdsmProgService edsmProgService;
	private final PagingUtil pagingUtil;
	private final FileUtil fileUtil;
	
//	// * 게시판 리스트 조회, 페이징
//	@GetMapping("/listAll.prog")
//	public ModelAndView list(@RequestParam(value="page", defaultValue = "1") int currentPage, ModelAndView mv) {
//		int listCount = edsmProgService.selectAllListCount();
//		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 5);
//		List<EdocDto> list = edsmProgService.selectAllList(pi);
//		
//		mv.addObject("pi", pi).addObject("list", list).setViewName("edsm/prog/listAll"); // 메서드 체이닝 가능
//		
//		return mv;
//	}

	@GetMapping("/apprEnrollForm.prog")
	public String apprEnrollForm() {
		return "/edsm/prog/apprEnrollForm";
	}

	@GetMapping("/modifyForm.prog")
	public String apprModifyForm() {
		return "/edsm/prog/modifyForm";
	}

	@GetMapping("/detail.prog")
	public String detail() {
		return "/edsm/prog/detail";
	}

	@GetMapping("/listAll.prog")
	public String listAll() {
		return "/edsm/prog/listAll";
	}

	@GetMapping("/listCheck.prog")
	public String listCheck() {
		return "/edsm/prog/listCheck";
	}

	@GetMapping("/listPlan.prog")
	public String listPlan() {
		return "/edsm/prog/listPlan";
	}

	@GetMapping("/listProg.prog")
	public String listProg() {
		return "/edsm/prog/listProg";
	}

	@GetMapping("/listWait.prog")
	public String listWait() {
		return "/edsm/prog/listWait";
	}

}
