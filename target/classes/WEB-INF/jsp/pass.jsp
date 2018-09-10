<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="t"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cjk" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title>修改密码</title>
<link rel="stylesheet" href="${cjk }/css/pintuer.css">
<link rel="stylesheet" href="${cjk }/css/admin.css">
<script src="${cjk }/js/jquery.js"></script>
<script src="${cjk }/js/pintuer.js"></script>
<script src="${cjk }/js/controller.js"></script>

</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head">
  	<strong>
  		<span class="icon-key"></span> &nbsp;修改密码界面-----
  	</strong>
  当前登录的帐号:&nbsp;&nbsp;<%=session.getAttribute("names") %>
  </div>
  <div class="body-content" style="width:70%; margin:0 auto; padding-left:20px;">
    <form method="post" class="form-x" id="formPass">
     <br/><br/>
      <div class="form-group">
        <div class="labe">
       	   <span style="font-size:18px;padding-left:25%;">
       	   	</span>
        </div>
      </div>     
      <div class="form-group">
        <div class="label" style="width:180px;position:absolute;">
          <label for="sitename">原始密码：</label>
        </div>
        <div class="field">
          <input type="password" class="input w50" id="mpass" name="mpass" size="50" placeholder="请输入原始密码" data-validate="required:请输入原始密码" style="width:35%;margin-left:180px;"/>       
        </div>
      </div>      
      <div class="form-group">
        <div class="label" style="width:180px;position:absolute;">
          <label for="sitename" style="padding-left:25px;">新密码：</label>
        </div>
        <div class="field">
          <input type="password" class="input w50" name="newpass" size="50" placeholder="请输入新密码" data-validate="required:请输入新密码,length#>=5:新密码不能小于5位" style="width:35%;margin-left:180px;"/>         
        </div>
      </div>
      <div class="form-group">
        <div class="label" style="width:180px;position:absolute;">
          <label for="sitename">确认新密码：</label>
        </div>
        <div class="field">
          <input type="password" class="input w50" name="renewpass" size="50" placeholder="请再次输入新密码" data-validate="required:请再次输入新密码,repeat#newpass:两次输入的密码不一致" style="width:35%;margin-left:180px;"/>          
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field" style="padding-left:30%;">
          <button class="button bg-main icon-check-square-o" type="button" id="changePass"> 提交</button>   
        </div>
      </div>      
    </form>
  </div>
  <br/><br/>
</div>
</body>
</html>