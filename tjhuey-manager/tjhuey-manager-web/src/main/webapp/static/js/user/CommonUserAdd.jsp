<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/include/base.jsp"%>
<style type="text/css">
.tabTitle {
	text-align: center;
	font-size: 20px;
	font-weight: bold;
}

div1 {
	width: 100%;
	height: 400px;
	overflow: hidden;
}

.div2 {
	width: 98%;
	height: 400px;
	margin: 10px 1% auto 1%;
}

.div3 {
	padding-left: 0px;
	padding-right: 0px;
	height: 45px;
}

.div4-left {
	width: 100%;
	height: 34px;
	margin-bottom: 11px;
}

.div4-right {
	width: 100%;
	height: 34px;
	margin-bottom: 11px;
	margin-left: 10px;
}

.div5-left {
	float: left;
	width: 19%;
	text-align: center;
	margin-top: 5px;
	padding-right: 10px;
}

.div5-right {
	float: right;
	width: 81%;
}
</style>

<body style="overflow: hidden;">

	<ul id="myTab" class="nav nav-tabs" style="margin-bottom: 20px;">
		<li class="active" style="width: 50%;"><a href="#userAddOne"
			data-toggle="tab" class="tabTitle"
			style="padding-top: 5px; padding-bottom: 5px;">单个添加 </a></li>
		<!-- 批量处理 -->
		<li style="width: 50%;"><a href="#userImport" data-toggle="tab"
			class="tabTitle" style="padding-top: 5px; padding-bottom: 5px;">批量导入</a>
		</li>
	</ul>


	<div id="myTabContent" class="tab-content">
		<div class="tab-pane fade in active" id="userAddOne">
			<form role="form" id="myForm">
				<input type="hidden" name="authority" value="4"><br>
				<div class="div2">
					<!-- 账号 -->
					<div class="col-xs-6 div3">
						<div class="form-group div4-left">
							<div class="div5-left">
								<label for="userName">账&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号</label>
							</div>
							<div class="div5-right">
								<input style="width: 96%;" type="text" class="form-control"
									id="userName" name="userName" placeholder="请输入用户名"
									required="required">
							</div>
						</div>
					</div>
					<!-- 昵称 -->
					<div class="col-xs-6 div3">
						<div class="form-group div4-right">
							<div class="div5-left">
								<label for="nickName">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名</label>
							</div>
							<div class="div5-right">
								<input style="width: 96%;" type="text" class="form-control"
									id="nickName" name="nickName" placeholder="请输入真实姓名"
									required="required">
							</div>
						</div>
					</div>
					

					<!-- 密码 -->
					<div class="col-xs-6 div3">
						<div class="form-group div4-left">
							<div class="div5-left">
								<label for="password">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码</label>
							</div>
							<div class="div5-right">
								<input style="width: 96%;" type="password" class="form-control"
									id="password" name="password" placeholder="请输入新密码"
									required="required">
							</div>
						</div>
					</div>

					<!-- 性别 -->
					<div class="col-xs-6 div3">
						<div class="form-group div4-right">
							<div class="div5-left">
								<label for="sex">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别</label>
							</div>
							<div class="div5-right">
								<div class="col-xs-6"
									style="padding-left: 0px; padding-right: 0px;">
									<div style="float: left;">
										<input type="radio" name="sex" value="1"
											style="width: 20px; height: 20px;">
									</div>
									<div style="float: left; margin-top: 4px; margin-left: 10px;">
										<label>男</label>
									</div>
								</div>
								<div class="col-xs-6"
									style="padding-left: 0px; padding-right: 0px;">
									<div style="float: left;">
										<input type="radio" name="sex" value="0"
											style="width: 20px; height: 20px;">
									</div>
									<div style="float: left; margin-top: 4px; margin-left: 10px;">
										<label>女</label>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- 重复密码 -->
					<div class="col-xs-6 div3">
						<div class="form-group div4-left">
							<div class="div5-left">
								<label for="repassword">重复密码</label>
							</div>
							<div class="div5-right">
								<input style="width: 96%;" type="password" class="form-control"
									id="repassword" name="repassword" placeholder="请再次输入密码"
									required="required">
							</div>
						</div>
					</div>

					<!-- 邮箱 -->
					<div class="col-xs-6 div3">
						<div class="form-group div4-left">
							<div class="div5-left">
								<label for="email">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱</label>
							</div>
							<div class="div5-right">
								<input style="width: 96%;" type="text" class="form-control"
									id="email" name="email" placeholder="请输入邮箱" required="required">
							</div>
						</div>
					</div>

					<!-- 手机号码 -->
					<div class="col-xs-6 div3">
						<div class="form-group div4-left">
							<div class="div5-left">
								<label for="phoneNumber">手机号码</label>
							</div>
							<div class="div5-right">
								<input style="width: 96%;" type="text" class="form-control"
									id="phoneNumber" name="phoneNumber" placeholder="请输入手机号码"
									required="required">
							</div>
						</div>
					</div>
					<!-- 省份 -->
					<div class="col-xs-6 div3">
						<div class="form-group div4-right">
							<div class="div5-left">
								<label for="province">省&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;份</label>
							</div>
							<div class="div5-right">
								<div class="col-xs-12"
									style="padding-left: 0px; padding-right: 0px;">
									<select id="province" name="province"
										style="width: 96%; height: 34px; border-radius: 4px;">
										<option value="请选择省份" selected>请选择省份</option>
										<option value="河北省">河北省</option>
										<option value="黑龙江省">辽宁省</option>
