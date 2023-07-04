package com.seoul.gatherlive.view.login;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.seoul.gatherlive.biz.profile.MemberVO;
import com.seoul.gatherlive.biz.profile.impl.MemberService;


@Controller
public class LoginHandler {
	
	private MemberService memberService;
	
	@Autowired
	public LoginHandler(MemberService memberService) {
		this.memberService = memberService;
	}
	
	
	@RequestMapping(value="/member/login.do", method=RequestMethod.GET)
	public String login(MemberVO vo) {
		
		return "/WEB-INF/views/login/login.jsp";
	}
	
	
	
	
	@RequestMapping(value="/member/login.do", method=RequestMethod.POST)
	public String login(MemberVO vo, HttpSession session) throws Exception {
		
		MemberVO found = memberService.getMemberByMail(vo);
		
		
		// 해당 메일주소로 가입된 회원이 없을 때 
		if(found.getUser_name() == null) {
			return "referer:?error=noSuchMember";
		} else {
			
			// 회원은 있으나 비밀번호가 일치하지 않을 때 
			if(!found.getPassword().equals(vo.getPassword())) {
				System.out.println("비밀번호가 일치하지 않음");
				return "referer:?error=wrongPassword";
			} else {
				
				// 로그인 성공 
				session.setAttribute("ACCOUNT", found);
				return "redirect:../";
			
			}
		}
		
	}
	
	

}
