function editResource(resourceId){
	var url = getRootPath() + '/comment/queryAllComment?resourceId=' + resourceId;

	layer.open({
		type : 2,
		title : '评论',
		area : [ '80%', '80%' ],
		maxmin : false,
		shadeClose : true,
		shift : Math.floor(Math.random() * 6),
		content : url
	});
}
function editSelf(resourceId){
	var url = getRootPath() + '/comment/queryAllCommentSelf?resourceId=' + resourceId;
	
	layer.open({
		type : 2,
		title : '评论',
		area : [ '80%', '80%' ],
		maxmin : false,
		shadeClose : true,
		shift : Math.floor(Math.random() * 6),
		content : url
	});
}

// 查看详情
function lookResource(resourceId) {
	var url = getRootPath() + '/resource/queryResourceDetail?id=' + resourceId;

	layer.open({
		type : 2,
		title : '资源详情',
		area : [ '300px', '200px' ],
		maxmin : false,
		shadeClose : true,
		shift : Math.floor(Math.random() * 6),
		content : url
	});
}
//上传资源
$('#addResourceBtn').on("click", function() {

	var url = getRootPath() + '/pages/resource/ResourceUpload.jsp';
	layer.open({
		type : 2,
		title : '请上传资源',
		area : [ '800px', '300px' ],
		maxmin : false,
		shadeClose : true,
		scrollbar : true,
		shift : Math.floor(Math.random() * 6),
		content : url
	});
	
});


// 删除资源
function deleteResource(resourceId, name, ele) {
	
	var url = getRootPath() + '/resource/deleteAjax';

	layer.confirm('确认删除资源"' + name + '"？', {
		btn : [ '删除', '取消' ],
		title : '确认删除',
		shadeClose : true
	}, function() {
		$.post(url, {
			'resourceId' : resourceId
		}, function(data) {
			if (data == 'ok') {
				$(ele).parent().parent().remove();
				layer.msg('删除成功！', {
					time : 1000
				});
				setTimeout(function() {
					parent.location.reload();
				},0.1);
			}
			if (data == 'error') {
				layer.msg('由于该资源存在评论，删除失败！', {
					time : 1000
				});
				setTimeout(function() {
					parent.location.reload();
				},2);
			}
		});
	}, function() {
	});
}
//全选
$('#selectAll').on("click",function(){
	
	var selectAllBtn = $("#selectAll");
	
	if(selectAllBtn.text() == "全选"){
		//设置全选中
		$('input[name="check-input"]').prop("checked",true);
		selectAllBtn.text("全不选");
    	$("#deleteMulti").css("visibility", "visible");
		return false;
	}else if(selectAllBtn.text() == "全不选"){
		$('input[name="check-input"]').prop("checked",false);
		selectAllBtn.text("全选");
    	$("#deleteMulti").css("visibility", "hidden");
		return false;
	}
});
//指定切换是否选中，已经批量删除按钮是否显示
$('input[name="check-input"]').on("click", function(){
	var flag = true;
   	var selectAllBtn = $("#selectAll");
    var checkbox =  document.getElementsByName("check-input");  
    for(var i=0;i<checkbox.length;i++){  
		if(!checkbox[i].checked){
			flag = false;
			break;
        }  
    }  
    if(flag == true){
    	selectAllBtn.text("全不选");
    }else{
    	selectAllBtn.text("全选");
    }
    
    var flag2 = true;
    for(var i=0;i<checkbox.length;i++){  
		if(checkbox[i].checked){
			flag2 = false;
			break;
        }  
    }
    if(flag2 == false){
    	$("#deleteMulti").css("visibility", "visible");
    }else{
    	$("#deleteMulti").css("visibility", "hidden");
    }
    
});
//批量删除
$('#deleteMulti').on("click", function(){
	var flag = true;
	var checkbox =  document.getElementsByName("check-input"); 
	var count = 0;
	var url = getRootPath() + '/resource/deleteMultiAjax';
	
	var delArray = new Array();
	
	for(var i=0;i<checkbox.length;i++){  
		if(checkbox[i].checked){
			count++;
			delArray[i] = checkbox[i].value;
			flag = false;
		}  
	} 
	if(flag == true){
		layer.msg('请选择资源！',{time:1500});
	}else{
		layer.confirm('确认删除选中的'+count+'个资源吗？', {
			btn: ['删除','取消'],
			title: '确认删除',
			shadeClose: true 
		}, function(){
			$.post(url, {'delArray': delArray}, function(data){
		  		layer.msg('删除成功！', { time: 800});
		  		//setTimeout(function(){location.reload();}, 800);
			});
		}, function(){
		});
	}
});

// js获取项目根路径，如： http://localhost:8083/ResourceShare
function getRootPath() {
	// 获取当前网址，如： http://localhost:8083/ResourceShare/share/meun.jsp
	var curWwwPath = window.document.location.href;
	// 获取主机地址之后的目录，如： ResourceShare/share/meun.jsp
	var pathName = window.document.location.pathname;
	var pos = curWwwPath.indexOf(pathName);
	// 获取主机地址，如： http://localhost:8083
	var localhostPath = curWwwPath.substring(0, pos);
	// 获取带"/"的项目名，如：/ResourceShare
	var projectName = pathName
			.substring(0, pathName.substr(1).indexOf('/') + 1);
	return (localhostPath + projectName);
}