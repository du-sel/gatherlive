package com.seoul.gatherlive.view.mypage;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.seoul.gatherlive.biz.profile.MemberVO;
import com.seoul.gatherlive.biz.profile.impl.MemberService;

@Controller
public class UpdatePasswordHandler {

	
	private MemberService memberService;
	
	@Autowired
	public UpdatePasswordHandler(MemberService memberService) {
		this.memberService = memberService;
	}
	
	
	@RequestMapping(value="/my/updatePassword.do", method=RequestMethod.GET)
	public String updatePassword() {
		
		return "/WEB-INF/views/mypage/my_chgPw.jsp";
	}
	
	
	
	
	@RequestMapping(value="/my/updatePassword.do", method=RequestMethod.POST)
	public String updatePassword(MemberVO vo, HttpSession session) throws Exception {
		
		
//		String pw = (String)map.get("PW");
		String pw_new = vo.getPassword();
		System.out.println("pw_new: "+pw_new);

		MemberVO account = (MemberVO)session.getAttribute("ACCOUNT");
		
		// 폼으로 들어왔는데 기존 비밀번호가 틀렸을 경우
//			if(!pw.equals(account.getPassword())) {
			
//				return "referer:?error=wrongPW";
			
//			}
		
		
		// 정상 변경
		
		account.setPassword(pw_new);
		memberService.updateMember(account);
		
		return "redirect:../my/updatePassword.do?msg=ok";
		

		
		
		
		
		
	}
	
	
}
