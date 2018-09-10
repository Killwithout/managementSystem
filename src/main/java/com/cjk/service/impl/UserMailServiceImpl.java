package com.cjk.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cjk.bean.UserMail;
import com.cjk.dao.EMailMapper;
import com.cjk.service.UserMailService;
import com.cjk.util.mail.MailUtils;

@Service
public class UserMailServiceImpl implements UserMailService{
	
	@Autowired
	private EMailMapper userMailMapper;

	@Override
	public void registe(UserMail user) throws Exception {
		//将数据存入数据库
		userMailMapper.registe(user);
		//发送一封激活的邮件
		MailUtils.sendMail(user.getEmail(), user.getCode());
	}

	@Override
	public UserMail findByCode(String code) throws Exception {
		return userMailMapper.findByCode(code);
	}

	@Override
	public void update(UserMail user) throws Exception {
		userMailMapper.update(user);
	}
}
