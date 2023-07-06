package com.seoul.gatherlive.biz.common;

import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Service;

@Service
@Aspect
public class AfterAdvice {

	@Pointcut("execution(* com.seoul.gatherlive.biz..*Service.*(..))")
	public void allPointCut() {}
		
	@After("allPointCut()")
	public void finallyLog() {
		System.out.println("[사후처리] AfterAdvice - 박서울");
	}
	
}
