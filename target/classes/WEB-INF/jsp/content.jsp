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
		<script src="${cjk }/js/jquery.js"></script>
		<script src="${cjk }/js/pintuer.js"></script>
		<script type="text/javascript" src="${cjk }/js/content.js"></script>
		<!-- 分页相关 1个css 3个js -->
		<link rel="stylesheet" href="${cjk}/css/jquery.pagination.css" />
		<script type="text/javascript" src="${cjk }/js/jquery-1.11.3.min.js"></script>
		<script src="${cjk}/js/jquery.pagination.min.js"></script>
		<script src="${cjk }/js/my.pagination.js"></script>
		
	</head>
<body>
<form method="get" action="/content/delAllContent" id="listform">
  <div class="panel admin-panel">
    <div class="panel-head">
    	<strong class="icon-reorder"> 内容列表</strong> 
    	<a href="" style="float:right; display:none;">添加字段</a>
    </div>
    <table class="table table-hover text-center">
     <tr>
        <td style="text-align:left; padding:19px 0;padding-left:20px;">
        	<input type="checkbox" id="checkall"/>
                               全选 
        </td>
        <td colspan="7" style="text-align:left;padding-left:20px;">
          <a href="javascript:void(0)" class="button border-red icon-trash-o" style="padding:5px 15px;" onclick="DelSelect()"> 删除</a> 
          <a href="javascript:void(0)" style="padding:5px 15px; margin:0 10px;" class="button border-blue icon-edit" onclick="sorts()"> 排序</a> 操作：
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
        <th>内容</th>
        <th>属性</th>
        <th>分类名称</th>
        <th width="10%">更新时间</th>
        <th width="310">操作</th>
      </tr>
      <tbody name="list" id="vo">
       
        </tbody>
      <tr>
      	<td colspan="8">
			<div class="box" style="padding-top:25px; padding-bottom:35px;">
				<div id="pagination" class="page fl"></div>
			</div>
      	</td>
      </tr>
    </table>
  </div>
</form>
<script type="text/javascript">
//修改
function updContent(id){
	window.location.href = "/index/updateContent?id="+id;
}
</script>
</body>
</html>