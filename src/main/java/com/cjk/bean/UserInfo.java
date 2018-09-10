package com.cjk.bean;

import java.io.Serializable;
import java.util.Date;
/**
 * 用户实体
 * @author admin
 *
 */
public class UserInfo implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 8129226734625159038L;

	private Integer id;

    private String userName;

    private String password;

    private String email;

    private String phonenumber;

    private Byte status;

    private Date createTime;

    private String createTimeIp;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getPhonenumber() {
        return phonenumber;
    }

    public void setPhonenumber(String phonenumber) {
        this.phonenumber = phonenumber == null ? null : phonenumber.trim();
    }

    public Byte getStatus() {
        return status;
    }

    public void setStatus(Byte status) {
        this.status = status;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getCreateTimeIp() {
        return createTimeIp;
    }

    public void setCreateTimeIp(String createTimeIp) {
        this.createTimeIp = createTimeIp == null ? null : createTimeIp.trim();
    }


}