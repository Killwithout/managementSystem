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
<style type="text/css">
#btn{
	background:#2c7;
	color:white;
	border-radius:5px;
	transition: all 0.5s;
}

#btn:hover{
	border:1px solid white;
	font-size:15px;
}
</style>
<script type="text/javascript">
function sendCode(){

}

//发送短信验证码倒计时
var InterValObj; //timer变量，控制时间
var count = 60; //间隔函数，1秒执行
var curCount;//当前剩余秒数
function sendMessage(){
	curCount = count;
    $("#btn").attr("disabled", "true");
    $("#btn").val(curCount + "秒后重新发送");
    InterValObj = window.setInterval(SetRemainTime, 1000); //启动计时器，1秒执行一次请求后台发送验证码 
}
//timer处理函数
function SetRemainTime() {
    if (curCount == 0) {
        window.clearInterval(InterValObj);//停止计时器
        $("#btn").removeAttr("disabled");//启用按钮
        $("#btn").val("重新发送验证码");
    }
    else {
        curCount--;
        $("#btn").val(curCount + "秒后重新发送");
    }
}

</script>
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head">
  	<strong>
  		<span class="icon-key"></span> &nbsp;-----短信验证码界面-----
  	</strong>
  </div>
  <div class="body-content" style="width:70%; margin:0 auto; padding-left:20px;">
    <form method="post" class="form-x" id="formPass">
      <div class="form-group">
        <div class="labe">
       	   <span style="font-size:18px;padding-left:25%;">
       	   	</span>
        </div>
      </div>     
      <br/><br/><br/><br/>
     
      <div class="form-group">
        <div class="label" style="width:180px;position:absolute;">
          <label for="sitename">请输入手机号码：</label>
        </div>
        <div class="field">
          <input type="text" id="phone" class="input w50" name="phoneNumber" size="50" placeholder="请输入手机号码" data-validate="required:请输入正确的手机号码" style="width:40%;margin-left:180px;"/>          
        </div>
      </div>
      
      <div class="form-group">
        <div class="label" style="width:180px;position:absolute;">
          <label for="sitename">短信验证码：</label>
        </div>
        <div class="field">
        	<input type="code" class="input w50" id="code" name="code" placeholder="请输入短信验证码" data-validate="required:请输入短信验证码" style="width:20%;margin-left:180px;">
            <input class="input w50" id="btn" name="btn" value="点击获取验证码" onclick="sendMessage()" style="width:18%;margin-left:10px;"/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field" style="padding-left:30%;">
          <button class="button bg-main icon-check-square-o" type="button" id="lo"> 提交</button>   
        </div>
      </div>      
    </form>
  </div>
  <br/><br/>
</div>
</body>
<script type="text/javascript">

//发送短信验证码并验证
var sms="";//用于接收下发的短信验证码，从后台传过来，一般会在后台中保存进数据库，然后异步在后台比对数据的正确性
$("#btn").click(function(){
  var phone=$("#phone").val();
  if(phone!=""){
      $.ajax({
          url:"/code/sendSMS",
          type:"post",
          data:{"phone":phone},
          dataType:"json",
          success:function(result){
              if(result.status==1){
                  sms=result.data;
              }
          }
      });
  }else{
      alert("请输入手机号");
      return false;
  }
});
//提交按钮
$("#lo").click(function(){
  var code=$("#code").val();
  if(code==""){
      alert("请输入验证码");
  }else{
	  //这里应该异步提交后台
      if(sms==code){
          alert("验证成功，验证码="+code);
      }else{
          alert("验证码错误");
      };
  };
});
</script>
</html>