package com.cjk.service;

import java.util.List;

import com.cjk.bean.ContentInfo;

public interface ContentService {
	/**
	 * 加载内容列表
	 * @author admin
	 * @return
	 */
	public List<ContentInfo> getContentInfo(Integer current , Integer pageSize);
	
	/**
	 * 内容管理总页数
	 */
	public Integer getPageSize();
}
