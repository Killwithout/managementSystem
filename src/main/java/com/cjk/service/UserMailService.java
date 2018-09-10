package com.cjk.service;

import com.cjk.bean.UserMail;

public interface UserMailService {
	/**
	 * 用户注册
	 * @param user
	 * @throws Exception
	 */
	public void registe(UserMail user) throws Exception;
	
	/**
	 * 根据激活码来查询用户
	 * @param code
	 * @return
	 * @throws Exception
	 */
	public UserMail findByCode(String code)throws Exception;
	/**
	 * 激活后更新状态码
	 * @param user
	 */
	public void update(UserMail user)throws Exception;
}
