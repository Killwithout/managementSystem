package com.cjk.util;

public class DemoCode {

	public final static String REQUEST_SUCCESS = "200"; //成功

	public final static String REQUEST_UNNAMEPASS = "-200";//用户名或密码错误
	
	public final static String REQUEST_UNUSERNAME = "-201";//用户名错误
	
	public final static String REQUEST_UNUSERPASS = "-202";//密码错误
	
	public final static String REQUEST_VERCODE = "-203";//验证码错误
	
	public final static String REQUEST_FAIL = "-101";//交易失败编码
	
	public final static String REQUEST_SYSTEM_EXCEPTION = "1000";//系统异常
	
	public final static String REQUEST_PASSEXCEPTION = "-001"; //密码前后不一致

	public final static String REQUEST_OLDPASSEXCEPTION = "-002";//原始密码不正确
	
	public final static String REQUEST_PASSFAIL = "-003";//修改密码失败
	
	
}
