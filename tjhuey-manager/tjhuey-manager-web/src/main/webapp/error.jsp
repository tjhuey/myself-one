<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${ctx }/js/jquery-1.6.4.min.js"></script>
<script type="text/javascript">
	
	$(function(){
		
		$("#goBackBtn").click(function(){
			//模拟浏览器的后退操作
			window.history.back();
		});
		
	});
	
</script>
</head>
<body>
	
	<div id="mainDiv" class="borderDiv">
		[出错啦！]
		<br/>
		<c:if test="${!empty exception }">${exception.message }</c:if>
		<br/>
		<button id="goBackBtn">返回继续操作</button>
	</div>
	
</body>
</html>