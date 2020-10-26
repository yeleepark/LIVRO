package com.kh.livro.common;

import org.aspectj.lang.JoinPoint;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class LogAop {
	public void beforeLog(JoinPoint join) {
		
		Logger logger = LoggerFactory.getLogger(join.getTarget() + "");
		logger.info("--------------------AOP Start--------------------");
		
		Object[] args = join.getArgs();
		if (args != null) {
			logger.info("method : " + join.getSignature().getName());
			for (int i = 0; i < args.length; i++) {
				logger.info(i + "번째 : " + args[i]);
			}
		}
	}
	
	/*
	 * getTarget() : 대상 객체 getArgs() : 대상 파라미터 getSignature() : 대상 메소드 정보
	 */

	public void afterLog(JoinPoint join) {
		Logger logger = LoggerFactory.getLogger(join.getTarget() + "");
		logger.info("--------------------AOP End--------------------");
	}

	public void afterThrowingLog(JoinPoint join) {
		Logger logger = LoggerFactory.getLogger(join.getTarget() + "");
		logger.info("--------------------AOP Error Log--------------------");
		logger.info("ERROR : " + join.getArgs());
		logger.info("Error : " + join.toString());
	}

}
