package com.seoul.gatherlive.biz.readonly.impl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seoul.gatherlive.biz.profile.impl.MemberDAO;

@Service("readonlyService")
public class ReadOnlyService {

	@Autowired
	private ReadOnlyDAO readonlyDAO;

	
	// final inst 대분류
	public ArrayList<String> getFinalInst() {
		return readonlyDAO.getFinalInst();
	}

	// final loca 대분류
	public ArrayList<String> getFinalLoca() {
		return readonlyDAO.getFinalLoca();
	}

	
	
}
