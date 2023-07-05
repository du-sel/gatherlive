package com.seoul.gatherlive.biz.profile.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seoul.gatherlive.biz.profile.MemberInstVO;
import com.seoul.gatherlive.biz.profile.MemberLocaVO;
import com.seoul.gatherlive.biz.profile.MemberVO;

@Service("memberService")
public class MemberService {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberService.class);
	
	@Autowired
	private MemberDAO memberDAO;

	
	// mail로 특정회원 SELECT
	public MemberVO getMemberByMail(MemberVO vo) {
		logger.info("logger test");
		return memberDAO.getMemberByMail(vo);
	}
	
	// 특정회원 악기 목록 SELECT
	public List<MemberInstVO> getMyInst(MemberVO vo) {
		return memberDAO.getMyInst(vo);
	}
	
	// 특정회원 지역 목록 SELECT
	public List<MemberLocaVO> getMyLoca(MemberVO vo) {
		return memberDAO.getMyLoca(vo);
	}
	
	// 특정회원 나이 SELECT
	public String getMemberAge(MemberVO vo) {
		return memberDAO.getMemberAge(vo);
	}
	
	
	// member 테이블에 INSERT
	public void insertMember(MemberVO vo) {
		memberDAO.getMemberByMail(vo);
	}
	
	
	// member 테이블에 UPDATE
	public void updateMember(MemberVO vo) {
		memberDAO.updateMember(vo);
	}
	
	
	
	
	
	
}
