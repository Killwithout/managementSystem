<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<!-- <meta http-equiv="Content-Type" content="text/html; charset=utf-8"> -->
<title>请求结果</title>
</head>
<script type="text/javascript">
var t=5;//设定跳转的时间
setInterval("refer()",1000); //启动1秒定时
function refer(){
	if(t==0){
		location="http://localhost:8080"; //#设定跳转的链接地址
	}
	 document.getElementById('show').innerHTML=""+t+"秒后自动跳转"; // 显示倒计时
	 t--; // 计数器递减
 }
 </script>
<body>
<br><br><br><br>
<center>
	<c:if test="${msg == 1}">
		<h2>恭喜您注册成功</h2>
		邮件已下发至您注册的邮箱，在您使用该账号之前，请先到您的邮箱中激活该账号！
	</c:if>
	<c:if test="${msg == 2}">
		<h2>注册失败</h2>
		请重新注册
	</c:if>
	<c:if test="${msg == 3}">
		<h2>恭喜您激活成功</h2>
		现在您可以正常使用该账号进行登录操作！<span id="show"></span>
	</c:if>
	<c:if test="${msg == 4}">
		<h2>Sorry,激活失败</h2>
		您的激活码不正确，请重新激活
	</c:if>
	<c:if test="${msg == 5}">
		<h2>激活码异常</h2>
		您的激活码为空或您已激活成功！请勿重复访问！
	</c:if>
</center>
</body>
</html>