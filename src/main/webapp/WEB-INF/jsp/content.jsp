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
		<title>内容管理</title>
		<link rel="stylesheet" href="${cjk }/css/pintuer.css">
		<link rel="stylesheet" href="${cjk }/css/admin.css">
		
		
		<link rel="stylesheet" type="text/css" href="${cjk }/css/reset.css" media="screen" />
        <link rel="stylesheet" type="text/css" href="${cjk }/css/common.css" media="screen" />
        <link rel="stylesheet" type="text/css" href="${cjk }/css/pagination.css" media="screen" />
		
		
		<script src="${cjk }/js/jquery.js"></script>
		<script src="${cjk }/js/pintuer.js"></script>
		<!-- 分页相关 -->
		<link rel="stylesheet" href="${cjk}/css/jquery.pagination.css" /><!-- 
		<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script> -->
		<script type="text/javascript" src="${cjk }/js/jquery-1.11.3.min.js"></script>
		<script src="${cjk}/js/jquery.pagination.min.js"></script>
		<script src="${cjk}/js/pagination.js"></script>
		<!-- <style>
			* {
				margin: 0;
				padding: 0;
			}
			
			body {
				font-family: "微软雅黑";
				background: #eee;
			}
			button {
				display: inline-block;
				padding: 6px 12px;
				font-weight: 400;
				line-height: 1.42857143;
				text-align: center;
				vertical-align: middle;
				cursor: pointer;
				border: 1px solid transparent;
				border-radius: 4px;
				border-color: #28a4c9;
				color: #fff;
				background-color: #5bc0de;
				margin: 20px 20px 0 0;
			}
			
			.box {
				width: 60%;
				margin: 0 auto;
				height: 34px;
				padding-bottom: 55px;
				padding-top: 25px;
			}
			
			.page {
				width: 600px;
			}
			
			.info {
				width: 200px;
				height: 34px;
				line-height: 34px;
			}
			
			.fl {
				float: left;
			}
		</style> -->
	</head>
<body>
<form method="post" action="" id="listform">
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder"> 内容列表</strong> <a href="" style="float:right; display:none;">添加字段</a></div>
    <table class="table table-hover text-center">
     <tr>
        <td style="text-align:left; padding:19px 0;padding-left:20px;"><input type="checkbox" id="checkall"/>
                     全选 
        </td>
        <td colspan="7" style="text-align:left;padding-left:20px;"><a href="javascript:void(0)" class="button border-red icon-trash-o" style="padding:5px 15px;" onclick="DelSelect()"> 删除</a> <a href="javascript:void(0)" style="padding:5px 15px; margin:0 10px;" class="button border-blue icon-edit" onclick="sorts()"> 排序</a> 操作：
          <select name="ishome" style="padding:5px 15px; border:1px solid #ddd;" onchange="changeishome(this)">
            <option value="">首页</option>
            <option value="1">是</option>
            <option value="0">否</option>
          </select>
          <select name="isvouch" style="padding:5px 15px; border:1px solid #ddd;" onchange="changeisvouch(this)">
            <option value="">推荐</option>
            <option value="1">是</option>
            <option value="0">否</option>
          </select>
          <select name="istop" style="padding:5px 15px; border:1px solid #ddd;" onchange="changeistop(this)">
            <option value="">置顶</option>
            <option value="1">是</option>
            <option value="0">否</option>
          </select>
          &nbsp;&nbsp;&nbsp;
          移动到：
          <select name="movecid" style="padding:5px 15px; border:1px solid #ddd;" onchange="changecate(this)">
            <option value="">请选择分类</option>
            <option value="">产品分类</option>
            <option value="">产品分类</option>
            <option value="">产品分类</option>
            <option value="">产品分类</option>
          </select>
          <select name="copynum" style="padding:5px 15px; border:1px solid #ddd;" onchange="changecopy(this)">
            <option value="">请选择复制</option>
            <option value="5">复制5条</option>
            <option value="10">复制10条</option>
            <option value="15">复制15条</option>
            <option value="20">复制20条</option>
          </select></td>
      </tr>
      <tr style="border-top: 2px solid #ddd;">
        <th width="100" style="text-align:left; padding-left:20px;">选项</th>
        <th width="10%">序号</th>
        <th>图片</th>
        <th>名称</th>
        <th>属性</th>
        <th>分类名称</th>
        <th width="10%">更新时间</th>
        <th width="310">操作</th>
      </tr>
      <tbody name="list" id="vo">
       
        </tbody>
      <tr>
      	<td colspan="8">
      		<!-- <div class="box">
				<div id="pagination1" class="page fl">
				</div>
			</div> -->
			<div class="zfxxbj">
			<div class="zfxx">
			<div class="zfxx-nr clearfix">
			<div class="zfxx-yr">
				<!-- 分页 -->
				<div id="pageContent" class="M-box4" style="position: absolute;left: 50%;margin-bottom:50px;">
				</div>
			</div>
			</div>
			</div>
			</div>
      	</td>
      </tr>
    </table>
  </div>
