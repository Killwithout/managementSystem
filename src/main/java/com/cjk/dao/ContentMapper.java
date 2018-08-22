package com.cjk.dao;

import java.util.List;

import com.cjk.bean.ContentInfo;

public interface ContentMapper {
	
	/**
	 * 加载内容管理列表
	 * @return
	 */
	public List<ContentInfo> getContentInfo();
	
	/**
	 * 内容管理列表总记录数
	 * @return
	 */
	public Integer getPageSize();
}
