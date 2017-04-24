<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />
<script src="${ctx }/static/js/jquery.js" type="text/javascript"></script>
<script src="${ctx }/static/js/left/jquery-accordion-menu.js"
	type="text/javascript"></script>
<link href="${ctx }/static/css/left/jquery-accordion-menu.css"
	rel="stylesheet" type="text/css" />
<link href="${ctx }/static/css/fontawesome/css/font-awesome.css"
	rel="stylesheet" type="text/css" />
<style type="text/css">
.content {
	width: 200px;
	margin: 0px auto;
}

.filterinput {
	background-color: rgba(249, 244, 244, 0);
	border-radius: 15px;
	width: 90%;
	height: 30px;
	border: thin solid #FFF;
	text-indent: 0.5em;
	font-weight: bold;
	color: #FFF;
}

#demo-list a {
	font-family: SimHei;
	font-size: 15px;
	/* 	font-weight: bold; */
	overflow: hidden;
	text-overflow: ellipsis;
	-o-text-overflow: ellipsis;
	white-space: nowrap;
	width: 100%;
}
</style>


<script type="text/javascript">
	jQuery(document).ready(function() {
		jQuery("#jquery-accordion-menu").jqueryAccordionMenu();

	});

	$(function() {
		//顶部导航切换
		$("#demo-list li").click(function() {
			$("#demo-list li.active").removeClass("active")
			$(this).addClass("active");
		})
	})
</script>

<div class="content panel" id="left-panel" menuicon="#menuicon-span">
	<div id="jquery-accordion-menu" class="jquery-accordion-menu blue">
		<ul id="demo-list">
			<li class="active"><a href="${ctx }/pages/index.jsp"><i
					class="fa fa-home"></i>主页</a></li>
			<!-- 管理员可视 -->
			<c:if test="${loginUser.authority <2 }">
				<li><a href="${ctx }/admin/queryAllAdmin"><i
						class="fa fa-cog"></i>管理员管理 </a>
			</c:if>
			<c:if test="${loginUser.authority < 3}">
			<li><a href="#"><i class="fa fa-cog"></i>用户管理 </a>
				<ul class="submenu">
					<li><a href="${ctx }/user/queryAllUser?authority=4">普通用户管理</a></li>
					<li><a href="${ctx }/user/queryAllUser?authority=3">会员用户管理</a></li>
				</ul>
			</li>
			</c:if>
			<c:if test="${loginUser.authority < 3}">
			<li><a href="${ctx }/resource/queryAllResource"><i class="fa fa-cog"></i>资源管理 </a></li>
			</c:if>
			<c:if test="${loginUser.authority > 2}">
			<li><a href="${ctx }/resource/queryAllResource"><i class="fa fa-cog"></i>资源信息 </a></li>
			</c:if>
			<c:if test="${loginUser.authority < 3}">
				<li><a href="${ctx }/comment/queryAllCommentAdmin"><i class="fa fa-cog"></i>评论管理 </a></li>
			</c:if>
			<c:if test="${loginUser.authority > 2}">
				<li><a href="${ctx}/resource/queryAllResource/${loginUser.userId}"><i class="fa fa-cog"></i>我的资源 </a></li>
			</c:if>
			<li><a href="#"><i class="fa fa-user"></i>其他相关</a></li>
			<li><a href="#"><i class="fa fa-envelope"></i>关于我们</a></li>
		</ul>
	</div>
</div>

<script type="text/javascript">
	(
			function($) {
				$.expr[":"].Contains = function(a, i, m) {
					return (a.textContent || a.innerText || "").toUpperCase()
							.indexOf(m[3].toUpperCase()) >= 0;
				};
				function filterList(header, list) {
					//@header 头部元素
					//@list 无需列表
					//创建一个搜素表单
					var form = $("<form>").attr({
						"class" : "filterform",
						action : "#"
					}), input = $("<input>").attr({
						"class" : "filterinput",
						type : "text"
					});
					$(form).append(input).appendTo(header);
					$(input).change(
							function() {
								var filter = $(this).val();
								if (filter) {
									$matches = $(list).find(
											"a:Contains(" + filter + ")")
											.parent();
									$("li", list).not($matches).slideUp();
									$matches.slideDown();
								} else {
									$(list).find("li").slideDown();
								}
								return false;
							}).keyup(function() {
						$(this).change();
					});
				}
				$(function() {
					filterList($("#form"), $("#demo-list"));
				});
			})(jQuery);
</script>