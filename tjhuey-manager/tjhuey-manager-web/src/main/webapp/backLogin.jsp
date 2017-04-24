<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
<script type="text/javascript" src="${ctx }/js/jquery-1.6.4.min.js"></script>
<script type="text/javascript">
	$(function(){
	     var errMsg = "${errMsg}";
	     //有错误 返回。
	     if(errMsg != null && errMsg !=""){
	    	 alert(errMsg);
	    	 return false;
	     }
	});
	//验证码逻辑
	function reloadVerifyCode() {
		var imgSrc = $("#verifyCodeImage");
		var src = imgSrc.attr("src");
		imgSrc.attr("src", chgUrl(src));
	}
	function chgUrl(url) {
		var timestamp = (new Date()).valueOf();
		newurl = url + "?timestamp=" + timestamp;
		return newurl;
	}
</script>
</head>
<body class="lg-wrap">
	<div class="wrapper2">
		<form class="login-cnt" action="${ctx }/back/login" method="POST">
			<ul class="login">
				<li>
					<label class="login-tip">用户名</label> 
					<span class="login-ipt user-ico">
						<input type="text" name="username" id="userName" placeholder="请输入用户名" />
					</span>
				</li>
				<li>
					<label class="login-tip">密&nbsp;&nbsp;&nbsp;码</label> 
					<span class="login-ipt pwd-ico"> 
					<input type="password"
						name="password" id="passwd" placeholder="请输入密码" />
					</span>
				</li>
				<li>
					<label class="login-tip">验证码</label> 
					<span class="login-ipt code-ipt"> 
					<input type="text" name="verifyCode" id="verifyCode" />
					</span> 
					<img id="verifyCodeImage" class="verify-code" onclick="reloadVerifyCode()" src="${ctx }/back/getVerifyCodeImage" /> 
					<em class="ver-turn" style="cursor: pointer;" onclick="reloadVerifyCode()" title="换一张">换一张</em>
				</li>
				<li class="login-action">
					<input type="submit"  value="登录" />
				</li>
			</ul>
		</form>
	</div>
</body>
</html>