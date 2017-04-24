<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />
<script type="text/javascript"
	src="${ctx }/static/js/header/jquery.panelslider.js"></script>

<link rel="stylesheet"
	href="${ctx }/static/css/header/hearder-style.css">
<link rel="stylesheet"
	href="${ctx }/static/css/fontawesome/css/font-awesome.min.css">

<!-- 背景图片 -->
<div id="bg-div">
	<img src="${ctx }/static/images/bg2.jpg" />
</div>

<header id="header1">
	<nav class="navbar navbar-default">
		<div class="col-sm-8" style="padding: 0;">
			<div class="leftmenu-btn-div col-sm-1">
				<a id="left-panel-link" href="#left-panel" menuicon="#menuicon-span"><span
					id="menuicon-span" class="fa fa-navicon"></span></a>
			</div>
			<div class="logo-div col-sm-11">
				<a href="#">软件开发资源共享平台后台管理</a>
			</div>
		</div>

		<c:if test="${empty loginUser}">
			<div class="header-login-div col-sm-2">
				<div class="btn-group">
					<button type="button" class="btn btn-default login-btn">
						<span class="glyphicon glyphicon-user"></span> <span>Login</span>
					</button>
				</div>
			</div>
		</c:if>
		<c:if test="${not empty loginUser  }">
			<div class="header-logout-div col-sm-2">
						欢迎${loginUser.userName}回来,上次登录时间：<br><fmt:formatDate value="${loginUser.lastTime }"pattern="yyyy/MM/dd HH:mm:ss" />
			</div>
			<div class="header-logout-div col-sm-2">
				<div class="btn-group">
					<div>
						<button type="button" class="btn btn-default dropdown-toggle"
							data-toggle="dropdown" style="width: 160px;">
							<span style="margin-left: 2px;">${loginUser.nickName }</span> <span
								class="caret"></span> <span class="glyphicon glyphicon-user"></span>
						</button>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#" onclick="editAdmin('${loginUser.userId}')">个人信息</a></li>
							<li class="logout"><a href="${ctx }/admin/exit">退出</a></li>
						</ul>
					</div>
					
				</div>
			</div>
		</c:if>
	</nav>
</header>
<script type="text/javascript" src="${ctx }/static/js/admin/admin-main.js"></script>

<script>
	$(".login-btn").click(function() {
		location.href = '${ctx}/login.jsp';
	})

	$('.logout').click(function() {
		location.href = '${ctx}/user/logout';
	});

	$('#left-panel-link').panelslider();
</script>