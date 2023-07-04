package com.seoul.gatherlive.biz.profile.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.seoul.gatherlive.biz.profile.MemberInstVO;
import com.seoul.gatherlive.biz.profile.MemberLocaVO;
import com.seoul.gatherlive.biz.profile.MemberVO;

@Repository("memberDAO")
public class MemberDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	// mail로 특정회원 검색
	public MemberVO getMemberByMail(MemberVO vo) {
		return sqlSession.selectOne("profileMapping.getMemberByMail", vo);
	}
	
	// 특정회원 악기 목록 SELECT
	public List<MemberInstVO> getMyInst(MemberVO vo) {
		return sqlSession.selectList("profileMapping.getMyInst", vo);
	}
	
	// 특정회원 지역 목록 SELECT
	public List<MemberLocaVO> getMyLoca(MemberVO vo) {
		return sqlSession.selectList("profileMapping.getMyLoca", vo);
	}
	
	// 특정회원 나이 SELECT
	public String getMemberAge(MemberVO vo) {
		return sqlSession.selectOne("profileMapping.getMemberAge", vo);
	}
	
	
	// member 테이블에 INSERT
	public void insertMember(MemberVO vo) {
		sqlSession.insert("profileMapping.insertMember", vo);
	}
	
	
	// member 테이블에 UPDATE
	public void updateMember(MemberVO vo) {
		sqlSession.update("profileMapping.updateMember", vo);
	}
	
	
}
