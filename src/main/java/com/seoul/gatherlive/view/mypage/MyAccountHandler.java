package com.seoul.gatherlive.view.mypage;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.seoul.gatherlive.biz.profile.MemberVO;

@Controller
public class MyAccountHandler {
	
	@RequestMapping(value="/my/account.do", method=RequestMethod.GET)
	public String getMyInfo(HttpSession session) {
		
		return "/WEB-INF/views/mypage/my_account.jsp";

	}

}
