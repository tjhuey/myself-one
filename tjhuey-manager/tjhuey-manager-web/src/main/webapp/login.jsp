<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/base.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台管理</title>

<link rel="stylesheet" href="${ctx}/static/css/login/styles.css">
<link rel="stylesheet" href="${ctx}/static/js/layer/skin/layer.css">
<script type="text/javascript" src="${ctx}/static/js/layer/layer.js"></script>

</head>
<body>
	<div class="htmleaf-container">
		<div class="wrapper">
			<div class="container" style="margin-top: 80px;">
				<div id="logintitle">
					<h1>软件开发资源共享平台</h1>
				</div>
				<form class="form">
					<div class="row">
						<input type="text" placeholder="请输入用户名.." name="userName"
							id="userName"> <input type="password"
							placeholder="请输入密码.." name="password" id="password">
					</div>
					<div style="width: 300px; margin-left: auto; margin-right: auto;">
<!-- 						<span style="float: left;" class="text-danger">欢迎您来登录后代</span> -->
						<!-- 					<span style="float:left;"><input type="radio" name="authority" checked="checked" value="1" class="role"></span> -->
						<!-- 					<span style="margin-left:3px; float:left; font-weight: 600; font-size: 18px;">系统管理员 -->
						<!-- 					<span style="float:left;"><input type="radio" name="authority" value="2" class="role"></span> -->
						<!-- 					<span style="margin-left:3px; float:left; font-weight: 600; font-size: 18px;">前台管理员</span> -->
					</div>
					<button type="button" id="login-button" style="margin-left: 80px;">
						<span style="font-weight: 900;">登录</span>
					</button>
					<u
						style="font-weight: 600; font-size: 18px; cursor: pointer;"
						id="forgetPwd" onclick="forgetPwd();">忘记密码</u>
				</form>
			</div>

			<ul class="bg-bubbles">
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
			</ul>

		</div>
	</div>

	<script>
		$(document).ready(function() {
			$("#userName").focus();
		});
		/* 回车执行单击事件 */
		$(document).keydown(function(event) {
			if (event.keyCode == 13) {
				$('#login-button').click();
			}
		});

		$('#login-button').click(function(event) {
			// 	event.preventDefault();
			var userNameVal = $('#userName').val();
			var passwordVal = $('#password').val();
			//根据value值判断不同用户
			var roleVal = $(".role:checked").val();

			if ($.trim(userNameVal).length == 0) {
				layer.tips('请输入用户名', '#userName', {
					tips : [ 2, '#f00' ]
				});
				$("#userName").focus();
				return false;
			} else if (passwordVal == "") {
				layer.tips('请输入用密码', '#password', {
					tips : [ 2, '#f00' ]
				});
				$("#password").focus();
				return false;
			}

			if ($.trim(userNameVal).length != 0 && passwordVal != "") {
				$.post('${ctx}/login/checkLogin', {
					'userName' : userNameVal,
					'password' : passwordVal,
					'role' : roleVal
				}, function(data) {
					if (data == 'error_username') {
						layer.tips('用户名不存在', '#userName', {
							tips : [ 2, '#f00' ]
						});
						$("#userName").focus();
						return false;
					} else if (data == 'error_password') {
						layer.tips('密码错误', '#password', {
							tips : [ 2, '#f00' ]
						});
						$("#password").focus();
						return false;
					} else if (data == 'ok') {
						location.href = '${ctx}/pages/index.jsp';
					}
				});
			}
		});

		function forgetPwd() {
			layer.alert('<font color="black">请联系管理员：QQ1139743605。</font>', {
				title : '忘记密码',
				shadeClose : true
			});
		}
	</script>

</body>
</html>