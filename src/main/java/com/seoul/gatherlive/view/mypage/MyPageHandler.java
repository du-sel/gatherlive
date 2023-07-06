package com.seoul.gatherlive.view.mypage;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.seoul.gatherlive.biz.profile.MemberInstList;
import com.seoul.gatherlive.biz.profile.MemberLocaList;
import com.seoul.gatherlive.biz.profile.MemberVO;
import com.seoul.gatherlive.biz.profile.impl.MemberService;

@Controller
public class MyPageHandler {
	
	private MemberService memberService;
	
	@Autowired
	public MyPageHandler(MemberService memberService) {
		this.memberService = memberService;
	}
	
	
	
	@RequestMapping(value="/my/main.do", method=RequestMethod.GET)
	public String getMyInfo(HttpSession session) {
		
		MemberVO account = (MemberVO)session.getAttribute("ACCOUNT");
		
		// 로그인 되어있지 않다면 돌려보내기 
		if(account == null) {
			
			return "referer:?error=needLogin";
			
		} else {
		
			
			// 악기, 지역 정보
//			session.setAttribute("MYINST", memberService.getMyInst(account));
//			session.setAttribute("MYLOCA", memberService.getMyLoca(account));
			
			// 나이
//			session.setAttribute("MYAGE", memberService.getMemberAge(account));
			
			
			// 프로필 한꺼번에 저장			
			HashMap<String, Object> map = new HashMap<>();			
			map.put("MEMBER", account);
			map.put("AGE", memberService.getMemberAge(account));
			map.put("INSTLIST", memberService.getMyInst(account));
			map.put("LOCALIST", memberService.getMyLoca(account));
			
			System.out.println("OPEN: "+account.getOpen());
			
			session.setAttribute("MYPROFILE", map);
			
			return "/WEB-INF/views/mypage/my_main.jsp";
			
		}
	}
	
	

	
	

}
