package com.seoul.gatherlive.biz.common;

import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Service;

@Service
@Aspect
public class BeforeAdvice {

	@Pointcut("execution(* com.seoul.gatherlive.biz..*Service.*(..))")
	public void allPointCut() {}
		
	@After("allPointCut()")
	public void beforeLog() {
		System.out.println("[사전처리] BeforeAdvice");
	}
	
}
