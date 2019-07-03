package com.hk.one;

import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hk.one.dto.MemberDto;
import com.hk.one.service.IMemberService;

@Controller
public class MemberController {
	@Autowired
	private IMemberService MemberService;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@RequestMapping(value = "/memberList.do", method = RequestMethod.GET)
	public String memberList(Locale locale, Model model) {
		logger.info("멤버 게시판 호출 {}.", locale);
		List<MemberDto> list = MemberService.getAllMember();
		model.addAttribute("list", list);		
		
		return "member/memberList";
	}
	
	@RequestMapping(value = "/memberDetail.do", method = RequestMethod.GET)
	public String memberDetail(Locale locale, Model model, String mem_id) {
		logger.info("멤버 상세정보 호출 {}.", locale);
		MemberDto member = MemberService.getMember(mem_id);
		model.addAttribute("member", member);		
		
		return "member/memberDetail";
	}
	
	@RequestMapping(value = "/joinMemberForm.do", method = RequestMethod.GET)
	public String joinMemberForm(Locale locale, Model model) {
		logger.info("회원가입폼으로 이동 {}.", locale);
		List<MemberDto> list = MemberService.getAllMember();
		model.addAttribute("list", list);
		
		return "member/joinMember";
	}
	
	@RequestMapping(value = "/joinMember.do", method = RequestMethod.POST)
	public String joinMember(Locale locale, Model model, MemberDto memberDto) {
		logger.info("회원 가입 {}.", locale);
		boolean isS = MemberService.joinMember(memberDto);
		if(isS) {
			return "redirect:memberList.do";
		} else {
			model.addAttribute("failJoin", "회원 가입 실패");
			return "error";
		}
	}
}
