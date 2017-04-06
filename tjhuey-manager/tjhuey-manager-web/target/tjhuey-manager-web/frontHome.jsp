<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 皮肤背景、颜色 -->
<!-- TODO t时间戳 -->
<style type="text/css">
.banner{
	position: relative;
	overflow: hidden;
	height: 400px;
}
.box_skitter {
	position: relative;
	width: 1920px;
	height: 400px;
	background: #000;
	left: 50%;
	margin-left: -960px;
}

</style>
</head>
<body>
	<!-- bannner start -->
	<c:if test="${not empty banners}">
		<div class="banner">
			<div class="box_skitter">
				<ul>
					<c:forEach items="${banners }" var="banner">
						<c:if test="${banner.url != null && banner.url != ''}">
							<li>
								<a href="${banner.url}" target="">
									<img src="${banner.imageUrl}" class="${randomClass}" />
								</a>
							</li>
						</c:if>
						<c:if test="${banner.url == null || banner.url == ''}">
							<li>
								<a href="javascript:void(0)">
									<img src="${banner.imageUrl}" class="${randomClass}" />
								</a>
							</li>
						</c:if>
					</c:forEach>
				</ul>
			</div>
		</div>
	</c:if>
	<!-- bannner end -->
	<c:forEach items="${supervisors }" var="supervisor">
			${supervisor.name }
	</c:forEach>
</body>
</html>