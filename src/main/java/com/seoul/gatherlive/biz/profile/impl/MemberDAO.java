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
		System.out.println("MemberDAO - getMemberByMail() 실행");
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
		sqlSession.insert("profileMapping.insertMember", vo);
		// 두번 실행해서 롤백되는지 테스트 
	}
	
	
	// member 테이블에 UPDATE
	public void updateMember(MemberVO vo) {
		System.out.println("MemberDAO - updateMember() 실행");
		sqlSession.update("profileMapping.updateMember", vo);
	}
	
	
	
	// member 테이블에서 DELETE
	public void deleteMember(MemberVO vo) {
		System.out.println("MemberDAO - deleteMember() 실행");
		sqlSession.delete("profileMapping.deleteMemberInst", vo);
		//sqlSession.delete("profileMapping.deleteMemberLoca", vo);
		// 참조테이블 막아두고 롤백되는지 확인하기
		sqlSession.delete("profileMapping.deleteMember", vo);
	}
	
	
}
