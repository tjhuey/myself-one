<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="/include/base.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的资源</title>


<style type="text/css">
#usre-table {
	font-size: 13px;
}

th {
	text-align: center;
	vertical-align: middle !important;
}

td {
	text-align: center;
	vertical-align: middle !important;
}

#usre-table {
	/* 	background-color: #ffffff; */
	
}

.text_slice {
	width: 100px;
	display: block;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}
</style>
</head>
<body>

	<div class="col-sm-12" style="padding: 0;">
		<%@ include file="/include/header.jsp"%>
		<%@ include file="/include/left.jsp"%>
	</div>

	<div class="col-sm-12" style="padding: 0;">
		<div class="col-sm-12">
			<h3 style="margin-bottom: 3px;">资源信息列表</h3>
			<button type="button" class="btn btn-default" id="addResourceBtn"
				style="float: right; margin-bottom: 3px;">上传资源</button>
		</div>
		<div class="col-sm-12">
			<div>
				<div class="table-responsive">
					<table class="table table-condensed table-hover table-striped"
						id="usre-table">
						<thead>
							<tr>
								<th></th>
								<th>编号</th>
								<th>标题</th>
								<th>详情介绍</th>
								<th>语言</th>
								<th>分类</th>
								<th>大小</th>
								<th>上传时间</th>
								<th>积分</th>
								<c:if test="${loginUser.authority < 3 }">
									<th>删除</th>
								</c:if>
								<c:if test="${loginUser.authority > 2}">
									<th>评论列表</th>
								</c:if>
							</tr>
						</thead>
						<tbody>
							<!-- 是否有资源-->
							<c:if test="${empty list }">
							没有任何资源信息。
						</c:if>
							<c:if test="${not empty list }">
								<c:forEach items="${list}" var="resource" varStatus="status">
									<tr>
										<c:if test="${loginUser.authority < 3 }">
											<td><input type="checkbox" name="check-input"
												value="${resource.resourceId }"></td>
										</c:if>
										<c:if test="${loginUser.authority > 2}">
											<td></td>
										</c:if>
										<td>${KB100010+status.index}</td>
										<td>${resource.name }</td>
										<td><a href="#" class="text_slice"
											onclick="lookResource('${resource.resourceId }')">${resource.detail }</a></td>
										<td>${resource.language }</td>
										<c:if test="${resource.type == 1 }">
											<td>电子书</td>
										</c:if>
										<c:if test="${resource.type == 2 }">
											<td>视频</td>
										</c:if>
										<c:if test="${resource.type == 3 }">
											<td>开发工具</td>
										</c:if>
										<td>${resource.size/1000}KB</td>
										<td><fmt:formatDate value="${resource.uploadTime}"
												pattern="yyyy-MM-dd HH:mm:ss" /></td>
										<td>${resource.score }</td>
										<c:if test="${loginUser.authority < 3 }">
											<td><span class="glyphicon glyphicon-remove"
												onclick="deleteResource('${resource.resourceId }', '${resource.name}', this)"
												style="cursor: pointer;"></span></td>
										</c:if>
										<c:if test="${loginUser.authority > 2}">
											<td><span class="glyphicon glyphicon-pencil"
												onclick="editSelf(${resource.resourceId})"
												style="cursor: pointer;"></span></td>
										</c:if>
									</tr>
								</c:forEach>
							</c:if>
						</tbody>
					</table>
				</div>
			</div>
			<div>
				<jsp:include page="/include/pager.jsp"></jsp:include>
			</div>
		</div>
	</div>
	<script type="text/javascript"
		src="${ctx }/static/js/resource/resource-main.js"></script>

</body>
</html>