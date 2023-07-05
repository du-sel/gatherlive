package com.seoul.gatherlive.view.join;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.seoul.gatherlive.biz.profile.MemberVO;
import com.seoul.gatherlive.biz.profile.impl.MemberService;
import com.seoul.gatherlive.biz.readonly.impl.ReadOnlyDAO;

@Controller
public class AccountHandler {

	private ReadOnlyDAO readonlyDAO;
	
	@Autowired
	public AccountHandler(ReadOnlyDAO readonlyDAO) {
		this.readonlyDAO = readonlyDAO;
	}
	
	
	@RequestMapping(value="/join/account.do", method=RequestMethod.GET)
	public String getJoinInfo(MemberVO vo) {
		
		return "/WEB-INF/views/join/join_2.jsp";
	}
	
	
	
	
	@RequestMapping(value="/join/account.do", method=RequestMethod.POST)
	public String getJoinInfo(MemberVO vo, HttpSession session) throws Exception {
		
		System.out.println("********** "+vo.getMail()+" **********");
		session.setAttribute("MEMBER", vo);
		
		// final inst, loca 셋팅 필요
		session.setAttribute("FINALINST", readonlyDAO.getFinalInst());
		session.setAttribute("FINALLOCA", readonlyDAO.getFinalLoca());
		
		
		return "redirect:../join/insertAccount.do";
		
	}
	
}
