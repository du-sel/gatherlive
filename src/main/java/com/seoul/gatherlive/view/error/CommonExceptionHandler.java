package com.seoul.gatherlive.view.error;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice("com.seoul.gatherlive.view")
public class CommonExceptionHandler {

	@ExceptionHandler(Exception.class)
	public String handlerArithmeticException(Exception e, HttpSession session) {
		
		
		session.setAttribute("exception", e);
		
		return "/WEB-INF/views/error/error_default.jsp";
	}
	
}
