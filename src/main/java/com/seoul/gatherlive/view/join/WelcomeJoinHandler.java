package com.seoul.gatherlive.view.join;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.seoul.gatherlive.biz.profile.MemberVO;

@Controller
public class WelcomeJoinHandler {

	@RequestMapping(value="/join/welcomeJoin.do", method=RequestMethod.GET)
	public String welcomeJoin(MemberVO vo) {		
		return "/WEB-INF/views/join/join_4.jsp";
	}
	
}
