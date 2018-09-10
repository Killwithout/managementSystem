/**
 * 分页js for content.jsp
 */
//加载页面
$(function() { 
	var current = 1;
	$.ajax({
		url: "/content/pageSize",
		type: "POST",
		success: function(pageCount){
			initMyPagination(pageCount,current);//总记录数
		}
	});
});

function initMyPagination(pageCount,current){
	$.ajax({   
       url: "/content/contentList?current="+current,
       type: "POST",  
       success: function(content) {
			var tBody = $("#vo");
			if(content != null || content != ""){
	       		tBody.html("");
	       	}
			for(var i=0; i<content.length; i++){
				var cjk = $("<tr id='tr_"+content[i].id+"'><td style='text-align:left; padding-left:20px;'>"+
					"<input type='checkbox' name='id[]' value='"+content[i].id+"'/>"+
					"</td><td>"+content[i].id+
					"</td><td>"+"<img src="+content[i].contentImage+" width='70' height='50'/>"+
					"</td><td>"+content[i].contentName+
					"</td><td><font color='#00CC99'>"+content[i].contentType+
					"</td><td>"+content[i].contentTypeName+
					"</td><td>"+content[i].createTime.substring(0,19)+
					"</td><td>"+"<div class='button-group'> <a class='button border-main' href='javascript:void(0)' onclick='return updContent("+content[i].id+")'> <span class='icon-edit'></span> 修改 </a> <a class='button border-red' href='javascript:void(0)' onclick='return del("+content[i].id+")'> <span class='icon-trash-o'></span> 删除 </a></div>"+
					"</td></tr>")
				tBody.append(cjk);
			}
			if(current == 1){
				initPageContent(pageCount);			
			}
        }  
    }); 
}
		
function initPageContent(pageCount){
	$("#pagination").pagination({
		pageCount: pageCount,
		currentPage: 1, //当前页
		totalPage: Math.ceil(pageCount/10),//总页数
		isShow: true, //是否显示首尾页
		count: 10, //显示个数
		homePageText: "首页",
		endPageText: "尾页",
		prevPageText: "上一页",
		nextPageText: "下一页",
		callback: function(current){
			initMyPagination(pageCount , current);
		}
	});
}