<!-- 										<option value="吉林省">吉林省</option> -->
<!-- 										<option value="辽宁省">辽宁省</option> -->
									</select>
								</div>
							</div>
						</div>
					</div>

					<!-- 城市 -->
					<div class="col-xs-6 div3">
						<div class="form-group div4-right">
							<div class="div5-left">
								<label for="city">城&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;市</label>
							</div>
							<div class="div5-right">
								<div class="col-xs-12"
									style="padding-left: 0px; padding-right: 0px;">
									<select id="city" name="city"
										style="width: 96%; height: 34px; border-radius: 4px; color: #A1A1A1;"
										disabled="disabled">
										<option value="请选择城市" selected>请选择城市</option>
									</select>
								</div>
							</div>
						</div>
					</div>

					<!-- 详细地址 -->
					<div class="col-xs-6 div3">
						<div class="form-group div4-left">
							<div class="div5-left">
								<label for="detail">详细地址</label>
							</div>
							<div class="div5-right">
								<input style="width: 96%;" type="text" class="form-control"
									id="detail" name="detail" placeholder="请输入详细地址"
									required="required">
							</div>
						</div>
					</div>

					<!-- 提交与取消 -->
					<div class="col-xs-12"
						style="width: 98%; margin: 15px 1% auto 1%; padding-left: 0px; padding-right: 0px;">
						<div class="col-xs-3"></div>
						<div class="col-xs-3">
							<button type="button" class="btn btn-block btn-info"
								onclick="checkAdd()">添加</button>
						</div>
						<div class="col-xs-3" style="padding-left: 11px;">
							<button type="button" class="btn btn-block" onclick="cancel()">取消</button>
						</div>
						<div class="col-xs-3"></div>
					</div>
				</div>
			</form>
		</div>
		<!-- 批量处理  -->
		<div class="tab-pane fade" id="userImport"></div>
	</div>

</body>

