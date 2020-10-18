package com.kh.livro.common;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class LogFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		HttpServletRequest req = (HttpServletRequest) request;
	      
	      String remoteAddr = req.getRemoteAddr(); // client의 ip주소
	      String uri = req.getRequestURI();
	      String url = req.getRequestURL().toString();
	      String queryString = req.getQueryString();
	      
	      String referer = req.getHeader("referer"); // 이전 (요청하는) 페이지 url
	      String agent = req.getHeader("User-Agent"); // 사용자 정보 (browser, os, ...)
	      
	      StringBuffer sb = new StringBuffer();
	      sb.append("* remoteAddr : " + remoteAddr + "\n")
	        .append("* uri : " + uri + "\n")
	        .append("* url : " + url + "\n")
	        .append("* queryString : " + queryString + "\n")
	        .append("* referer : " + referer + "\n")
	        .append("* agent : " + agent);
	      
	      System.out.println("LogFilter");
	      System.out.println(sb.toString());

	      chain.doFilter(request, response);

	}

}
