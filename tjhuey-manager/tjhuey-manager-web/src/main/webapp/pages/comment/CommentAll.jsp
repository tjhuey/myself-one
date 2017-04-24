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
<script type="text/javascript"
	src="${ctx}/static/js/xhEditor/jquery/jquery-1.4.4.min.js"></script>
<script type="text/javascript"
	src="${ctx }/static/js/xhEditor/xheditor-1.1.14-zh-cn.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#content").xheditor({
			tools : 'full',
			skin : 'o2007silver',
			emots : {
				pidgin : {
					name : '头像1',
					width : 22,
					height : 25,
					line : 8,
					list : {
						smile : '微笑',
						cute : '可爱',
						wink : '眨眼',
						laugh : '大笑',
						victory : '胜利',
						sad : '伤心',
						cry : '哭泣',
						angry : '生气',
						shout : '大骂',
						curse : '诅咒',
						devil : '魔鬼',
						blush : '害羞',
						tongue : '吐舌头',
						envy : '羡慕',
						cool : '耍酷',
						kiss : '吻',
						shocked : '惊讶',
						sweat : '汗',
						sick : '生病',
						bye : '再见',
						tired : '累',
						sleepy : '睡了',
						question : '疑问',
						rose : '玫瑰',
						gift : '礼物',
						coffee : '咖啡',
						music : '音乐',
						soccer : '足球',
						good : '赞同',
						bad : '反对',
						love : '心',
						brokenheart : '伤心'
					}
				},
				msn : {
					name : 'MSN',
					count : 40,
					width : 22,
					height : 22,
					line : 8
				},
				ipb : {
					name : 'IPB',
					width : 20,
					height : 25,
					line : 8,
					list : {
						smile : '微笑',
						joyful : '开心',
						laugh : '笑',
						biglaugh : '大笑',
						w00t : '欢呼',
						wub : '欢喜',
						depres : '沮丧',
						sad : '悲伤',
						cry : '哭泣',
						angry : '生气',
						devil : '魔鬼',
						blush : '脸红',
						kiss : '吻',
						surprised : '惊讶',
						wondering : '疑惑',
						unsure : '不确定',
						tongue : '吐舌头',
						cool : '耍酷',
						blink : '眨眼',
						whistling : '吹口哨',
						glare : '轻视',
						pinch : '捏',
						sideways : '侧身',
						sleep : '睡了',
						sick : '生病',
						ninja : '忍者',
						bandit : '强盗',
						police : '警察',
						angel : '天使',
						magician : '魔法师',
						alien : '外星人',
						heart : '心动'
					}
				}
			}
		});
	});
</script>

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
	<form action="${ctx }/comment/insert" method="post">
		<input type="hidden" name="resourceId" value="${resourceId }" /> <input
			type="hidden" name="userId" value="${loginUser.userId }" />
		<table align="center" width="800" border="1" cellpadding="10"
			cellspacing="1">
			<tr>
				<td>标题:<input type="text" name="title" /></td>
			</tr>
			<tr>
				<td><textarea rows="10" cols="120" name="content" id="content"></textarea>
				</td>
			</tr>
			<tr>
				<td><input type="submit" value="添加评论" /></td>
			</tr>
		</table>
	</form>
</body>
</html>