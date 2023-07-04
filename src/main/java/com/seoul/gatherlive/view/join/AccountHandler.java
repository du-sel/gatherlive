package com.seoul.gatherlive.view.join;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.seoul.gatherlive.biz.profile.MemberVO;

@Controller
public class AccountHandler {

	
	
	@RequestMapping(value="/join/account.do", method=RequestMethod.GET)
	public String getJoinInfo(MemberVO vo) {
		
		return "/WEB-INF/views/join/join_2.jsp";
	}
	
	
	
	
	@RequestMapping(value="/join/account.do", method=RequestMethod.POST)
	public String getJoinInfo(MemberVO vo, HttpSession session) throws Exception {
		
		session.setAttribute("MEMBER", vo);
		
		
		return "redirect:../join/insertAccount.do";
		
	}
	
}
