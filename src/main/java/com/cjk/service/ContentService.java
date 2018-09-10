package com.cjk.service;

import java.util.List;
import java.util.Map;

import com.cjk.bean.ContentInfo;

public interface ContentService {
	/**
	 * 加载内容列表
	 * @author admin
	 * @return
	 */
	public List<ContentInfo> getContentInfo(Integer current) throws Exception;
	
	/**
	 * 内容管理总页数
	 * @return
	 */
	public Integer getPageSize() throws Exception;
	/**
	 * 内容管理 单个删除
	 * @param id
	 * @return
	 */
	public Integer delContent(int id) throws Exception;	
	
	/**
	 * 内容管理 批量删除
	 * @param id_arr
	 * @return
	 */
	public Integer delAllContent(String ids) throws Exception;
	
	/**
	 * 内容管理  修改
	 * @param id
	 * @param type
	 * @param typeName
	 * @param content
	 * @return
	 * @throws Exception
	 */
	public Integer updateContent(Map<String,Object> map)throws Exception;

}
