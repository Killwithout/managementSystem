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
<title>首页轮播</title>
<link rel="stylesheet" href="${cjk }/css/pintuer.css">
<link rel="stylesheet" href="${cjk }/css/admin.css">
<script src="${cjk }/js/jquery.js"></script>
<script src="${cjk }/js/pintuer.js"></script>
<script type="text/javascript">
function submitEmail(){

}
</script>
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong class="icon-reorder"> ----- 邮箱验证 ----- </strong></div>
  <div class="padding border-bottom">  
    <div class="body-content" style="width:70%; margin:0 auto; padding-left:20px;">
  	<form class="form-x" id="emailForm" action="/emailMessage/email" method="post"> 
  	  <div class="form-group">
        <div class="label" style="width:180px;position:absolute;">
          <label for="sitename">用户名：</label>
        </div>
        <div class="field">
          <input type="text" id="ename" class="input w50" name="username" size="50" placeholder="请输入姓名" data-validate="required:请输入正确的姓名" style="width:40%;margin-left:180px;"/>          
        </div>
      </div>
      
        <div class="form-group">
        <div class="label" style="width:180px;position:absolute;">
          <label for="sitename">密码：</label>
        </div>
        <div class="field">
          <input type="password" id="epassword" class="input w50" name="password" size="50" placeholder="请输入密码" data-validate="required:请输入正确的密码" style="width:40%;margin-left:180px;"/>          
        </div>
      </div>
      
      <div class="form-group">
        <div class="label" style="width:180px;position:absolute;">
          <label for="sitename">昵称：</label>
        </div>
        <div class="field">
          <input type="text" id="nickname" class="input w50" name="nickname" size="50" placeholder="请输入昵称" data-validate="required:请输入正确的昵称" style="width:40%;margin-left:180px;"/>          
        </div>
      </div>
      
        <div class="form-group">
        <div class="label" style="width:180px;position:absolute;">
          <label for="sitename">邮箱：</label>
        </div>
        <div class="field">
          <input type="email" id="emailnum" class="input w50" name="email" size="50" placeholder="请输入邮箱" data-validate="required:请输入正确的邮箱" style="width:40%;margin-left:180px;"/>          
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
        </div>
        <div class="field" style="padding-left:35%;">
          <button class="button bg-main icon-check-square-o" type="submit" id="emailsubmit"> 提交</button>   
        </div>
      </div>      
  	
  	</form>
  	</div>
  </div>
</div>
</body>

</html>