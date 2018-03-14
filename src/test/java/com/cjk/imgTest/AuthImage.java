package com.cjk.imgTest;

import java.io.IOException;

import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AuthImage extends HttpServlet implements Servlet{
	

	static final long serialVersionUID = 1L; 
	   
    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
       
    	//禁止图像缓存
    	response.setHeader("Pragma", "No-cache"); 
        response.setHeader("Cache-Control", "no-cache"); 
        response.setDateHeader("Expires", 0); 
       
        //设置输出流格式为图片的格式
        response.setContentType("image/jpeg"); 
           
        //生成随机字串 
        String verifyCode = VerifyCodeUtils.generateVerifyCode(4); 
        //存入会话session 
        HttpSession session = request.getSession(true); 
        //删除以前的
        session.removeAttribute("verCode");
        session.setAttribute("verCode", verifyCode.toLowerCase()); 
        //生成图片 并设置图片的大小
        int w = 100, h = 32; 
        VerifyCodeUtils.outputImage(w, h, response.getOutputStream(), verifyCode); 
    }
    /**
     * 
       //0.创建空白图片
        BufferedImage image = new BufferedImage(100,30,BufferedImage.TYPE_INT_RGB);
        //1.获取图片画笔
        Graphics g = image.getGraphics();
        Random r = new Random();
        //2.设置画笔颜色
        g.setColor(new Color(r.nextInt(255), r.nextInt(255), r.nextInt(255)));
        //3.绘制矩形的背景
        g.fillRect(0, 0, 100, 30);   
        //4.调用自定义的方法，获取长度为5的字母数字组合的字符串
        String number = getNumber(5);   
        //将图片字符存入session,用于验证码检查使用
        session.setAttribute("scode", number);
        g.setColor(new Color(0,0,0));
        g.setFont(new Font(null,Font.BOLD,24));
        //5.设置颜色字体后，绘制字符串
        g.drawString(number, 5, 25);
        //6.绘制8条干扰线
        for(int i=0;i<8;i++){
            g.setColor(new Color(r.nextInt(255),r.nextInt(255),r.nextInt(255),r.nextInt(255)));
            g.drawLine(r.nextInt(100), r.nextInt(30), r.nextInt(100), r.nextInt(30));
        }
     * 
     * 
     */
}
