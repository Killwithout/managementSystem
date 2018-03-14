package com.cjk.test;

import com.cjk.util.MD5Util;

public class MD5Test {
	public static void main(String[] args){
		String md51 = MD5Util.MD5("123456");
			System.out.println("大写："+md51);
		String md52 = MD5Util.getMd5("123456");
			System.out.println("小写："+md52);
	}
}