</form>
		
<script type="text/javascript">
/* //加载页面
$(function() { 
	var pageCount = 0;
	$.ajax({
		url: "/content/pageSize",
		type: "POST",
		success: function(data){
			var pageCount = data;
			cjkTest(1,pageCount);
		}
	});
});

function cjkTest(currentPage , pageCount){
	$("#pagination1").pagination({
		currentPage: currentPage,//当前页
		pageSize: 10,//每页显示的条数
		totalPage: pageCount/10,//总页数/10 = 页数
		callback: function(current) {
			$.ajax({   
                url: "/content/contentList",
                type: "POST",  
                data: JSON.stringify({"current":current, "pageSize":10}),
                contentType : "application/json",
                dataType : "json",
                success: function(data) {
                	var content = data;
        			var tBody = $("#vo");
        			for(var i=0; i<content.length; i++){
        				var cjk = $("<tr><td style='text-align:left; padding-left:20px;'>"+
        					"<input type='checkbox' name='id[]' value=''/>"+
        					"</td><td>"+content[i].id+
        					"</td><td>"+"<img src="+content[i].contentImage+" width='70' height='50'/>"+
        					"</td><td>"+content[i].contentName+
        					"</td><td><font color='#00CC99'>"+content[i].contentType+
        					"</td><td>"+content[i].contentTypeName+
        					"</td><td>"+content[i].createTime.substring(0,19)+
        					"</td><td>"+"<div class='button-group'> <a class='button border-main' href='#'> <span class='icon-edit'></span> 修改 </a> <a class='button border-red' href='javascript:void(0)' onclick='return del(1,1,1)'> <span class='icon-trash-o'></span> 删除 </a></div>"+
        					"</td></tr>")
        				tBody.append(cjk);
        			}
                }  
           }); 
		}
	});
}
 */
//搜索
function changesearch(){	
		
}

//单个删除
function del(id,mid,iscid){
	if(confirm("您确定要删除吗?")){
		
	}
}

//全选
$("#checkall").click(function(){ 
  $("input[name='id[]']").each(function(){
	  if (this.checked) {
		  this.checked = false;
	  }
	  else {
		  this.checked = true;
	  }
  });
})

//批量删除
function DelSelect(){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){
		var t=confirm("您确认要删除选中的内容吗？");
		if (t==false) return false;		
		$("#listform").submit();		
	}
	else{
		alert("请选择您要删除的内容!");
		return false;
	}
}

//批量排序
function sorts(){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){	
		
		$("#listform").submit();		
	}
	else{
		alert("请选择要操作的内容!");
		return false;
	}
}


//批量首页显示
function changeishome(o){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){
		
		$("#listform").submit();	
	}
	else{
		alert("请选择要操作的内容!");		
	
		return false;
	}
}

//批量推荐
function changeisvouch(o){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){
		
		
		$("#listform").submit();	
	}
	else{
		alert("请选择要操作的内容!");	
		
		return false;
	}
}

//批量置顶
function changeistop(o){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){		
		
		$("#listform").submit();	
	}
	else{
		alert("请选择要操作的内容!");		
	
		return false;
	}
}


//批量移动
function changecate(o){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){		
		
		$("#listform").submit();		
	}
	else{
		alert("请选择要操作的内容!");
		
		return false;
	}
}

//批量复制
function changecopy(o){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){	
		var i = 0;
	    $("input[name='id[]']").each(function(){
	  		if (this.checked==true) {
				i++;
			}		
	    });
		if(i>1){ 
	    	alert("只能选择一条信息!");
			$(o).find("option:first").prop("selected","selected");
		}else{
		
			$("#listform").submit();		
		}	
	}
	else{
		alert("请选择要复制的内容!");
		$(o).find("option:first").prop("selected","selected");
		return false;
	}
}

</script>
</body>
</html>