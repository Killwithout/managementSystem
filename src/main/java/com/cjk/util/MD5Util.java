package com.cjk.util;

import java.math.BigInteger;
import java.security.MessageDigest;

/**
 * 工具类md5
 * @author admin
 */
public class MD5Util {
	/**
	 * 方法一：小写字母
	 * @param str
	 * @return
	 */
	public static String getMd5(String str){
		try {
			//生成一个MD5加密计算摘要
			MessageDigest md5 = MessageDigest.getInstance("Md5");
			//计算md5函数
			md5.update(str.getBytes());
			//digest()最后确定返回md5 hash值，返回值为8位 的字符串。因为MD5 hash值是16位的hex值，实际上就是8位的字符
			//BigInteger 函数则将8位的字符串转换成16位hex值，用字符串来表示；得到字符串形式的hash值
			return new BigInteger(1,md5.digest()).toString(16);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 方法二：大写字母
	 */
	public static String MD5(String str){
		char hexDigits[] = {'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'};
		try {
			byte[] btInput = str.getBytes();
			//获得md5摘要算法的MessageDigest对象
			MessageDigest mdInst = MessageDigest.getInstance("MD5");
			//使用指定的字节更新摘要
			mdInst.update(btInput);
			//获得密文
			byte[] md5 = mdInst.digest();
			//把密文转换成十六进制的字符串形式
			int num = md5.length;
			char strs[] = new char[num * 2];
			int k = 0;
			for(int i = 0 ; i < num ; i++){
				byte byte0 = md5[i];
				strs[k++] = hexDigits[byte0 >>> 4 & 0xf];
				strs[k++] = hexDigits[byte0 & 0xf];
			}
			return new String (strs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
