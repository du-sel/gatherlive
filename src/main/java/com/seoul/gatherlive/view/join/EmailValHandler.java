package com.seoul.gatherlive.view.join;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.seoul.gatherlive.biz.profile.MemberVO;
import com.seoul.gatherlive.biz.profile.impl.MemberService;


@Controller
public class EmailValHandler {

	
	@RequestMapping(value="/join/email.do", method=RequestMethod.GET)
	public String getJoinMail(MemberVO vo) {
		
		return "/WEB-INF/views/join/join_1.jsp";
	}
	
	
	
	
	@RequestMapping(value="/join/email.do", method=RequestMethod.POST)
	public String getJoinMail(MemberVO vo, HttpSession session) throws Exception {
		
		session.setAttribute("MAIL", vo.getMail());
		return "redirect:../join/account.do";
		
	}
	
}
