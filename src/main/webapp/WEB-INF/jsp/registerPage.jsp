<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="t"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cjk" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%-- <%
	String Path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getRemotePort()+Path+"/";
%> 
--%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
<%--     <base href="<%=basePath %>"> --%>
    <title>登录</title>  
    <link rel="stylesheet" href="${cjk}/css/pintuer.css">
    <link rel="stylesheet" href="${cjk}/css/admin.css">
    <script src="${cjk}/js/jquery.js"></script>
    <script src="${cjk}/js/pintuer.js"></script>  
    <script src="${cjk}/js/controller.js"></script>  
</head>
<body>
<div class="bg"></div>
<div class="container">
    <div class="line bouncein">
        <div class="xs6 xm4 xs3-move xm4-move">
            <div style="height:0px;"></div>
            <div class="media media-y margin-big-bottom">           
            </div>         
            <form method="post" id="cjk_register">
            <div class="panel loginbox">
                <div class="text-center margin-big padding-big-top"><h1>后台管理中心注册</h1></div>
                <div class="panel-body" style="padding:30px; padding-bottom:18px; padding-top:0px;" id="panel">
                    <div class="form-group">
                        <div class="field field-icon-right">
                            <input type="text" class="input input-big" name="name" id="userName" placeholder="登录账号/用户名（实名制注册）" data-validate="required:请填写账号" />
                            <span class="icon icon-user margin-small"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="field field-icon-right">
                            <span class="icon icon-key margin-small"></span>
                            <input type="password" class="input input-big" name="userPass" id="userPass" placeholder="密码为8-16位，区分大小写" data-validate="required:请填写密码" />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="field field-icon-right">
                            <input type="password" class="input input-big" name="passwords" id="passwords" placeholder="确认密码" data-validate="required:请填写确认密码" />
                            <span class="icon icon-key margin-small"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="field field-icon-right">
                            <input type="email" class="input input-big" name="email" id="email" placeholder="邮箱账号（xxx@xxx.com）" data-validate="required:请填写确认密码" />
                            <span class="icon icon-envelope-o margin-small"></span>
                        </div>
                    </div>
                       <div class="form-group">
                        <div class="field field-icon-right">
                            <input type="number" class="input input-big" name="phone" id="phone" placeholder="手机号码(11位有效电话号码)" data-validate="required:请填写手机号码"  />
                            <span class="icon icon-phone margin-small"></span>
                        </div>
                    </div>
                </div>
                	<span style="padding-bottom:20px;padding-right:60px;float:right;color:red;"><a href=loginValidate>已有账号？返回<span style="color:blue;">登录</span></a></span>
                 <div style="padding:0px;">
                	<input type="button" class="button button-block bg-main text-big input-big" id="register" value="提交">
                </div>
            </div>
            </form>          
        </div>
    </div>
</div>

</body>
</html>