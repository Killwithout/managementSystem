package com.cjk.dao;

import java.util.List;
import java.util.Map;

import com.cjk.bean.ContentInfo;

public interface ContentMapper {
	
	/**
	 * 加载内容管理列表
	 * @return
	 */
	public List<ContentInfo> getContentInfo(Integer current);
	
	/**
	 * 内容管理列表总记录数
	 * @return
	 */
	public Integer getPageSize();
	
	/**
	 * 内容管理 单个删除
	 * @param id
	 * @return
	 */
	public Integer delContent(int id);
	
	/**
	 * 内容管理  批量删除
	 * @param id_arr
	 * @return 
	 */
	public Integer delAllContent(String id);
	
	/**
	 * 内容管理  修改
	 * @param id
	 * @param type
	 * @param typeName
	 * @param content
	 * @return
	 */
	public Integer updateContent(Map<String,Object> map);
	
}
