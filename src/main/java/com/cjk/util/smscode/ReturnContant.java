package com.cjk.util.smscode;

import java.io.Serializable;

import org.springframework.stereotype.Component;

/**
 * 短信验证码  供ajax使用的封装类
 * @author admin
 *
 */
@Component
public class ReturnContant implements Serializable{
	
	private static final long serialVersionUID = 1L;
	private int status;
	private String msg;
	private Object data;
	
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Object getData() {
		return data;
	}
	public void setData(Object data) {
		this.data = data;
	}

}
