<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta na=me= "viewport" content="width=device-width, initial-scale=1">
<title>Welcome</title>
<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/animate.min.css" rel="stylesheet">
<title>IT之路</title>

<style>
@font-face {
	
}

body {
	height: 120%;
	background-color: darkred;
}

.toIndex:hover {
	color: #d43f3a;
}

/*打字机*/
#ticker {
	height: 12em;
	padding: 0.6em 0;
	margin: 0 0 1.8em 0;
	border-top: 3px solid #efefef;
	border-bottom: 3px solid #efefef;
	position: relative;
}

#ticker .cursor {
	display: inline-block;
	background: #565c61;
	width: 0.6em;
	height: 1em;
	text-align: center;
}

#ticker p {
	margin-bottom: 0.8em;
}

#ticker code {
	margin: 0.4em 0.4em;
	display: block;
}

#ticker .next {
	position: absolute;
	bottom: 1em;
}
</style>
<script type="text/javascript" SRC="js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" SRC="js/jquery.jticker.js"></script>
<script type="text/javascript">
	/*30秒去首页*/
	function toIndex() {
		window.location = "${ctx}/index.jsp";
	}

	setInterval(toIndex, 20000000);
	jQuery(document).ready(function() {
		// Instantiate jTicker
		jQuery("#ticker").ticker({
			cursorList : " ",
			rate : 10,
			delay : 4000
		}).trigger("play").trigger("stop");

		// Trigger events
		jQuery(".stop").click(function() {
			jQuery("#ticker").trigger("stop");
			return false;
		});

		jQuery(".play").click(function() {
			jQuery("#ticker").trigger("play");
			return false;
		});

		jQuery(".speedup").click(function() {
			jQuery("#ticker").trigger({
				type : "control",
				item : 0,
				rate : 10,
				delay : 4000
			})
			return false;
		});

		jQuery(".slowdown").click(function() {
			jQuery("#ticker").trigger({
				type : "control",
				item : 0,
				rate : 90,
				delay : 8000
			})
			return false;
		});

		jQuery(".next").live("click", function() {
			jQuery("#ticker").trigger({
				type : "play"
			}).trigger({
				type : "stop"
			});
			return false;
		});

		jQuery(".style").click(function() {
			jQuery("#ticker").trigger({
				type : "control",
				cursor : jQuery("#ticker").data("ticker").cursor.css({
					width : "4em",
					background : "#efefef",
					position : "relative",
					top : "1em",
					left : "-1em"
				})
			})
			return false;
		});

	});
</script>
</head>
<body>
	<div  class="text-center animated bounceInRight">
				<h1><span class="text-danger" style="color:white;">奔跑在IT之路_Resource Share</span></h1>
	</div>
	
		<video src="video/before.mp3" loop="loop" autoplay="autoplay"></video>
			
	<div class="container">
		<!--背景音乐-->
		<div class="row">
			<div id="ticker" style="color: white">
				<div>
					<h3>What do we do?</h3>

					<p>
						Computer,起源于2014年11月，由几个热爱编程的年轻人共同创立，截止目前，已有千人规模，并更名为IT前沿技术交流协会，拥有分群数个。奔跑在IT之路公众号由群内人士自发维护并发表推文，进一步促进交流
						，将各技术贴及行业趣闻共享交流，诣在打造共享的交流平台，主要你在IT之路上，我们将与你共同前行！</p>

					<p>来我们伟大的奔跑it之路组织吧.</p>
					<a class="next btn btn-danger col-md-offset-11" href="#">next</a>
				</div>
				<div>
					<h3>What do we do?</h3>

					<p>
						Computer,起源于2014年11月，由几个热爱编程的年轻人共同创立，截止目前，已有千人规模，并更名为IT前沿技术交流协会，拥有分群数个。奔跑在IT之路公众号由群内人士自发维护并发表推文，进一步促进交流
						，将各技术贴及行业趣闻共享交流，诣在打造共享的交流平台，主要你在IT之路上，我们将与你共同前行！</p>

					<p>来我们伟大的奔跑it之路组织吧.</p>
					<a class="next btn btn-danger col-md-offset-11" href="#">next</a>
				</div>
				<div>
					<h3>What do we do?</h3>

					<p>
						Computer,起源于2014年11月，由几个热爱编程的年轻人共同创立，截止目前，已有千人规模，并更名为IT前沿技术交流协会，拥有分群数个。奔跑在IT之路公众号由群内人士自发维护并发表推文，进一步促进交流
						，将各技术贴及行业趣闻共享交流，诣在打造共享的交流平台，主要你在IT之路上，我们将与你共同前行！</p>

					<p>来我们伟大的奔跑it之路组织吧.</p>
					<a class="next btn btn-danger col-md-offset-11" href="#">next</a>
				</div>

				<div>
					<h3>What do we do?</h3>

					<p>
						Computer,起源于2014年11月，由几个热爱编程的年轻人共同创立，截止目前，已有千人规模，并更名为IT前沿技术交流协会，拥有分群数个。奔跑在IT之路公众号由群内人士自发维护并发表推文，进一步促进交流
						，将各技术贴及行业趣闻共享交流，诣在打造共享的交流平台，主要你在IT之路上，我们将与你共同前行！</p>

					<p>来我们伟大的奔跑it之路组织吧.</p>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="animated bounceInLeft toIndex col-md-8 col-md-offset-2">
				<p class="caption">
				<h2 class="swing" style="color: white">
					欢迎来到Computer共享网站，在这里我们提供<span style="font-size: larger;">各种资源</span>，只要你努力，你也能自学成为
					<span style="font-size: larger">大神!</span>
				</h2>
				
			</div>
			<div class="toIndex col-md-7 col-md-offset-2">
				<div style="height: 120px;"></div>
				<div class="text-center">
					<a class="btn  btn-lg tondex" href="${ctx }/index.jsp">让我带您去首页...</a>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>