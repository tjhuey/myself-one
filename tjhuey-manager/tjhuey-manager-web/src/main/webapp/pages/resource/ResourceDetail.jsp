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
			<form role="form" id="myForm">
				<div class="div2">


					<!-- 详情 -->
					<div class="col-xs-6 div3">
						<div class="form-group div4-left">
							<div class="text-danger">
								${detail }
							</div>
						</div>
					</div>

					

				</div>
			</form>
		</div>
	</div>

</body>


