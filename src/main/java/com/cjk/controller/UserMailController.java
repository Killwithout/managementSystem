package com.cjk.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tiles.autotag.core.runtime.annotation.Parameter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cjk.bean.UserMail;
import com.cjk.service.UserMailService;
import com.cjk.util.mail.UUIDUtils;

@Controller
@RequestMapping("/emailMessage")
public class UserMailController {
	
	@Autowired
	private UserMailService userMailService;
	
	@RequestMapping("/email")
	public ModelAndView email(HttpServletRequest request, HttpServletResponse response){
		ModelAndView model = new ModelAndView("emailSendSuccess");
		
		String userName = request.getParameter("username");
		String password = request.getParameter("password");
		String nickName = request.getParameter("nickname");
		String email = request.getParameter("email");
		
		UserMail user = new UserMail();
		user.setUserName(userName);
		user.setPassword(password);
		user.setNickName(nickName);
		user.setEmail(email);
		user.setState(0);//0：表示未激活  1：表示已激活
		String uuid = UUIDUtils.getUUID();//32位
		user.setCode(uuid);
		try {
			userMailService.registe(user);
			model.addObject("msg","1");//注册成功
		} catch (Exception e) {
			e.printStackTrace();
			model.addObject("msg","2");//注册失败
		}
		return model;
	}
	
	/**
	 * 激活
	 * @param request
	 * @param response
	 * @param code
	 * @return
	 */
	@RequestMapping("/activation")
	public ModelAndView jihuo(HttpServletRequest request,HttpServletResponse response,@RequestParam String code){
		ModelAndView model = new ModelAndView("emailSendSuccess");
		if(code != null){
			//根据激活码查询用户
			try {
				UserMail user = userMailService.findByCode(code);
				if(user != null){
					//已经查询到了，修改用户状态
					user.setState(1);//1：表示已激活
					user.setCode(null);
					userMailService.update(user);
					model.addObject("msg","3");//激活成功
				}else{
					model.addObject("msg","4");//激活失败
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else{
			model.addObject("msg","5");
		}
		return model;
	}
}
