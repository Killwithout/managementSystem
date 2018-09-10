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
function test(){
	var imgName = $("#check").attr('src');
	var ss = imgName.substring(imgName.lastIndexOf("/")+1);
	$.ajax({
		url: "/QRcode/readQRcode?imgName="+ss,
		success:function(data){
			$("#result").html("解析结果："+data.result+"<br>二维码格式类型："+data.resultType+"<br>二维码的文本内容："+data.resultContent);
		}
	});
}
</script>
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong class="icon-reorder"> ----- 邮箱验证 ----- </strong></div>
  <div class="padding border-bottom">  
	  <a href="/QRcode/zxing">
		<button class="button bg-main">zxing生成二维码</button>
	  </a>
	  <c:if test="${state == 1 }">
		  <img src="/downFile/${imgName}.png"  id="check" style="width:100px;height:100px;"/>
		  <a href="javascript:test()" >
			<button class="button bg-main">解析该二维码</button>
		  </a>
		  <p id="result" style="position:relative;top:-74px;left:375px;"></p>
	  </c:if>
  </div>
</div>
</body>
</html>