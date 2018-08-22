package com.cjk.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
/**
 * IndexController 主要实现 页面跳转
 * @author admin
 *
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
	 * onePage 单页管理 界面 
	 */
	@RequestMapping(value = "/onePage" , method = RequestMethod.GET)
	public String IndexPageOnepage(HttpServletRequest request){
		return "onePage";
	}
	
	/**
	 * adv 首页轮播 界面 
	 */
	@RequestMapping(value = "/adv" , method = RequestMethod.GET)
	public String IndexPageAdv(HttpServletRequest request){
		return "adv";
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
	 * cate 分类管理  界面 
	 */
	@RequestMapping(value = "/cate" , method = RequestMethod.GET)
	public String IndexPageCate(HttpServletRequest request){
		return "cate";
	}
}
