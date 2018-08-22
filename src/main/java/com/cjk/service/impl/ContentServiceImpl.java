package com.cjk.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cjk.bean.ContentInfo;
import com.cjk.dao.ContentMapper;
import com.cjk.service.ContentService;

@Service("contentService")
public class ContentServiceImpl implements ContentService{
	
	@Autowired
	private ContentMapper contentMapper;

	@Override
	public List<ContentInfo> getContentInfo(Integer current , Integer pageSize) {
		return contentMapper.getContentInfo();
	}


	@Override
	public Integer getPageSize() {
		return contentMapper.getPageSize();
	}

}
