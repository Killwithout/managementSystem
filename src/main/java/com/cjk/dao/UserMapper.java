package com.cjk.dao;

import com.cjk.bean.UserInfo;

/**
 * dao 数据访问层
 * @author admin
 */

public interface UserMapper {
	
	/**
	 * 用户注册
	 * @param userInfo
	 * @return
	 */

	public int getInsertUserInfo(UserInfo userInfo);
	
	/**
	 * 用户登录
	 * @param userInfo
	 * @return
	 */
	public UserInfo getUserInfoBylogin(UserInfo userInfo);
	
	/**
	 * 修改密码前确认原始密码
	 * @param userInfo
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
	

	
	
	
	
	
	
    int deleteByPrimaryKey(Integer id);

    int insertSelective(UserInfo record);

    UserInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(UserInfo record);

    int updateByPrimaryKey(UserInfo record);
    
    /**
     * 查询用户名,密码
     */
    UserInfo selectByNamePass(String userName,String password);
    
    
    
}