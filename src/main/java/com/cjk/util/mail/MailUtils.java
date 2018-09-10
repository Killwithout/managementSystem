package com.cjk.util.mail;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

/**
 * 邮件发送工具类
 * @author admin
 *
 */
public class MailUtils {
	/**
	 * 发送邮件方法
	 * @param to 发给谁
	 * @param code 激活码
	 * @throws MessagingException 
	 * @throws AddressException 
	 */
	public static void sendMail(String to,String code) throws Exception{
		//1.创建连接对象
		Properties props = new Properties();//可以用来设置主机名，发送的服务器的地址等  本地的可以省略
		props.setProperty("mail.transport.protocol", "smtp");//指定发送的邮箱的邮箱协议
		props.setProperty("mail.host", "smtp.163.com");
		props.setProperty("mail.smtp.auth","true");
		Session session = Session.getInstance(props,new Authenticator() {

			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("18153979328", "cjk1008");
			}
		});
		//2.创建邮件对象
		Message message = new MimeMessage(session);
		//设置发件人
		message.setFrom(new InternetAddress("18153979328@163.com"));
		//设置收件人
		message.setRecipient(RecipientType.TO, new InternetAddress(to));
		//设置邮件主题
		message.setSubject("来自cjk激活邮件");
		//设置邮件内容
		message.setContent("<h2>来自cjk激活邮件,您正在注册cjk网站，根据您注册的信息，激活请点击：</h2><h3><a href='http://localhost:8080/emailMessage/activation?code="+code+"'>http://localhost:8080/emailMessage/activation?code="+code+"</a></h3><p>此邮件为系统自动发送，请勿回复！祝您生活愉快，谢谢！(若无法点击，请复制该网址前往浏览器打开)</p>","text/html;charset=utf-8");
		//3.发送一封激活邮件
		Transport.send(message);
	}
	
}
