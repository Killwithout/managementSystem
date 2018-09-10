package com.cjk.util.smscode;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.json.*;
import org.springframework.stereotype.Service;

/**
 * 短信验证码
 * @author admin
 *
 */
@Service
public class GetMessageCode {                 
	private static final String QUERY_PATH = "https://api.miaodiyun.com/20150822/industrySMS/sendSMS";
	private static final String ACCOUNT_SID = "a14a15c1aba54fbb9e88e77314594d25";
	private static final String AUTH_TOKEN = "5a81cde16bbc425dabffc6933bcc561d";
	
	//另外一组下发
	//6613c7b267ee4fafad1f3f18f9a693e0
	//1b049efb9e414aa0b374f0332bf1770b
	
	//根据相应的手机号发送验证码
	public static String getCode(String phone){
		String rod = smsCode();//获取了随机验证码
		String timestamp = getTimestamp();//获取时间戳
		String sig = getMD5(ACCOUNT_SID, AUTH_TOKEN, timestamp);
		//必须和短信模板内容一模一样
		String smsContent = "【学酷科技】尊敬的用户，您好，您正在使用后台管理系统，验证码为"+rod+"，请在5分钟内完成验证，若非本人操作，请忽略此短信。";
		//String smsContent = "【华燕科技】您的验证码为"+rod+"，请于5分钟内正确输入，如非本人操作，请忽略此短信。";
		OutputStreamWriter out = null;
		BufferedReader br = null;
		StringBuilder result = new StringBuilder();
		try {
			URL url = new URL(QUERY_PATH);
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			connection.setRequestMethod("POST");
			connection.setDoInput(true);//是否允许数据写入
			connection.setDoOutput(true);//是否允许数据输出
			connection.setConnectTimeout(5000);//设置连接响应时间为5秒
			connection.setReadTimeout(10000);//设置参数读取时间为10秒
			connection.setRequestProperty("Content-type","application/x-www-form-urlencoded");
			//提交请求                                                           
			out = new OutputStreamWriter(connection.getOutputStream(), "UTF-8");
			String args = getQueryArgs(ACCOUNT_SID,smsContent,phone,timestamp,sig,"JSON");
			out.write(args);
			out.flush();
			//读取返回参数
			br = new BufferedReader(new InputStreamReader(connection.getInputStream(), "UTF-8"));
			String temp = "";
			while((temp = br.readLine())!=null){
				result.append(temp);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		JSONObject json = new JSONObject(result.toString());
		String respCode = json.getString("respCode");
		String defaultRespCode = "00000";
		if(defaultRespCode.equals(respCode)){
			return rod;
		}else{
			return defaultRespCode;
		}
	}
	
	//创建验证码
	public static String smsCode(){
		String random = Math.round((Math.random()*9+1)*100000)+"";
		return random;
	}
	//获取时间戳
	public static String getTimestamp(){
		SimpleDateFormat data = new SimpleDateFormat("yyyyMMddHHmmss");
		String times = data.format(new Date());
		return times;
	}
	//签名，MD5加密
	public static String getMD5(String sid,String token,String timestamp){
		StringBuilder result = new StringBuilder();
		String source = sid+token+timestamp;
		//获取某个类的实例
		try {
			MessageDigest digest = MessageDigest.getInstance("MD5");
			//要进行加密的东西
			byte[] bytes = digest.digest(source.getBytes());
			for(byte b:bytes){
				String hex = Integer.toHexString(b&0xff);
				if(hex.length() ==1){
					result.append("0"+hex);
				}else{
					result.append(hex);
				}
			}
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return result.toString();
	}
	
	//定义1个请求参数拼接的方法
	public static String getQueryArgs(String accountSid,String smsContent,String to,String timestamp,String sig,String respDataType){
		return "accountSid="+accountSid+"&smsContent="+smsContent+"&to="+to+"&timestamp="+timestamp+"&sig="+sig+"&respDataType="+respDataType;
	}
	
}
