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

	<div id="myTabContent" class="tab-content">
		<div class="tab-pane fade in active" id="userAddOne">
			<form role="form" id="myForm" action="${ctx }/resource/toUpResource" method="post" enctype="multipart/form-data">
				<div class="div2">
				
					<!-- 名称 -->
					<div class="col-xs-6 div3">
						<div class="form-group div4-left">
							<div class="div5-left">
								<label for="name">名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称</label>
							</div>
							<div class="div5-right">
								<input style="width: 96%;" type="text" class="form-control"
									id="name" name="name" placeholder="请输入资源名称"
									required="required">
							</div>
						</div>
					</div>
					<!-- detail -->
					<div class="col-xs-6 div3">
						<div class="form-group div4-left">
							<div class="div5-left">
								<label for="detail">详&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;情</label>
							</div>
							<div class="div5-right">
								<textarea rows="2" cols="25" name="detail"></textarea>
							</div>
						</div>
					</div>
					<!-- language -->
					<div class="col-xs-6 div3">
						<div class="form-group div4-left">
							<div class="div5-left">
								<label for="language">语&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;言</label>
							</div>
							<div class="div5-right">
							 <input type="radio" name="language" value="Java">Java
							 <input type="radio" name="language" value="Android">Android
							 <input type="radio" name="language" value="HTML5">HTML5
							</div>
						</div>
					</div>
					<!-- 类型 -->
					<div class="col-xs-6 div3">
						<div class="form-group div4-left">
							<div class="div5-left">
								<label for="type">类&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;型</label>
							</div>
							<div class="div5-right">
								<input type="radio" name="type" value="1">电子书
								 <input type="radio" name="type" value="2">视频
								 <input type="radio" name="type" value="3">开发工具
							</div>
						</div>
					</div>
				
					<!-- score -->
					<div class="col-xs-6 div3">
						<div class="form-group div4-left">
							<div class="div5-left">
								<label for="score">获得积分</label>
							</div>
							<div class="div5-right">
								<input style="width: 96%;" type="text" class="form-control"
									id="score" name="score" placeholder="请输入积分大小"
									required="required">
							</div>
						</div>
					</div>
					<!-- 文件 -->
					<div class="col-xs-6 div3">
						<div class="form-group div4-left">
							<div class="div5-left">
								<label for="upFile">请上传文件</label>
							</div>
							<div class="div5-right">
								<input style="width: 96%;" type="file" class="form-control"
									 name="upFile" 
									required="required">
							</div>
						</div>
					</div>
					
<!-- 					动态的批量上传  -->
<!-- 					<div class="col-xs-6 div3"> -->
<!-- 						<div class="form-group div4-left"> -->
<!-- 							<div class="div5-left"> -->
<!-- 								<label for="upFile">请上传文件</label> -->
<!-- 							</div> -->
<!-- 							<div class="div5-right"> -->
<!-- 								<input style="width: 96%;" type="file" class="form-control" -->
<!-- 									 name="upFile"  -->
<!-- 									required="required"> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
					

					<!-- 提交与取消 -->
					<div class="col-xs-12"
						style="width: 98%; margin: 15px 1% auto 1%; padding-left: 0px; padding-right: 0px;">
						<div class="col-xs-3"></div>
						<div class="col-xs-3">
							<button type="button" class="btn btn-block btn-info"
								onclick="toSubmit()">上传</button>
						</div>
						<div class="col-xs-3" style="padding-left: 11px;">
							<button type="button" class="btn btn-block" onclick="cancel()">取消</button>
						</div>
						<div class="col-xs-3"></div>
					</div>
				</div>
			</form>
		</div>
	</div>

</body>

<script type="text/javascript">
	function toSubmit(){
		$("#myForm").submit();	
		layer.msg('上传成功！', {
			time : 1000
		});
		setTimeout(function() {
			parent.location.reload();
		},1000);
	}
	function cancel() {
		var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
		parent.layer.close(index);
	}
</script>

