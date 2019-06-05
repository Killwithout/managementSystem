package com.cjk.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

/**
 * SpringMVC拦截器实现
 * @author DESKTOP-XIAOMI-CJK
 *
 */
public class UserInterceptor implements HandlerInterceptor{

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String userName = (String) session.getAttribute("names");
		if(userName != null) {
			session.setAttribute("names", userName);
			return true;
		}
		
		String url = request.getScheme() +"://" + request.getServerName()  
        + ":" +request.getServerPort() 
        + request.getServletPath();
		System.out.println(url);
		
		request.getRequestDispatcher("/index.jsp").forward(request, response);
		//response.sendRedirect(request.getContextPath());
		return false;
	}

	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		
	}

	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

}
