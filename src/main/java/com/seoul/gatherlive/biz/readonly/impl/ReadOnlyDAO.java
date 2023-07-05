package com.seoul.gatherlive.biz.readonly.impl;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("readonlyDAO")
public class ReadOnlyDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	// final inst 대분류
	public ArrayList<String> getFinalInst() {
		return (ArrayList)sqlSession.selectList("jsonMapping.getFinalInst");		
	}

	// final loca 대분류
	public ArrayList<String> getFinalLoca() {
		return (ArrayList)sqlSession.selectList("jsonMapping.getFinalLoca");		
	}






}
