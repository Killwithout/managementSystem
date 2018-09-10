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
 <script src="${cjk }/js/jquery-1.7.2.js"></script>
    <script src="${cjk}/js/pintuer.js"></script>  
    <script src="${cjk}/js/controller.js"></script>  
</head>
<body>
<div class="bg"></div>
<div class="container">
    <div class="line bouncein">
        <div class="xs6 xm4 xs3-move xm4-move">
            <div style="height:100px;"></div>
            <div class="media media-y margin-big-bottom">           
            </div>         
            <form method="post" id="loginForm">
            <div class="panel loginbox">
                <div class="text-center margin-big padding-big-top"><h1>后台管理中心登录</h1></div>
                <div class="panel-body" style="padding:30px; padding-bottom:18px; padding-top:10px;">
                    <div class="form-group">
                        <div class="field field-icon-right">
                            <input type="text" class="input input-big" name="loginName" id="username" placeholder="登录账号" data-validate="required:请填写账号" />
                            <span class="icon icon-user margin-small"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="field field-icon-right">
                            <input type="password" class="input input-big" name="password" id="password" placeholder="登录密码" data-validate="required:请填写密码" />
                            <span class="icon icon-key margin-small"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="field ">
                            <input type="text" class="input input-big" id="verifyCode" name="code" placeholder="填写右侧的验证码" data-validate="required:请填写右侧的验证码，不区分大小写" style="width:65%;"/>
                       		 <img id="img" src="${cjk }/sso/authImage" alt="请刷新"  class="passcode" style="height:43px;width:33%;cursor:pointer;float:left;" onclick="refreshImg()"/>
                        </div>
                    </div>
                </div>
                <div style="float:left;width:48%;padding-top:30px;padding-left:5px;">
                	<input type="button" class="button button-block bg-main text-big input-big" id="registerPage" style="background:#FF3333; border-color:#FF3333;" value="注册">
                </div>
                 <div style="float:right;width:48%;padding-top:30px;padding-right:5px;">
                	<input type="button" class="button button-block bg-main text-big input-big" id="logins" value="登录">
                </div>
            </div>
            </form>          
        </div>
    </div>
</div>
<script type="text/javascript">
/***
 * 验证码
 */
function refreshImg(){
	var timestamp = new Date().getTime();  
    var img = document.getElementById("img"); 
    img.src = "${cjk }/sso/authImage?date=" + timestamp;
}
</script>
</body>
</html>