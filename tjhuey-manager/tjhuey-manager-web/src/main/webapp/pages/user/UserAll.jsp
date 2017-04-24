<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<%@ include file="/include/base.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>会员管理</title>


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
			<h3 style="margin-bottom:3px;">用户信息列表</h3>
			<hr style="margin-top: 0px;">
		</div>
		<div>
			<div>
				<button type="button" class="btn btn-default" id="selectAll" style="text-align: center; width: 80px;">全选</button>
				<button type="button" class="btn btn-default" id="deleteMulti" style="visibility: hidden; text-align: center; width: 80px;">批量删除</button>
				
				<c:if test="${sessionScope.authority == 3 }">
				<button type="button" class="btn btn-default" id="addVipUserBtn" style="float: right;">添加VIP会员</button>
				</c:if>
				<c:if test="${sessionScope.authority == 4 }">
				<button type="button" class="btn btn-default" id="addCommonUserBtn" style="float: right;">添加普通会员</button>
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
							<th>签到次数</th>
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
							没有任何会员信息。
						</c:if>
						<c:if test="${not empty list }">
							<c:forEach items="${list}" var="user" varStatus="status">
										<tr>
											<td><input type="checkbox" name="check-input" value="${user.userId }"></td>
											<td>${status.index+201304051010}</td>
											<td>${user.nickName }</td>
											<td>${user.password }</td>
											<c:if test="${user.sex == 1 }">
												<td>男</td>
											</c:if>
											<c:if test="${user.sex == 0 }">
												<td>女</td>
											</c:if>
											<td>${user.email}</td>
											<td>${user.phoneNumber}</td>
											<td>${user.address.detail }</td>
											<td>${user.count }</td>
											<td><fmt:formatDate value="${user.rigistTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
											<td><fmt:formatDate value="${user.lastTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
											<c:if test="${user.authority == 3 }">
												<td>VIP会员</td>
											</c:if>
											<c:if test="${user.authority == 4 }">
												<td>普通会员</td>
											</c:if>
											<td><span class="glyphicon glyphicon-pencil" onclick="editUser(${user.userId})" style="cursor: pointer;"></span></td>
											<td><span class="glyphicon glyphicon-remove" onclick="deleteUser('${user.userId }', '${user.nickName}', this)" style="cursor: pointer;"></span></td>
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

<script type="text/javascript" src="${ctx }/static/js/user/user-main.js"></script>


</body>
</html>