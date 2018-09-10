package com.cjk.service.impl;

import java.util.List;
import java.util.Map;

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
	public List<ContentInfo> getContentInfo(Integer current) {
		current = (current -1)*10;
		return contentMapper.getContentInfo(current);
	}

	@Override
	public Integer getPageSize() {
		return contentMapper.getPageSize();
	}

	@Override
	public Integer delContent(int id) {
		return contentMapper.delContent(id);
	}

	@Override
	public Integer delAllContent(String id) {
		return contentMapper.delAllContent(id);
	}

	@Override
	public Integer updateContent(Map<String,Object> map) throws Exception {
		return contentMapper.updateContent(map);
	}
}
