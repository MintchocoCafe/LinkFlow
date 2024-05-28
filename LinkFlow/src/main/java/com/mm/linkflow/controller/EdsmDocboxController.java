package com.mm.linkflow.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mm.linkflow.dto.EdocDto;
import com.mm.linkflow.dto.EdocFormDto;
import com.mm.linkflow.dto.MemberDto;
import com.mm.linkflow.dto.PageInfoDto;
import com.mm.linkflow.service.service.EdsmDocboxService;
import com.mm.linkflow.util.PagingUtil;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/edsm/docbox")
@Controller
@RequiredArgsConstructor
public class EdsmDocboxController {
	private final EdsmDocboxService edsmDocboxService;
	private final PagingUtil pagingUtil;
	
	@GetMapping("/search.docbox")
	public ModelAndView search(@RequestParam(value="page", defaultValue="1") int currentPage,
			   @RequestParam Map<String, String> search, HttpSession session,
			   ModelAndView mv) {
		MemberDto loginUser = (MemberDto) session.getAttribute("loginUser");
		search.put("userId", loginUser.getUserId());
		
		log.debug("search: {}", search);
		
		int listCount = edsmDocboxService.selectSearchListCnt(search);
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 10, 10);
		List<EdocDto> list = edsmDocboxService.selectSearchList(search, pi);
		
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .addObject("search", search)
		  .addObject("listCnt", listCount)
		  .setViewName("edsm/docbox/listAll");
		
		return mv;
	}
	
	@GetMapping("/detail.docbox")
	public String detail(String edNo, Model model) {
		log.debug("edNo : {}", edNo);
		
		model.addAttribute("edoc", edsmDocboxService.selectEdocDetail(edNo));
		
		return "/edsm/docbox/detail";
	}
	
	@GetMapping("/listAll.docbox")
	public ModelAndView listAll(@RequestParam(value="page", defaultValue="1") int currentPage, ModelAndView mv, HttpSession session) {
		MemberDto loginUser = (MemberDto) session.getAttribute("loginUser");
		String userId = loginUser.getUserId();
		
		int listCount = edsmDocboxService.selectDocboxListCnt(userId);
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 10, 10);
		List<EdocDto> list = edsmDocboxService.selectDocboxList(pi, userId);
		
		mv.addObject("pi", pi).addObject("list", list).addObject("listCnt", listCount).setViewName("edsm/docbox/listAll");
		
		return mv;
	}
	
	// ----------- 잘가라 --------------------
	@GetMapping("/listAppr.docbox")
	public String listAppr() {
		return "/edsm/docbox/listAppr";
	}
	
	@GetMapping("/listDraft.docbox")
	public String listDraft() {
		return "/edsm/docbox/listDraft";
	}
	
	@GetMapping("/listRef.docbox")
	public String listRef() {
		return "/edsm/docbox/listRef";
	}
	
	@GetMapping("/listReject.docbox")
	public String listReject() {
		return "/edsm/docbox/listReject";
	}
}
