<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="t"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cjk" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>后台管理系统</title>
    <meta name="keywords" content="后台管理系统" />
    <meta name="description" content="" /> 
    <link rel="stylesheet" href="${cjk}/css/pintuer.css">
    <link rel="stylesheet" href="${cjk}/css/admin.css">
 <script src="${cjk }/js/jquery-1.7.2.js"></script>
<title>Insert title here</title>
</head>
<body style="background-color:#f2f9fd;">
<div class="header bg-main">
  <div class="logo margin-big-left fadein-top">
    <h1><img src="${cjk}/images/y.jpg" class="radius-circle rotate-hover" height="50" alt="点击上传头像" />后台管理中心</h1>
  </div>
	<div class="head-l">
	  	<a class="button button-little bg-green" href="" target="_blank">
	  		<span class="icon-home"></span> 
	  		前台首页
	  	</a>
	  	&nbsp;&nbsp;
	  	<a href="#" class="button button-little bg-blue">
	  		<span class="icon-wrench"></span> 
	  		清除缓存
	  	</a> 
	  	&nbsp;&nbsp;
	  	<a class="button button-little bg-red" href="../index/loginValidate">
	  		<span class="icon-power-off"></span> 
	  		退出登录
		</a> 
	</div>
  <!-- 欢迎 ***登录 -->
  <div class="head-p" style="background:url(${cjk}/images/userbg.png) no-repeat;width:200px;height:30px;line-height:30px;vertical-align:middle;text-align:center;">
  	<span style="float:left;display:inline-block;padding-right:10px;background:url(${cjk}/images/user.png) no-repeat 15px 10px;line-height:30px;font-size:14px;color:#b8ceda;padding-left:20px;padding-left:35px;">
  	欢迎  <span style="color:#fec;"><%=request.getSession().getAttribute("names") %></span>
  	<i style="margin-right:5px;font-style:normal;line-height:30px;font-size:14px;color:#b8ceda;">
	  	消息
	  	<b style="padding-left:5px;padding-right:5px;width:20px;height:18px;background:url(${cjk}/images/msg.png);text-align:center;font-weight:normal;color:#fff;font-size:14px;margin-right:13px;line-height:18px;">
	     3
	    </b>
	  	</i>
  	</span>
	  	
  </div>
  
</div>
<div class="leftnav">
  <div class="leftnav-title"><strong><span class="icon-list"></span>菜单列表</strong></div>
  <h2><span class="icon-user"></span>基本设置</h2>
  <ul style="display:block">
    <li><a href="pass" target="right"><span class="icon-caret-right"></span>修改密码</a></li>
    <li><a href="content" target="right"><span class="icon-caret-right"></span>内容管理</a></li><!-- list.jsp -->
    <li><a href="mobileMessage" target="right"><span class="icon-caret-right"></span>短信验证</a></li>  
    <li><a href="emailMessage" target="right"><span class="icon-caret-right"></span>邮箱验证</a></li>  
    <li><a href="QRcode" target="right"><span class="icon-caret-right"></span>二维码</a></li>  
    <li><a href="book" target="right"><span class="icon-caret-right"></span>留言管理</a></li>     
    <li><a href="column" target="right"><span class="icon-caret-right"></span>栏目管理</a></li>
  </ul>   
  <h2><span class="icon-pencil-square-o"></span>流程管理</h2>
  <ul>
    <li><a href="activity" target="right"><span class="icon-caret-right"></span>工作流</a></li>
  </ul>  
  <h2><span class="icon-pencil-square-o"></span>栏目管理</h2>
  <ul>
    
    <li><a href="addContent" target="right"><span class="icon-caret-right"></span>添加内容</a></li><!-- add.jsp -->
    <li><a href="cate" target="right"><span class="icon-caret-right"></span>分类管理</a></li>        
    <li><a href="info" target="right"><span class="icon-caret-right"></span>网站设置</a></li>
  </ul>  
  <h2><span class="icon-pencil-square-o"></span>权限控制</h2>
  <ul>
    <li><a href="content" target="right"><span class="icon-caret-right"></span>权限管理</a></li><!-- list.jsp -->
    <li><a href="addContent" target="right"><span class="icon-caret-right"></span>操作权限</a></li><!-- add.jsp -->
    <li><a href="cate" target="right"><span class="icon-caret-right"></span>浏览权限</a></li>        
  </ul>  
  
</div>
<script type="text/javascript">
$(function(){
  $(".leftnav h2").click(function(){
	  $(this).next().slideToggle(200);	
	  $(this).toggleClass("on"); 
  })
  $(".leftnav ul li a").click(function(){
	    $("#a_leader_txt").text($(this).text());
  		$(".leftnav ul li a").removeClass("on");
		$(this).addClass("on");
  })
});
</script>
<ul class="bread">
  <li><a href="{:U('Index/info')}" target="right" class="icon-home"> 首页</a></li>
  <li><a href="##" id="a_leader_txt">网站信息</a></li>
  <li><b>当前语言：</b><span style="color:red;">中文</php></span>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;切换语言：<a href="##">中文</a> &nbsp;&nbsp;<a href="##">英文</a> 
</li>

</ul>
<div class="admin">
  <iframe scrolling="auto" rameborder="0" src="self" name="right" width="100%" height="100%"></iframe>
</div>
</body>
</html>