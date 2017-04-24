<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>后台首页</title>
<meta name="keywords" content="huey" />
<meta name="description" content="huey" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<link rel="shortcut icon" href="${ctx }/public/front/images/huey27.ico" />
<link rel="stylesheet" type="text/css"
	href="${ctx }/public/back/stylesheets/iconfont.css" />
<link rel="stylesheet" type="text/css"
	href="${ctx }/public/back/stylesheets/back.css" />
<!-- 页面js -->
<script type="text/javascript"
	data-main="${ctx }/public/back/javascripts/back.js"
	src="${ctx }/public/back/javascripts/require.js"></script>
</head>
<body>


	<!-- header start -->
	<div class="back-header">
		<h1>自己娱乐</h1>
		<ul class="back-nav">
			<li><a href="" title="" target="">首页</a></li>
			<li><a href="" title="" target="">运维</a></li>
			<li><a href="" title="" target="">会员</a></li>
			<li><a href="" title="" target="">分期</a></li>
			<li><a href="" title="" target="">风控</a></li>
			<li><a href="" title="" target="">活期</a></li>
			<li><a href="" title="" target="">财务</a></li> *{
			<li><a href="" title="" target="">客服</a></li>}*
			<li><a href="" title="" target="">推广</a></li>
			<li><a href="" title="" target="">设置</a></li> *{
			<li><a href="" title="" target="">数据</a></li>}*
			<li><a href="" title="" target="">APP</a></li>
			<li><a href="" title="" target="">微信</a></li>
		</ul>
		<div class="back-headerr">
			<span class="back-username"><i class="iconfont">&#xe609;</i>
				${loginUser.name }</span> <a href="" target="_top" class="back-quit"><i
				class="iconfont">&#xe60c;</i>退出</a>
		</div>
	</div>
	<!-- header end -->

	<script type="text/javascript">
		require([ "back" ], function(back) {
			// 头部导航选中效果
			back.navSelected($(".back-nav>li").eq(""));
			// 二级菜单
			back.navSelected($(".back-secnav>li").eq(""));
			//列表隔行换色
			back.listeven($(".back-table tbody"));

		});
	</script>

	<div class="back-footer">
		<span class="left">1111</span> <span class="right">当前版本2222</span>
	</div>

	<!-- main start -->
	<!-- 二级导航 -->
	<ul class="back-secnav"></ul>
	<div class="back-main back-cont">
		<!-- 平台数据统计 -->
		<div class="back-data">
			<p class="back-data-infor">
				<span class="left">数据更新时间： dddd</span> <span class="left">
					平台简讯: <span class="edit-text" maxlength="15">111</span> 2222<i
					data-title="编辑" class="iconfont edit-btn">&#xe602;</i>权限
				</span> <label class="right"> <input type="checkbox"
					checked="checked" onclick="updateIsStatisticsShow($(this))" />前台数据
				</label>
			</p>
			<ul class="back-data-list">
				<li>
					<p>
						<span></span>人
					</p> <i data-title="平台注册会员总数">累计注册会员</i>
				</li>
				<li>
					<p>
						<span></span>个
					</p> <i data-title="放款项目总数">放款项目数量</i>
				</li>
				<li>
					<p>
						<span></span>元
					</p> <i data-title="放款项目的借款总额">放款项目总额</i>
				</li>
				<li>
					<p>
						<span></span>元
					</p> <i data-title="待还理财账单的账单总额">待还总额</i>
				</li>
				<li>
					<p>
						<span></span>元
					</p> <i data-title="所有平台会员的可用余额+冻结总额">平台浮存金</i>
				</li>
			</ul>
			<!-- 数据图表 -->
			<div class="back-data-chart">

				<div class="chart-box left">
					<div class="chart-menu" id="left-menu">
						<a href="javascript:newMembers(1);" class="selected">昨天</a> <a
							href="javascript:newMembers(2);">最近7天</a> <a
							href="javascript:newMembers(3)">最近30天</a>
					</div>
					<div class="chart-area" id="memberDiv"></div>
				</div>

				<div class="chart-box right">
					<div class="chart-menu" id="right-menu">
						<a href="javascript:getMoney(1);" class="selected">昨天</a> <a
							href="javascript:getMoney(2);">最近7天</a> <a
							href="javascript:getMoney(3);">最近30天</a>
					</div>
					<div class="chart-area" id="moneyDiv"></div>
				</div>
			</div>
			<!-- 首页信息列表 -->
			<div class="back-indexnew">
				<div class="back-newlist left">
					<h2 class="back-newlist-head">
						<strong>待办事项</strong>
					</h2>
					<ul class="back-newlist-list back-newlist-list01">
						<li><a href="" target=""><span>初审中项目</span><i
								class="green">1个</i></a></li>
						<li><a href="" target=""><span>满标审核</span><i
								class="green">2个</i></a></li>
						<li><a href="" target=""><span>待放款项目</span><i
								class="green">3个</i></a></li>
						<li><a href="" target=""><span>待审转让项目</span><i
								class="green">4个</i></a></li>
						<li><a href="" target=""><span>待兑换奖励</span><i
								class="green">5个</i></a></li>
						<li><a href="" target=""><span>本月到期借款账单</span><i
								class="green">6期</i></a></li>
						<li><a href="" target=""><span>逾期待还借款账单</span><i
								class="green">7期</i></a></li>
					</ul>
				</div>
				<div class="back-newlist right">
					<h2 class="back-newlist-head">
						<strong>最新动态</strong>
					</h2>
					<ul class="back-newlist-list back-newlist-list02">
						<li>2017-0421 &nbsp;&nbsp;admin<i class="green">吾问无为谓我我我我</i></li>
						<li>2017-0421 &nbsp;&nbsp;admin<i class="green">吾问无为谓我我我我</i></li>
						<li>2017-0421 &nbsp;&nbsp;admin<i class="green">吾问无为谓我我我我</i></li>
						<li>2017-0421 &nbsp;&nbsp;admin<i class="green">吾问无为谓我我我我</i></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	var myChart1 = null;
	var myChart2 = null;
	require([ "back" ], function(back) {
		require([ 'echarts.common.min', 'domReady!' ], function(echarts) {
			myChart1 = echarts.init(document.getElementById('memberDiv'));
			myChart2 = echarts.init(document.getElementById('moneyDiv'));
			myChart1.setOption(option1);
			myChart2.setOption(option2);
			newMembers(1);
			getMoney(1);
		});

		require([ "textedit" ], function(textedit) {
			var btn = $(".edit-btn"), text = $("span").find(".edit-text");
			function fn() {
				var ajaxPath = "", ajaxData = {
					"trailer" : text.children("input").val()
				};
				textedit(btn, text, ajaxPath, ajaxData);
			}
			btn.click(fn);
			text.on('keydown', '.edit-input', function(event) {
				if (event.keyCode == "13") {
					fn();
				}
			});
		});
		$(".chart-menu a").click(
				function() {
					if (!$(this).hasClass("selected")) {
						$(this).addClass("selected").siblings().removeClass(
								"selected");
					}
				});
	});

	function updateIsStatisticsShow(obj) {
		var flag = false;
		if (obj.is(':checked')) {
			flag = true;
		}
		$.ajax({
			url : "",
			type : "POST",
			data : {
				"flag" : flag
			},
			dataType : "json",
			success : function(result) {
				var flag = interceptorCheck(result);
				if (!flag) {
					return;
				}
				if (result.code < 1) {
					alert(result.msg);
				} else {
					weakDialog(result.msg);
				}
			}
		});
	}
