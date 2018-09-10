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
<title></title>
<link rel="stylesheet" href="${cjk }/css/pintuer.css">
<link rel="stylesheet" href="${cjk }/css/admin.css">
<script src="${cjk }/js/pintuer.js"></script>

<!-- 引入上传插件 -->
 <link rel="stylesheet" href="${cjk }/css/upload.css">
 <script src="${cjk }/js/jquery-1.7.2.js"></script>
 <script src="${cjk }/js/upload.js"></script>
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>修改内容</strong></div>
  <div class="body-content">
  <br><br>
    <form method="post" class="form-x" action="/content/updateContent" onsubmit="return check()">  
      <div class="form-group">
        <div class="label">
          <label>序号：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="${id}" name="id"  readonly  unselectable="on" style="text-align:center;"/>
          <div class="tips"></div>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>图片：</label>
        </div>
        <div class="field">
			<a id="zwb_upload">
			    <input type="file" class="add" multiple>+ 浏览上传
			</a>
          <div class="tipss">图片尺寸：500*500</div>
          <input type="hidden" name="filePath" value="" id="callbackPath2" >
          <input type="hidden" name="cjk_path2" value="" id="cjk_path2" >
          <img alt="backImg" id="cjk_img" src="" width="70" height="50" style="display:none;"/>
        </div>
      </div>     
      
       <div class="form-group">
          <div class="label">
            <label>属性：</label>
          </div>
          <div class="field">
            <select name="type" id="type" class="input w50" style="text-align-last: center;">
              <option value="">-----  请选择属性     -----</option>
              <option value="首页测试" >首页测试</option>
              <option value="后台测试">后台测试</option>
            </select>
            <div class="tips"></div>
          </div>
        </div>
      
        <div class="form-group">
          <div class="label">
            <label>分类名称：</label>
          </div>
          <div class="field">
            <select name="typeName" id="typeName" class="input w50" style="text-align-last: center;">
              <option value="">-----  请选择分类    -----</option>
              <option value="产品分类">产品分类</option>
              <option value="售后分类">售后分类</option>
              <option value="营销分类">营销分类</option>
              <option value="技术分类">技术分类</option>
            </select>
            <div class="tips"></div>
          </div>
        </div>
      <div class="form-group">
        <div class="label">
          <label>内容：</label>
        </div>
        <div class="field">
          <textarea class="input" id="content" name="content" style=" height:90px;width:60%;"></textarea>
          <div class="tips"></div>
        </div>
      </div>
 
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" type="submit"> 提交</button>
        </div>
      </div>
    </form>
  </div>
</div>
<script type="text/javascript">
//修改之前的js校验
function check(){
	var type = $("#type").val();
	var typeName = $("#typeName").val();
	var content = $("#content").val();
	var imgPath = $("#cjk_img")[0].src;
	
	var name = imgPath.substring(imgPath.lastIndexOf("."));
	if(name.length < 5){
		$("#cjk_path2").val(imgPath);
	}
	if(name.length >5){
		alert("请先上传图片");
		return false;
	}else if(type == "" || type.length == 0){
		alert("请选择属性！");
		return false;
	}else if(typeName == "" || type.length == 0){
		alert("请选择分类名称！");
		return false;
	}else if(content == "" || content.length == 0){
		alert("内容不能为空！");
		return false;
	}
}

$("#zwb_upload").bindUpload({
    url:"/content/upload",//上传服务器地址
    callbackPath:"#callbackPath2",//绑定上传成功后 图片地址的保存容器的id或者class 必须为input或者textarea等可以使用$(..).val()设置之的表单元素
    // ps:值返回上传成功的 默认id为#callbackPath  保存容器为位置不限制,id需要加上#号,class需要加上.
    // 返回格式为:原来的文件名,服务端保存的路径
    num:1,//上传数量的限制 默认为空 无限制
    type:"jpg|png|gif|svg",//上传文件类型 默认为空 无限制
    size:3,//上传文件大小的限制,默认为5单位默认为mb
    // upload.js 69行  文件名不能含有中文 这端代码去掉就可以支持中文文件名上传了
});


</script>
</body>
</html>