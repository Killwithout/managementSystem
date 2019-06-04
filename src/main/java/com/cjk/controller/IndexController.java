package com.cjk.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * IndexController 主要实现 页面跳转
 * @author admin
 */
@Controller
@RequestMapping(value = "/index" )
public class IndexController {
	
	/**
	 * 登录页面
	 */
	@RequestMapping(value = "/loginValidate" , method = RequestMethod.GET)
	public String LoginValidate(HttpServletRequest request){
		return "login";
	}
	
	/**
	 * 注册页面
	 */
	@RequestMapping(value = "/registerPage" , method = RequestMethod.GET)
	public String Register(HttpServletRequest request){
		return "registerPage";
	}
	
	/**
	 * 从注册跳回登录
	 */
	@RequestMapping(value = "backRegister" , method = RequestMethod.GET)
	public String BackRegister(HttpServletRequest request){
		return "login";
	}

	/**
	 * 登录成功后跳转到主页
	 */
	@RequestMapping(value = "/home" , method = RequestMethod.GET)
	public String IndexPage(HttpServletRequest request){
		return "index";
	}
	
	/**
	 * 主页self 动画界面
	 */
	@RequestMapping(value = "/self" , method = RequestMethod.GET)
	public String IndexPageSelf(HttpServletRequest request){
		return "self";
	}
	
	/**
	 * info 网站设置 界面 
	 */
	@RequestMapping(value = "/info" , method = RequestMethod.GET)
	public String IndexPageInfo(HttpServletRequest request){
		return "info";
	}
	
	/**
	 * pass 修改密码 界面
	 * 修改密码 可以在数据库中获取用户信息，或者从登录时保存用户信息
	 */
	@RequestMapping(value = "/pass" , method = RequestMethod.GET)
	public String IndexPagePass(HttpServletRequest request){
		String names = (String)request.getSession().getAttribute("names");
		return "pass";
	}
	
	/**
	 * mobileMessage 短信验证 界面 
	 */
	@RequestMapping(value = "/mobileMessage" , method = RequestMethod.GET)
	public String IndexPageOnepage(HttpServletRequest request){
		return "mobileMessage";
	}
	
	/**
	 * emailMessage 邮箱验证 界面 
	 */
	@RequestMapping(value = "/emailMessage" , method = RequestMethod.GET)
	public String IndexPageAdv(HttpServletRequest request){
		return "emailMessage";
	}
	
	/**
	 * QRcode 二维码 界面 
	 */
	@RequestMapping(value = "/QRcode" , method = RequestMethod.GET)
	public String IndexImgMessage(HttpServletRequest request){
		return "QRcode";
	}
	
	
	/**
	 * book 留言管理  界面 
	 */
	@RequestMapping(value = "/book" , method = RequestMethod.GET)
	public String IndexPageBook(HttpServletRequest request){
		return "book";
	}
	
	/**
	 * column 栏目管理  界面 
	 */
	@RequestMapping(value = "/column" , method = RequestMethod.GET)
	public String IndexPageColumn(HttpServletRequest request){
		return "column";
	}
	
	/**
	 * content 内容管理 界面 
	 */
	@RequestMapping(value = "/content" , method = RequestMethod.GET)
	public String IndexPageContent(HttpServletRequest request){
		return "content";
	}
	
	/**
	 * addContent 添加内容 界面 
	 */
	@RequestMapping(value = "/addContent" , method = RequestMethod.GET)
	public String IndexPageAddContent(HttpServletRequest request){
		return "addContent";
	}
	/**
	 * updateContent 修改内容 界面
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/updateContent" , method = RequestMethod.GET)
	public String IndexPageUpdateContent(int id , Model model){
		model.addAttribute("id",id);
		return "updateContent";
	}
	
	/**
	 * cate 分类管理  界面 
	 */
	@RequestMapping(value = "/cate" , method = RequestMethod.GET)
	public String IndexPageCate(HttpServletRequest request){
		return "cate";
	}
	/**
	 * 流程管理---工作流
	 * @return
	 */
	@RequestMapping(value="/activity",method = RequestMethod.GET)
	public String IndexPageActivity() {
		return "activity";
	}
}