</script>
<script type="text/javascript">
	// option1和option2分别是两个空的echart折线图，首次加载完成后，后面更新数据即可
	var option1 = {
		tooltip : {
			trigger : 'axis'
		},
		toolbox : {
			show : true,
			feature : {
				magicType : {
					type : [ 'line', 'bar' ]
				},
				dataView : {},
				restore : {},
				saveAsImage : {
					pixelRatio : 2,
					name : '新增会员统计图'
				}
			},
			right : '5%',
		},
		legend : {
			padding : 5,
			itemGap : 15,
			bottom : '0',
			data : [ "新增理财会员", "新增注册会员" ],
			textStyle : {
				fontSize : 14
			}
		},
		grid : {
			width : "85%",
			height : "250px",
			x : "9%",
			y : "13%"
		},
		xAxis : {
			type : 'category',
			boundaryGap : false,
			splitLine : {
				show : false
			},
			data : []
		},
		yAxis : {
			name : "（单位：人）",
			type : 'value',
			boundaryGap : [ 0, 0.1 ],
			minInterval : 1
		},
		series : [ {
			name : '新增理财会员',
			type : 'line',
			stack : '总量',
			data : []
		}, {
			name : '新增注册会员',
			type : 'line',
			stack : '总量',
			data : []
		} ]
	};
	var option2 = {
		tooltip : {
			trigger : 'axis'
		},
		toolbox : {
			show : true,
			feature : {
				magicType : {
					type : [ 'line', 'bar' ]
				},
				dataView : {},
				restore : {},
				saveAsImage : {
					pixelRatio : 2,
					name : '新增金额统计图'
				}
			},
			right : '5%',
		},
		legend : {
			padding : 5,
			itemGap : 10,
			bottom : '0',
			data : [ "新增投资金额", "新增充值金额" ],
			textStyle : {
				fontSize : 14
			}
		},
		grid : {
			width : "85%",
			height : "250px",
			x : "9%",
			y : "13%"
		},
		xAxis : {
			type : 'category',
			splitLine : {
				show : false
			},
			data : [],
			axisLabel : {
				show : true,
			}
		},
		yAxis : {
			name : "（单位：元）",
			boundaryGap : [ 0, 0.1 ],
			type : 'value',
			minInterval : 100,
			axisLabel : {
				formatter : function(value) {
					if (value >= 10000 && value < 100000000) {
						value = value / 10000;
						value = value.toFixed(2);
						return value + "万";
					} else if (value >= 100000000 && value < 1000000000000.00) {
						value = value / 100000000;
						value = value.toFixed(2);
						return value + "亿";
					} else if (value >= 1000000000000.00) {
						value = value / 1000000000000.00;
						value = value.toFixed(2);
						return value + "万亿";
					} else {
						return value;
					}
				}
			}
		},
		series : [ {
			name : '新增投资金额',
			type : 'line',
			data : []
		}, {
			name : '新增充值金额',
			type : 'line',
			data : []
		} ]
	};
	function newMembers(num) {
		myChart1.showLoading();
		$.ajax({
			url : "",
			type : "get",
			data : {
				"type" : num,
				"position" : 'left'
			},
			dataType : "json",
			success : function(data) {
				myChart1.setOption({
					xAxis : {
						data : data.axis
					},
					series : [ {
						data : data.mapData.financia
					}, {
						data : data.mapData.register
					} ]
				});
				myChart1.hideLoading();
			}
		});
	}
	function getMoney(num) {
		myChart2.showLoading();
		$.ajax({
			url : "",
			type : "get",
			data : {
				"type" : num,
				"position" : 'right'
			},
			dataType : "json",
			success : function(data) {
				myChart2.setOption({
					xAxis : {
						data : data.axis
					},
					series : [ {
						data : data.mapData.invest
					}, {
						data : data.mapData.recharger
					} ]
				});
				myChart2.hideLoading();
			}
		});
	}
</script>
</html>