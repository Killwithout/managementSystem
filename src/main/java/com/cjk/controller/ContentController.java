package com.cjk.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.cjk.bean.ContentInfo;
import com.cjk.service.ContentService;
import com.cjk.util.DemoCode;

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
	public List<ContentInfo> contentIndex(@RequestParam(value="current") Integer current){
		List<ContentInfo> list = new ArrayList<ContentInfo>();
		try{
			list = contentService.getContentInfo(current);			
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
	
	/**
	 * 内容管理 删除单个
	 * @return
	 */
	@RequestMapping("/deleteContent")
	@ResponseBody
	public String deleteContent(int id){
		//System.out.println("------controller单个删除------"+id);
		try {
			contentService.delContent(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return DemoCode.REQUEST_SUCCESS;
	}
	
	/**
	 * 内容管理 批量删除
	 */
	@RequestMapping("/delAllContent")
	@ResponseBody
	public String delAllContent(String ids){
		String temp[] = ids.split(",");
		try {
			for(int i=1;i<temp.length;i++){
				contentService.delAllContent(temp[i]);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return DemoCode.REQUEST_SUCCESS;
	}
	/**
	 * 修改 内容管理
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/updateContent")
	public String updateContent(HttpServletRequest request){
		Map<String,Object> map = new HashMap<String, Object>();		
		map.put("id", Integer.parseInt(request.getParameter("id")));
		map.put("type", request.getParameter("type"));
		map.put("typeName", request.getParameter("typeName"));
		map.put("content", request.getParameter("content"));
		map.put("imgPath", request.getParameter("cjk_path2"));
		//获取系统当前时间
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = df.format(new Date());
		map.put("time",time);
		try {
			contentService.updateContent(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "content";
	}
	
	/**
	 * 利用springMVC上传图片
	 * @throws IOException 
	 * @throws IllegalStateException 
	 */
	
	@RequestMapping("/upload")
	@ResponseBody
	public Map<String, Object> uploadFile(HttpServletRequest request) throws IllegalStateException, IOException{
		//定义返回的map
		Map<String , Object> map = new HashMap<String, Object>();
		//将当前上下文初始化给 CommonsMultipartResolver
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());
		String path="";
		//检查form中是否有enctype="multipart/form-data"
		if(multipartResolver.isMultipart(request)){
			//将request变成多部分request
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
			//获取MultiRequest中所有的文件名
			Iterator iter = multiRequest.getFileNames();
			//遍历
			while(iter.hasNext()){
				//一次遍历所有文件
				MultipartFile file = multiRequest.getFile(iter.next().toString());
				if(file != null){
					String oldName = file.getOriginalFilename();
					//获取系统当前时间
					SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					String time = df.format(new Date());
					//将获取到的横杠和空格去掉
					String newName = time.replaceAll("[[\\s-:punct:]]","");
					//获取上传文件的后缀名
					String bottoms = oldName.substring(oldName.lastIndexOf(".") + 1);
					path = "F:/study/images/"+newName+"."+bottoms;
					//上传
					file.transferTo(new File(path));
				}
			}
		}
		map.put("state", "1");
		map.put("path", path);
		return map;
	}
	
	
	
	
}





















