package com.seoul.gatherlive.view.login;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.seoul.gatherlive.biz.profile.MemberVO;

@Controller
public class LogoutHandler {

	@RequestMapping("/member/logout.do")
	public String logout(MemberVO vo, HttpSession session) {
			
		session.invalidate();
		
		return "redirect:../";
	}
	
}
