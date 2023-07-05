package com.seoul.gatherlive.view.mypage;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.seoul.gatherlive.biz.profile.MemberVO;
import com.seoul.gatherlive.biz.profile.impl.MemberService;

@Controller
public class DeleteAccountHandler {

	private MemberService memberService;
	
	@Autowired
	public DeleteAccountHandler(MemberService memberService) {
		this.memberService = memberService;
	}
	
	
	
	@RequestMapping(value="/my/deleteAccount.do", method=RequestMethod.GET)
	public String deleteAccount(MemberVO vo, HttpSession session) throws Exception {
		
		MemberVO account = (MemberVO)session.getAttribute("ACCOUNT");
		
		try {
			memberService.deleteMember(account);			
		} catch(Exception e) {
			throw new Exception("탈퇴 과정에서 문제가 발생했습니다");
		}
		
		session.invalidate();
			
		return "redirect:../";
		
		
	}
	
	
}
