/**
 * content.js for content.jsp
 * @param id
 */

//单个删除
function del(id){
	if(confirm("您确定要删除吗?")){
		$.ajax({
			url: "/content/deleteContent?id="+id,
	        type: "GET",  
	        success: function(data) {
	        	if(data == 200){
		        	alert("删除成功！");
		        	$("#tr_"+id).remove();
	        	}
	        }
		});
	}else{
		return;
	}
}

//全选
$("#checkall").click(function(){ 
  $("input[name='id[]']").each(function(){
	  if (this.checked) {
		  this.checked = false;
	  }else {
		  this.checked = true;
	  }
  });
  
})

//批量删除
function DelSelect(){
	var Checkbox=false;
	var ids=0;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {	
		ids = ids + "," + this.value;
		Checkbox=true;
	  }
	});
	 var str = ids.split(',');
	if (Checkbox){
		var t=confirm("您确认要删除选中的内容吗？");
		if (t==false){
			return false;		
		}else{
			$.ajax({
				url: "/content/delAllContent?ids="+ids,
		        type: "GET",  
		        success: function(data) {
		        	if(data == 200){
			        	alert("删除成功！");
		        		for(var i=0;i<str.length;i++){
			        		$("#tr_"+str[i]).remove();
		        		}
		        	}
		        }
			});
		}
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
