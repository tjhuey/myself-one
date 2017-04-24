<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<%@ include file="/include/base.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员管理</title>


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

#usre-table{
/* 	background-color: #ffffff; */
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
			<h3 style="margin-bottom:3px;">管理员信息列表</h3>
			<hr style="margin-top: 0px;">
		</div>
		<div>
			<div>
				<button type="button" class="btn btn-default" id="selectAll" style="text-align: center; width: 80px;">全选</button>
				<button type="button" class="btn btn-default" id="deleteMulti" style="visibility: hidden; text-align: center; width: 80px;">批量删除</button>
				<button type="button" class="btn btn-default" id="addAdminBtn" style="float: right;">添加前台管理员</button>
				<c:if test="${loginUser.authority == 0 }">
					<button type="button" class="btn btn-default" id="addSysAdminBtn" style="float: right;">添加系统管理员</button>
				</c:if>
			</div>
			
			<div class="table-responsive">
				<table class="table table-condensed table-hover table-striped" id="usre-table">
					<thead>
						<tr>
							<th></th>
							<th>编号</th>
							<th>用户名</th>
							<th>密码</th>
							<th>性别</th>
							<th>Email</th>
							<th>Phone</th>
							<th>地址</th>
<!-- 							<th>签到次数</th> -->
							<th>注册时间</th>
							<th>上次登录时间</th>
							<th>管理员身份</th>
							<th>编辑</th>
							<th>删除</th>
						</tr>
					</thead>
					<tbody>
						<!-- 是否有管理员 -->
						<c:if test="${empty list }">
							没有任何管理员信息。
						</c:if>
						<c:if test="${not empty list }">
							<c:forEach items="${list}" var="admin" varStatus="status">
								<!-- 遍历管理员除最高管理员huey -->
								<c:if test="${admin.authority < 3 && admin.authority > 0}">
									<c:if test="${admin.userId != loginUser.userId}">
										<tr>
											<td><input type="checkbox" name="check-input" value="${admin.userId }"></td>
											<td>${status.index+201304051010}</td>
											<td>${admin.nickName }</td>
											<td>${admin.password }</td>
											<c:if test="${admin.sex == 1 }">
												<td>男</td>
											</c:if>
											<c:if test="${admin.sex == 0 }">
												<td>女</td>
											</c:if>
											<td>${admin.email}</td>
											<td>${admin.phoneNumber}</td>
											<td>${admin.address.detail }</td>
<%-- 											<td>${admin.count }</td> --%>
											<td><fmt:formatDate value="${admin.rigistTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
											<td><fmt:formatDate value="${admin.lastTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
											<c:if test="${admin.authority == 1 }">
												<td>系统管理员</td>
											</c:if>
											<c:if test="${admin.authority == 2 }">
												<td>前台管理员</td>
											</c:if>
											<td><span class="glyphicon glyphicon-pencil" onclick="editAdmin(${admin.userId})" style="cursor: pointer;"></span></td>
											<td><span class="glyphicon glyphicon-remove" onclick="deleteAdmin('${admin.userId }', '${admin.nickName}', this)" style="cursor: pointer;"></span></td>
										</tr>
									</c:if>
								</c:if>
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

<script type="text/javascript" src="${ctx }/static/js/admin/admin-main.js"></script>


</body>
</html>