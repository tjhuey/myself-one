<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="/include/base.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>软件开发资源共享平台</title>


</head>
<body style="overflow-x: hidden;">

	<div style="margin-bottom: 52px;">
		<%@ include file="/include/header.jsp"%>
	</div>

	<div>
		<%@ include file="/include/left.jsp"%>
	</div>
	<div id="pjax-content">
		<!-- 功能介绍 -->
		<div class="container bg-info">
			    <div class="row">
			        <span class="text-danger">（1）</span><span class="bg-danger">超级管理员：</span>用户管理、管理员管理、资源管理、评论管理。
			    </div>
			    <div class="row">
			        <span class="text-danger">（2）</span><span class="bg-danger">普通管理员：</span>审核上传资源、实时统计资源下载排行榜、普通用户和会员用户管理、评论管理、管理自己信息。
			    </div>
			    <div class="row">
			        <span class="text-danger">（3）</span><span class="bg-danger">会员用户：</span>浏览资源、下载资源不消耗积分、批量上传资源、评论资源、管理自己的资源、管理自己信息。
			    </div>
			    <div class="row">
			        <span class="text-danger">（4）</span><span class="bg-danger">普通用户：</span>浏览资源、下载资源消耗指定积分、批量上传资源、管理自己的资源、管理自己信息。
			    </div>
			    <div class="row">
			        <span class="text-danger">（5）</span><span class="bg-danger">系统管理员：</span>维护系统，编写代码(未体现) 。
			    </div>
		</div>
	</div>

</body>

</html>