package com.cjk.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cjk.bean.UserInfo;
import com.cjk.dao.UserMapper;
import com.cjk.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserMapper userMapper;
	
	/**
	 * 注册
	 * @author admin
	 * @return
	 */
	@Override
	public int getInsertUserInfo(UserInfo userInfo) {
		
		return userMapper.getInsertUserInfo(userInfo);
	
	}
	
	/**
	 * 登录
	 * @author admin
	 * @return
	 */
	@Override
	public UserInfo getUserInfoBylogin(UserInfo userInfo) {

		return userMapper.getUserInfoBylogin(userInfo);
	
	}
	
	/**
	 * 修改密码前确认原始密码
	 * @author admin
	 * @return
	 */
	@Override
	public UserInfo getCheckOldPass(UserInfo userInfo) {

		return userMapper.getCheckOldPass(userInfo);
		
	}

	/**
	 * 修改密码
	 * @author admin
	 * @return
	 */
	@Override
	public int getChangePass(UserInfo userInfo) {
		
		return userMapper.getChangePass(userInfo);
		
	}

	
	

}
