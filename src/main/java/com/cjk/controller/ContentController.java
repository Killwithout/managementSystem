package com.cjk.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.cjk.bean.ContentInfo;
import com.cjk.service.ContentService;

@Controller
@RequestMapping("/content")
public class ContentController {
	
	@Autowired
	private ContentService contentService;
	
	/**
	 * 加载内容管理列表
	 */
	@RequestMapping(value = "/contentList" ,  method = RequestMethod.POST )
	@ResponseBody
	public List<ContentInfo> contentIndex(@RequestBody JSONObject requestObj ){
		List<ContentInfo> list = new ArrayList<>();
		System.out.println("--------req="+requestObj+"----------------------");
		try{
			//Integer pageCount = contentService.getPageSize();//总页数
			list = contentService.getContentInfo(2 , 10);			
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}
	
	/**
	 * 内容管理总记录数
	 */
	@RequestMapping(value = "/pageSize" , method = RequestMethod.POST)
	@ResponseBody
	public Integer getPageSize(){
		Integer pageSize = 10;
		try {
			pageSize = contentService.getPageSize();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pageSize;
	}
}
