package com.cjk.service;

import com.cjk.bean.UserInfo;

public interface UserService {
	
	/**
	 * 注册信息
	 * @author admin
	 * @return
	 */
	public int getInsertUserInfo(UserInfo userInfo);
	
	 /**
	  * 登录
	  * @author admin
	  * @return
	  */
	
	public UserInfo getUserInfoBylogin(UserInfo userInfo);
	
	/**
	 * 修改密码前确认旧密码是否正确
	 * @param oldPass
	 * @return
	 */
	public UserInfo getCheckOldPass(UserInfo userInfo);
	
	/**
	 * 修改密码
	 * @param names
	 * @param oldPass
	 * @param newPass
	 * @return
	 */
	
	public int getChangePass(UserInfo userInfo);
	


}
