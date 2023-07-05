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
	public String insertAccount(MemberVO vo, MemberInstList instListObj, MemberLocaList locaListObj, HttpSession session) throws Exception {
		
		MemberVO member = (MemberVO)session.getAttribute("MEMBER");
		
		try {
			memberService.insertMember(member);			
		} catch(Exception e) {
			throw new Exception("중복된 이메일이 사용되었습니다");
		}

		MemberVO last = memberService.getMemberByMail(member);
		
		// 방금 넣은 회원정보로 악기에 id 넣어주기
//		for(MemberInstVO inst : instListObj.getInstList()) {
//			inst.setMember_id(last.getMember_id());
//		}
		
		// 방금 넣은 회원정보로 지역에 id 넣어주기
//		for(MemberLocaVO loca : locaListObj.getLocaList()) {
//			loca.setMember_id(last.getMember_id());
//		}
		
		// 완성된 instList, locaList INSERT
		// 나중에 쿼리문부터 만들어야됨
		 
		

		return "redirect:../join/welcomeJoin.do";
		
		
		
		
	}
	

}
