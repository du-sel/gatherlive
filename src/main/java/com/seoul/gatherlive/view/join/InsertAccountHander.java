package com.seoul.gatherlive.view.join;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.seoul.gatherlive.biz.profile.MemberInstList;
import com.seoul.gatherlive.biz.profile.MemberInstVO;
import com.seoul.gatherlive.biz.profile.MemberLocaList;
import com.seoul.gatherlive.biz.profile.MemberLocaVO;
import com.seoul.gatherlive.biz.profile.MemberVO;
import com.seoul.gatherlive.biz.profile.impl.MemberService;

@Controller
public class InsertAccountHander {
	
	
	private MemberService memberService;
	
	@Autowired
	public InsertAccountHander(MemberService memberService) {
		this.memberService = memberService;
	}
	
	
	@RequestMapping(value="/join/insertAccount.do", method=RequestMethod.GET)
	public String insertAccount(MemberVO vo) {
		
		return "/WEB-INF/views/join/join_3.jsp";
	}
	
	
	
	
	@RequestMapping(value="/join/insertAccount.do", method=RequestMethod.POST)
	public String insertAccount(MemberVO vo, MemberInstList instList, MemberLocaList locaList, HttpSession session) throws Exception {
		
		memberService.insertMember(vo);

		MemberVO last = memberService.getMemberByMail(vo);
		session.setAttribute("MEMBER", last);
		
		for(int i = 0; i<instList.length; ) {
			
		}
		
		session.setAttribute("INSTLIST", instList);
		session.setAttribute("LOCALIST", locaList);
		//일단 저장만 해둠 
		

		return "redirect:../join/insertProfile.do";
		
		
		
		
	}
	

}
