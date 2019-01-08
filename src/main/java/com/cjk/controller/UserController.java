package com.cjk.controller;

import java.io.IOException;
import java.net.InetAddress;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.jms.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cjk.bean.UserInfo;
import com.cjk.service.UserService;
import com.cjk.util.DemoCode;
import com.cjk.util.MD5Util;
import com.cjk.util.VerificationCode;

/**
 * 用户  登录  注册  验证码  请求的处理
 * @author admin
 */
@Controller
@RequestMapping(value = "/sso")
public class UserController {
	
	private ObjectMapper jsonMapper = new ObjectMapper();
	
	@Resource
	private UserService userService;
	
	/**
	 * 注册
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/register" , method = RequestMethod.POST , produces = "application/json; charset=utf-8")
	@ResponseBody
	public String Register(HttpServletRequest request , HttpServletResponse response) throws Exception{

		Map<String , String > resultMap = new HashMap<String , String>();
		try{
			//获取到前台提交过来的注册信息
			String userName = request.getParameter("name");
			String userPass = request.getParameter("userPass");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
	
			//创建一个当前时间,也就是注册时间
			Date date = new Date();
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String str = dateFormat.format(date);
			try{
				date = dateFormat.parse(str);
			}catch(ParseException e){
				e.printStackTrace();  
			}
			
			//获取本机ip
			InetAddress address = InetAddress.getLocalHost();
			String IP = address.getHostAddress();
			
			//在写入数据库之前判断这几个值是否为空
			if(StringUtils.isNotBlank(userName) && StringUtils.isNotBlank(userPass) 
			   && StringUtils.isNotBlank(phone) && StringUtils.isNotBlank(IP) && StringUtils.isNotBlank(str)){
				//将获取到的值添加进maps写入数据库
				UserInfo userInfo = new UserInfo();
				userInfo.setUserName(userName);
				userInfo.setPassword(MD5Util.getMd5(userPass));
				userInfo.setEmail(email);
				userInfo.setPhonenumber(phone);
				userInfo.setCreateTime(date);
				userInfo.setCreateTimeIp(IP);
				userInfo.setStatus((byte) 1);
				
				int yeah = userService.getInsertUserInfo(userInfo);
				if(yeah == 1){
					resultMap.put("code", DemoCode.REQUEST_SUCCESS);
					resultMap.put("result", "用户注册成功");
				}
				
			}else{
				resultMap.put("code", DemoCode.REQUEST_FAIL);
				resultMap.put("result", "传入参数错误");
			}
		}catch(Exception e){
			e.printStackTrace();
			resultMap.put("code", DemoCode.REQUEST_SYSTEM_EXCEPTION);
			resultMap.put("result", "系统异常，请稍后重试！");
		}
		
		return jsonMapper.writeValueAsString(resultMap);
		
	}
	
	/**
	 * 登录请求处理
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/login" , method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public String Login(HttpServletRequest request , HttpServletResponse response) throws Exception{
		Map<String , Object > resultMap = new HashMap<String , Object>();
		try{
			String names = request.getParameter("loginName");
			String userPass = request.getParameter("password");

			//验证账号不能为空
			if(StringUtils.isBlank(names)){
				resultMap.put("code", DemoCode.REQUEST_UNUSERNAME);
				resultMap.put("result", "登录账号不能为空");
				//利用ObjectMapper 的  writeValueAsString 将对象转化成json字符串
				return jsonMapper.writeValueAsString(resultMap);
			}
			
			// 验证密码不能为空
			if(StringUtils.isBlank(userPass)){
				resultMap.put("code",DemoCode.REQUEST_UNUSERPASS);
				resultMap.put("result", "登录密码不能为空");
				return jsonMapper.writeValueAsString(resultMap);
			}
			//验证码
			//账号密码不能为空验证之后，我们就要看验证码，验证码存储在session中我们只是将输入的验证码和session中的验证码做对比验证即可
			String inVerCode = request.getParameter("code");
//				System.out.println("-----输入的验证码-----为:"+inputVerifyCode);
			HttpSession session = request.getSession();
			String verCode = (String) session.getAttribute("verCode");
			session.setAttribute("names", names);
//				System.out.println("session中存储的验证码值:"+verCode);
				
			if(!(inVerCode != null  && (inVerCode.toLowerCase().equals(verCode) || inVerCode.toUpperCase().equals(verCode) ))){
				resultMap.put("code",DemoCode.REQUEST_VERCODE);
				resultMap.put("result", "验证码错误");
				return jsonMapper.writeValueAsString(resultMap);
			}
			
			//将用户名和密码与数据库中的用户名、密码作对比来验证
			String passwords = MD5Util.getMd5(userPass);//将密码转换成密文进行对比校验
			
			UserInfo userInfo = new UserInfo();
			userInfo.setUserName(names);
			userInfo.setPassword(passwords);
			
			userInfo = userService.getUserInfoBylogin(userInfo);
			
			if(null == userInfo){
				resultMap.put("code", DemoCode.REQUEST_UNNAMEPASS);
				resultMap.put("result", "用户名或密码错误");
				return jsonMapper.writeValueAsString(resultMap);
			}
			
			resultMap.put("code", DemoCode.REQUEST_SUCCESS);
			resultMap.put("result", "登录成功");
			return jsonMapper.writeValueAsString(resultMap);
			
		}catch (Exception e) {
			e.printStackTrace();
			resultMap.put("code", DemoCode.REQUEST_SYSTEM_EXCEPTION);
			resultMap.put("result", "系统异常，请稍后重试！");
			return jsonMapper.writeValueAsString(resultMap);
		}
	}
	/**
	 * 登录验证码
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value = "/authImage")
	@ResponseBody
	public void getVerifyCode(HttpServletRequest request , HttpServletResponse response) throws IOException{
		//禁止图像缓存
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-control" , "no-cache");
		response.setDateHeader("Expires" , 0);
		
		//设置输出流的格式为图片的格式
		response.setContentType("image/jpeg");
		
		//生成随机字符串
		String verifyCode = VerificationCode.generateVerifyCode(4);
		//存入会话session	
		HttpSession session = request.getSession();
		//删除以前的
		session.removeAttribute("verCode");
		session.setAttribute("verCode", verifyCode);
		//System.out.println(session.getAttribute(verifyCode)+"------------------------------------");
		//生成图片并设置图片大小
		int w = 115 , h = 43;
		VerificationCode.outputImage(w, h, response.getOutputStream(), verifyCode);
	}
	
	/**
	 * 修改密码
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/changePass" ,  method = RequestMethod.POST , produces = "application/json; charset=utf-8")
	@ResponseBody
	public String changePass(HttpServletRequest request , HttpServletResponse response) throws Exception{
		Map<String , Object> resultMap = new HashMap<String , Object>();
		//获取当前登录的用户名
		String names = (String)request.getSession().getAttribute("names");
		//获取原始密码和新密码
		String oldPass = request.getParameter("mpass");
		String newPass = request.getParameter("newpass");
		String renewPass = request.getParameter("renewpass");
		
		if(!(newPass != renewPass && newPass.equals(renewPass))){
			resultMap.put("code", DemoCode.REQUEST_PASSEXCEPTION);
			resultMap.put("result", "密码前后不一致");
			return jsonMapper.writeValueAsString(resultMap);
		}
		//将原始密码和新密码加密
		oldPass = MD5Util.getMd5(oldPass);
		newPass = MD5Util.getMd5(newPass);
		
		//将原始密码先进行查询对比
		UserInfo userInfo = new UserInfo();
		userInfo.setUserName(names);
		userInfo.setPassword(oldPass);
		
		userInfo = userService.getCheckOldPass(userInfo);
		
		if(null == userInfo){
			resultMap.put("code", DemoCode.REQUEST_OLDPASSEXCEPTION);
			resultMap.put("result", "原始密码不正确");
			return jsonMapper.writeValueAsString(resultMap);
		}
		
		
		if(StringUtils.isNotBlank(newPass) && StringUtils.isNotBlank(renewPass)){
			userInfo.setUserName(names);
			userInfo.setPassword(newPass);
			int yeahs = userService.getChangePass(userInfo);
			if(yeahs == 1){
				resultMap.put("code", DemoCode.REQUEST_SUCCESS);
				resultMap.put("result", "修改密码成功");
				return jsonMapper.writeValueAsString(resultMap);
			}
		}
		
		resultMap.put("code", DemoCode.REQUEST_PASSFAIL);
		resultMap.put("result", "密码修改失败");
		return jsonMapper.writeValueAsString(resultMap);
	}
	
	/**
	 * session 过期 ， 跳转到登录界面
	 * @param request
	 * @param response
	 * @return
	 */
	public String reLogin(HttpServletRequest request , HttpServletResponse response){
		String names = (String)request.getSession().getAttribute("names");
		if(null == names){
			return "loginValidate";
		}
		return null;
	}
	

}
