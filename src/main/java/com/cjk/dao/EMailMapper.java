package com.cjk.dao;

import com.cjk.bean.UserMail;

public interface EMailMapper {
	
	/**
	 * 用户注册
	 * @param user
	 */
	void registe(UserMail user);
	
	/**
	 * 根据激活码查询用户
	 * @param code
	 * @return
	 */
    UserMail findByCode(String code);
    
    /**
     * 更新用户激活状态
     * @param user
     */
	void update(UserMail user);
}
