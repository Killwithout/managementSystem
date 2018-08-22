var total = 0;

$(function () {
	initNewsList(1);
})

function initNewsList(pageNo) {
	$.ajax({
        type : 'post',
        url : '/content/contentList',
        contentType : 'application/json;charset=utf-8',
        data : '{"pageNo":' + pageNo + '}',
        success : function(data) {
      	  	var content = data;//JSON.parse(data);
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
	
function initPageContent() {
	$("#pageContent").pagination({
		coping:true,
		totalData: total,
		showData:6,
		homePage:'首页',
	    endPage:'末页',
	    prevContent:'上页',
	    nextContent:'下页',
	    callback:pageCallback
	 }); 
}
	
function pageCallback(index, jq) {     //前一个表示您当前点击的那个分页的页数索引值，后一个参数表示装载容器。 
	initNewsList(index.getCurrent());
}
