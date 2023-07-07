package com.seoul.gatherlive.view.join;

import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

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
		System.out.println("세션에 저장해뒀던 member: "+member.getMail());
		
		// join3 페이지에서 받는 것들 넣어주기
		System.out.println("profile_image: "+vo.getProfile_image());
		member.setProfile_image(vo.getProfile_image());
		
		System.out.println("Open: "+vo.getOpen());
		member.setOpen(vo.getOpen());
		
		System.out.println("Pref_genre: "+vo.getPref_genre());
		member.setPref_genre(vo.getPref_genre());
		
		System.out.println("Pref_musician: "+vo.getPref_musician());
		member.setPref_musician(vo.getPref_musician());
		
		System.out.println("Pref_music: "+vo.getPref_music());
		member.setPref_music(vo.getPref_music());
		
		System.out.println("Pref_day: "+vo.getPref_day());
		member.setPref_day(vo.getPref_day());
		
		System.out.println("Pref_time: "+vo.getPref_time());
		member.setPref_time(vo.getPref_time());
		
		System.out.println("Hope: "+vo.getHope());
		member.setHope(vo.getHope());
		
		System.out.println("Introduce: "+vo.getIntroduce());
		member.setIntroduce(vo.getIntroduce());
		
		MultipartFile profile_image = member.getProfile_image();
		
		try {
			
			if(!profile_image.isEmpty()) {
				String filename = profile_image.getOriginalFilename();
				profile_image.transferTo(new File("C:\\Users\\1\\Desktop\\GatherLive\\profile_image\\"+filename));
			}
			
			memberService.insertMember(member);			
			
		} catch(Exception e) {
			//e.printStackTrace();
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
