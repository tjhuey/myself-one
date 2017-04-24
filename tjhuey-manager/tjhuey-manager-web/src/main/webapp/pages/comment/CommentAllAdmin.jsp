<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="/include/base.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>评论管理</title>
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
			<div>
				<h3 style="margin-bottom: 3px;">评论信息列表</h3>
				<hr style="margin-top: 0px;">
			</div>
			<div>
				<div class="table-responsive">
					<table class="table table-condensed table-hover table-striped"
						id="usre-table">
						<thead>
							<tr>
								<th>编号</th>
								<th>资源名称</th>
								<th>资源分享者</th>
								<th>评论标题</th>
								<th>评论消息</th>
								<th>评论时间</th>
								<th>删除</th>
							</tr>
						</thead>
						<tbody>
							<!-- 是否有资源-->
							<c:if test="${empty list }">
							没有任何评论信息。
						</c:if>
							<c:if test="${not empty list }">
								<c:forEach items="${list}" var="comment" varStatus="status">
									<tr>
										<td>${KB100010+status.index}</td>
										<td>${comment.resource.name}</td>
										<td>${comment.user.nickName}</td>
										<td>${comment.title}</td>
										<td><a href="#" style="text-align: center;" class="text_slice"
											onclick="lookComment('${comment.commentId }')">${comment.content }</a></td>
										<td><fmt:formatDate value="${comment.postTime}"
												pattern="yyyy-MM-dd HH:mm:ss" /></td>
										<td><span class="glyphicon glyphicon-remove" onclick="deleteComment('${comment.commentId }', '${comment.title}', this)" style="cursor: pointer;"></span></td>
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
		src="${ctx }/static/js/comment/comment-main.js"></script>

</body>
</html>