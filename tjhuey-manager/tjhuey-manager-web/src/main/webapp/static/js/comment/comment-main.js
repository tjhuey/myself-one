// 查看详情
function lookComment(commentId) {
	var url = getRootPath() + '/comment/queryCommentDetail?id=' + commentId;

	layer.open({
		type : 2,
		title : '评论详情',
		area : [ '600px', '300px' ],
		maxmin : false,
		shadeClose : true,
		shift : Math.floor(Math.random() * 6),
		content : url
	});
}
//删除评论
function deleteComment(commentId, title, ele) {
	
	var url = getRootPath() + '/comment/deleteAjax';

	layer.confirm('确认删除评论"' + title + '"？', {
		btn : [ '删除', '取消' ],
		title : '确认删除',
		shadeClose : true
	}, function() {
		$.post(url, {
			'commentId' : commentId
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
		});
	}, function() {
	});
}
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