<script type="text/javascript">
	$("#province").change(function() {
		var province = $("#province").val();
		alert(province);
		/* 清空上一次 */
		$("#city").empty();
		$("#city").append("<option value='请先选择省份'>请选择省份</option>")
		if (province == '请选择省份') {
			$("#city").css("color", "#A1A1A1");
			$("#city").attr("disabled", "disabled");
		} else {
			$("#city").css("color", "#000000");
			$("#city").removeAttr("disabled");
		}

		if (province == '河北省') {
			$("#city").empty();
			$("#city").append("<option value='石家庄'>石家庄</option>");
			$("#city").append("<option value='保定'>保定</option>");
			$("#city").append("<option value='邯郸'>邯郸</option>");
		}
// 		if (province == '黑龙江省') {
// 			$("#city").empty();
// 			$("#city").append("<option value='黑1201'>黑1201</option>");
// 			$("#city").append("<option value='黑1202'>黑1202</option>");
// 			$("#city").append("<option value='黑1203'>黑1203</option>");
// 			$("#city").append("<option value='黑1204'>黑1204</option>");
// 		}
// 		if (province == '吉林省') {
// 			$("#city").empty();
// 			$("#city").append("<option value='吉1201'>吉1201</option>");
// 			$("#city").append("<option value='吉1202'>吉1202</option>");
// 			$("#city").append("<option value='吉1203'>吉1203</option>");
// 			$("#city").append("<option value='吉1204'>吉1204</option>");
// 		}
		if (province == '辽宁省') {
			$("#city").empty();
			$("#city").append("<option value='辽1000'>辽1000</option>");
			$("#city").append("<option value='辽1001'>辽1001</option>");
			$("#city").append("<option value='辽1002'>辽1002</option>");
			$("#city").append("<option value='辽1003'>辽1003</option>");
		}
	});

	function cancel() {
		var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
		parent.layer.close(index);
	}
	/* 前端校验 */
	function checkAdd() {
		var userName = $("#userName").val();
		if ($.trim(userName) == "") {
			layer.msg('请输入账户名称！');
			$("#userName").focus();
			return false;

		} else {
					$.post(
							'${ctx}/admin/checkUserNameAjax',
							{
								'userName' : userName
							},
							function(data) {
								//判断账户名是否存在
								if (data == 'exist') {
									layer.msg('账户名已存在，请检查！');
									$("#userName").focus();
									return false;
								}

								//判断真实姓名
								var nickName = $("#nickName").val();
								if ($.trim(nickName) == "") {
									layer.msg('请输入姓名！');
									$("#nickName").focus();
									return false;
								}

								//密码校验
								var password = $("#password").val();
								var repassword = $("#repassword").val();
								if (password == "") {
									layer.msg('请输入密码！');
									$("#password").focus();
									return false;
								} else if (password != repassword) {
									layer.msg('两次密码输入不一致！');
									return false;
								}

								//性别
								var flag = false;
								$('input[name="sex"]').each(function() {
									if ($(this).is(":checked")) {
										flag = true;
									}
								});
								if (flag == false) {
									layer.msg('请选择性别！');
									return false;
								}
								
								//邮箱
								var email = $("#email").val();
								var emailReg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
								if ($.trim(email) == "") {
									layer.msg('请输入邮箱！');
									$("#email").focus();
									return false;
								} else if (!email.match(emailReg)) {
									layer.msg('邮箱格式不正确！');
									$("#email").focus();
									return false;
								}
								
								//手机
								var phoneNumber = $("#phoneNumber").val();
								var phoneReg = /^(((13[0-9]{1})|(14[5,7,9]{1})|(17[0,1,3,5,6,7,8]{1})|(15[0,1,2,3,5,6,7,8,9]{1})|(18[0-9]{1}))+\d{8})$/;
								if ($.trim(phoneNumber) == "") {
									layer.msg('请输入手机号码！');
									$("#phoneNumber").focus();
									return false;
								} else if (!phoneNumber.match(phoneReg)) {
									layer.msg('手机号码格式不正确！');
									$("#phoneNumber").focus();
									return false;
								}
								
								//省份和城市
								var province = $("#province").val();
								if (province == "请选择省份") {
									layer.msg('请选择省份和城市！');
									$("#province").focus();
									return false;
								}
								
								var detail = $("#detail").val();
								if ($.trim(detail) == "") {
									layer.msg('请输入详细地址！');
									$("#detail").focus();
									return false;
								} 

								//插入操作
								jQuery.ajax({
									url : '${ctx}/user/insertAjax',
									data : $('#myForm').serialize(),
									type : "POST",
									success : function() {
										layer.msg('添加成功！', {
											time : 800
										});
										setTimeout(function() {
											parent.location.reload();
										}, 800);
									}
								});
							});
		}
	}
</script>

