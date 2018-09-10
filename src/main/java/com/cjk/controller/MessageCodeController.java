package com.cjk.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cjk.util.smscode.GetMessageCode;
import com.cjk.util.smscode.ReturnContant;

/**
 * 短信验证码
 * @author admin
 */
@Controller
@RequestMapping("/code")
public class MessageCodeController {
	
	@Resource
	private ReturnContant returnContant;
	
	@RequestMapping(value = "/sendSMS",method=RequestMethod.POST)
	@ResponseBody
	public ReturnContant sendSMS(HttpServletRequest request,String phone){
		//根据获取到的手机号发送验证码
		String code = GetMessageCode.getCode(phone);
		returnContant.setStatus(1);
		returnContant.setData(code);
		return returnContant;
	}
}
