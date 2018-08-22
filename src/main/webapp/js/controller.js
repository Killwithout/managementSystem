/**
 * 登录请求后台
 */
$(function() {
	// 点击登录按钮
	$('#logins').click(function() {
		login();
	});
	// 登录页面的 注册按钮
	$('#registerPage').click(function() {
		location.href = "../index/registerPage";
	});
	// 回车事件
	$('#username, #password').keypress(function(event) {
		if (13 == event.keyCode) {
			login();
		}
	});
	//注册提交按钮
	$('#register').click(function() {
		register();
	});
	//修改密码
	$('#changePass').click(function(){
		changePass();
	});
});
/**
 * 登录
 */
function login() {
	$.ajax({
		url : '../sso/login',
		type : 'POST',
		data :  $("#loginForm").serialize(),
		success : function(data) {
			var result = data;
			if (result.code == 200) {
				location.href = "../index/home";
			} else {
				if(result.code == -200){
					alert(result.result);//用户名或密码
				}else if(result.code == -203){
					alert(result.result);//验证码错误
				}else if(result.code == -202){
					alert(result.result);//密码错误
				}else if(result.code == -201){
					alert(result.result);//用户名错误
				}else{
					alert(result.result);//系统异常
				}
			}
		},
		error : function(error) {
			console.log(error);
		}
	});
}


/**
 * 注册
 */
function register(){
	$.ajax({
		url : '../sso/register',
		type : 'POST',
		data : $("#cjk_register").serialize(),
		success : function(data) {
//			var result = JSON.parse(data);
			var result = data;
			if (result.code == 200) {
				location.href = "loginValidate";
			} else {
				alert(result.result);
			}
		},
		error : function(error) {
			console.log(error);
		}
	});
}
/**
 * 修改密码
 */
function changePass(){
	$.ajax({
		url : '../sso/changePass',
		type : 'POST',
		data : $("#formPass").serialize(),
		success : function(data) {
			var result = data;
			if (result.code == 200) {
				alert("系统自动退出，请重新登录");
				window.parent.frames.location.href = "loginValidate";
			} else {
				alert(result.result);
			}
		},
		error : function(error) {
			console.log(error);
		}
	});
}
