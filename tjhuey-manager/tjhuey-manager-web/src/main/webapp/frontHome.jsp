<%@page import="org.tjhuey.common.utils.AdvertisementUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>huey</title>

		<link rel="shortcut icon" href="${ctx }/public/front/images/huey27.ico"/>
		<!-- 皮肤背景、颜色 -->
		<link rel="stylesheet" type="text/css" href="${ctx }/public/front/stylesheets/skitter.styles.css" />
		<link rel="stylesheet" type="text/css" href="${ctx }/public/front/stylesheets/front_new.css" />
		
		<link rel="stylesheet" type="text/css" href="${ctx}/public/front/stylesheets/front.css" />
		<!-- 皮肤背景、颜色 -->
		<link rel="stylesheet" type="text/css" href="${ctx}/public/front/themes/default/background.css" />
		<link rel="stylesheet" type="text/css" href="${ctx}/public/front/themes/default/color.css" />
		<link rel="stylesheet" type="text/css" href="${ctx}/public/front/stylesheets/footer.css" />
		<link rel="stylesheet" type="text/css" href="${ctx}/public/front/stylesheets/animate.min.css" />
		<link rel="stylesheet" type="text/css" href="${ctx }/public/front/themes/color.css" />
		
		<script type="text/javascript" src="${ctx }/public/front/javascripts/jquery-1.10.2.min.js"></script>
		<script type="text/javascript" data-main="${ctx }/public/front/javascripts/front.js" src="${ctx }/public/front/javascripts/require.js" ></script>
		<!-- TODO t时间戳 -->
		<style type="text/css">
			video {width: 20px;}
		</style>
</head>
<body>
	
	<!-- header start -->
		<div class="header">
			<div class="top">
				<div class="container">
					<p class="left q-inxtopp" style="font-weight: normal;"><i class="q-indxtopion"></i>个人电话：15531001283&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(&nbsp;联系时间&nbsp;:&nbsp;7:30-21:30&nbsp;)</p>
					<div class="right">
						<div class="mobile-app left">
							<i class="icon appicon"></i>关注微信
							<div class="moblie-app-dropbox">
								<i class="icon"></i>
								<img src="${ctx }/public/front/images/wxgzh.jpg" width="80" height="80" title="扫描关注微信公众号" alt="扫描关注微信公众号" />
								<p>扫码关注</p>
							</div>
						</div>
							<i class="left split-line"></i>
							<a class="left" href="" target="" title="">后台管理</a>
							<i class="left split-line"></i>
							<a class="left dengL" href="" target="" title="">xxx</a>
							<i class="left split-line"></i>
							<a class="left" href="" target="" title="">xxx</a>
					</div>
					
				</div>
			</div>
			<div class="navbox">
				<div class="navbox-innerbox">
					<div class="container clearfix">
						<a href="" class="logo left" title="" target="" >
							<img src="${ctx }/public/front/images/wxgzh.jpg" alt="" height="44px"/>
							
						</a>
						<ul class="nav right">
							<li><a href="#" title="" target="" >首页</a></li>
							<li><a href="#" title="" target="" >日常随笔</a></li>
							<li><a href="#" title="" target="" >生活印迹</a></li>
							<li><a href="#" title="" target="" >职业学习</a></li>
							<li><a href="#" title="" target="" >个人统计</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	<!-- header end -->


	<!-- bannner start -->
	<c:if test="${not empty banners}">
		<div class="banner">
			<div class="box_skitter">
				<ul>
					<c:forEach items="${banners }" var="banner">
						<c:if test="${banner.url != null && banner.url != ''}">
							<li>
								<a href="${banner.url}" target="">
									<img src="${ctx }${banner.imageUrl}" class="<%=AdvertisementUtil.getRandmonClass() %>" />
								</a>
							</li>
						</c:if>
						<c:if test="${banner.url == null || banner.url == ''}">
							<li>
								<a href="javascript:void(0)">
									<img src="${ctx }${banner.imageUrl}" class="<%=AdvertisementUtil.getRandmonClass() %>" />
								</a>
							</li>
						</c:if>
					</c:forEach>
				</ul>
			</div>
		</div>
	</c:if>
	<!-- bannner end -->
	
	<!-- music -->
	<video src="${ctx }/public/front/videos/adjsn.mp3" loop="loop" autoplay="autoplay"></video>
	
	<!-- index main -->
	<div class="container">
		
		<h2 class="f-index-title f-mb20"><img src="">日常随笔<a href="">更多随笔>></a></h2>
		<!-- 新手专享(体验标) start  -->
				<div class="newbie q-bgfff">
					<div class="index-proimg newbie-img left"></div>
					<ul class="disperse-list">
						<li onclick="javascript:window.location.href='#'">
							<h3 class="product-title clearfix"><a href="">000&nbsp;&nbsp;title</a></h3>
							<ul class="product-list left">
								<li>
									<span class="assistant datacont"><strong>20</strong>%</span>
									<p class="datatitle c9">年利率</p>
								</li>
								<li>
									<span class="datacont c3">30天</span>
									<p class="datatitle c9">期限</p>
								</li>
								<li>
									<span class="datacont c3">无限制</span>
									<p class="datatitle c9">可投</p>
								</li>
								<li>
									<span class="datacont c3">一次性</span>
									<p class="datatitle c9">还款方式</p>
								</li>
								<li class="product-last">
										<a href="" class="btn product-btn q-xsbtn">立即购买</a>
									<p class="datatitle c9">加入<b>&nbsp;20&nbsp;</b>人次</p>
								</li>
							</ul>
						</li>
					</ul>
				</div>
				<hr/>
	</div>
			<!-- 新手专享(体验标) end  -->
			
	 <!-- lookup start -->
	 <div class="indexRankDiv">
        <h2>本周随笔浏览排名：</h2>
        <div class="indexRankBox" >
            <div class="indexRankTit">
                <span class="indexRTSpan1">排名</span>
                <span class="indexRTSpan2">用户名</span>
                <span class="indexRTSpan3">手机号</span>
                <span class="indexRTSpan4">邮箱</span>
            </div>
            <div class="indexRankUL" id="indexRankBox">
                <ul>
                    <li>
	                    <span class="indexRTUlSpan1">11</span>
	                    <span class="indexRTUlSpan2">huey1</span>
	                    <span class="indexRTUlSpan3">155310012831</span>
	                    <span class="indexRTUlSpan4">tjhuey@163.com1</span>
                    </li>
                    <li>
	                    <span class="indexRTUlSpan1">22</span>
	                    <span class="indexRTUlSpan2">huey2</span>
	                    <span class="indexRTUlSpan3">155310012832</span>
	                    <span class="indexRTUlSpan4">tjhuey@163.com2</span>
                    </li>
                </ul>
            </div>
        </div>
    </div>
	<!-- lookup end -->
			
			
		<div class="container">
		
			<h2 class="f-index-title f-mb20"><img src="">职业学习</h2>
			<div class="productsStatic">
	        <div class="proStaLeft">
	            <h1>学习之路</h1>
	            <p>付出不亚于任何人的努力</p>
	        </div>
      		<div class="proStaRight">         
	              <div class="proStaRightBody">
	                <div class="proStsRightDiv1">
	                    <p class="proStsRP1"><span>定投宝</span>001期</p>
	                    <p class="proStsRP2"><span> 10计划</span> 天自动理财</p>
	                </div>
					<div class="proStsRightDiv2">
	                    <p class="proStsRightP1">年化收益率<span>10%</span></p>
	                    <p class="proStsRightP2">募集金额<span>13</span></p>
	                    <div class="proStsRightP3">
		                    <em>募集进度</em><span>10%</span>
		                    <p class="proProgress"><i style="width: 40%;"></i></p>
	                    </div>
				 	 		<a href="" class="proButton2" >回款完毕</a>
	                </div>
	                <div class="proStsRightDiv3">
	                    <p class="proStsRP3"><img src="" alt=""/>当日计息、资金安全</p>
	                    <p class="proStsRP4"><img src="" alt=""/>一次性返还本金和收益</p>
	                </div>
	                </div>
	                <div class="proStaProductList">
		                <div class="proStaRightBody">
			                <div class="proStsRightDiv1">
			                    <p class="proStsRP1"><span>定投宝</span>001期</p>
			                    <p class="proStsRP2"><span> 10计划</span> 天自动理财</p>
			                </div>
			            
							<a href="" class="proButton2" >审核中</a>
			                
			                <div class="proStsRightDiv3">
			                    <p class="proStsRP3"><img src="" alt=""/>当日计息、资金安全</p>
			                    <p class="proStsRP4"><img src="" alt=""/>一次性返还本金和收益</p>
			                </div>
		                </div>
	                </div>
            </div>
	        <a href="" class="proInvestBtn">查看更多></a>
       	 </div>	
		</div>		
				
		<!-- index news -->
		<div class="container">
			<div class="index-news clearfix">
				<h2 class="f-index-title f-mb20"><img src="">资讯<a href="">更多资讯>></a></h2>
			<!--  媒体报道 - -->
			
				<!--  理财故事，如果理财故事为空，则取媒体报道前两条 - -->
				<div class="index-newbox left">
					<a href="" title="" target="_blank" class="index-newimg">					
						<img src="${ctx }/public/front/images/newsimg01.jpg"   width="374" height="172" class="lazy"/>
					</a>
					<dl class="index-newmain">
						<dt class="index-newtitle"><a href="" title="" target="_blank">title</a></dt>
						<dd class="index-newinfor">
							<span class="c3">IT之家</span><i class="c3">·</i><span class="c9">2015.02.04</span>
						</dd>
						<a href="" target="_blank">
							<dd class="c9 index-newcont" limit="80">
								对方的说法对方的说法对方的说法对方的说法对方的说法对方的说法对方的说法对方的说法
								对方的说法对方的说法对方的说法对方的说法对方的说法对方的说法对方的说法对方的说法对方的说法
	
							</dd>
						</a>
						<dd class="index-newhandle clearfix">
							<span class="handle-btn left" title="浏览次数">
								<i class="icon haveseen-icon"></i>
								10
							</span>
							<!-- 点赞前 -->
							<a href="javascript: void(0);" class="handle-btn praise-btn left" title="赞一个" >
								<input type="hidden" value="" />
								<i class="praise-icon icon"></i>
								<i class="praise-count">2</i>
							</a>
							<i class="handleplit left"></i>
							<a href="" title="分享到新浪微博" class="shareto-sina handle-share left">
								<i class="icon sina-icon"></i>
							</a>
							<div class="shareto-wechat handle-share left" title="分享到朋友圈">
								<i class="icon wechat-icon"></i>
								<div class="shareto-wechat-upbox">
									<i></i>
									<i></i>
									<div class="code-area"></div>
									<input type="hidden" class="code-url" value="">
								</div>
							</div>
							<a href="" class="handle-share shareto-qqspace left" title="分享到QQ空间">
								<i class="icon qqspace-icon"></i>
							</a>
						</dd>
					</dl>
				</div>
				<div class="index-newbox left">
					<a href="" title="" target="_blank" class="index-newimg">					
						<img src="${ctx }/public/front/images/newsimg01.jpg"   width="374" height="172" class="lazy"/>
					</a>
					<dl class="index-newmain">
						<dt class="index-newtitle"><a href="" title="" target="_blank">title</a></dt>
						<dd class="index-newinfor">
							<span class="c3">IT之家</span><i class="c3">·</i><span class="c9">2015.02.04</span>
						</dd>
						<a href="" target="_blank">
							<dd class="c9 index-newcont" limit="80">
								对方的说法对方的说法对方的说法对方的说法对方的说法对方的说法对方的说法对方的说法
								对方的说法对方的说法对方的说法对方的说法对方的说法对方的说法对方的说法对方的说法对方的说法
								对方的说法对方的说法对方的说法
							</dd>
						</a>
						<dd class="index-newhandle clearfix">
							<span class="handle-btn left" title="浏览次数">
								<i class="icon haveseen-icon"></i>
								10
							</span>
							<!-- 点赞前 -->
							<a href="javascript: void(0);" class="handle-btn praise-btn left" title="赞一个" >
								<input type="hidden" value="" />
								<i class="praise-icon icon"></i>
								<i class="praise-count">2</i>
							</a>
							<i class="handleplit left"></i>
							<a href="" title="分享到新浪微博" class="shareto-sina handle-share left">
								<i class="icon sina-icon"></i>
							</a>
							<div class="shareto-wechat handle-share left" title="分享到朋友圈">
								<i class="icon wechat-icon"></i>
								<div class="shareto-wechat-upbox">
									<i></i>
									<i></i>
									<div class="code-area"></div>
									<input type="hidden" class="code-url" value="">
								</div>
							</div>
							<a href="" class="handle-share shareto-qqspace left" title="分享到QQ空间">
								<i class="icon qqspace-icon"></i>
							</a>
						</dd>
					</dl>
				</div>

	
				<!-- 资讯 -->
				<div class="index-newsmore right">
					<h2><span class="left">排行</span><a href="" class="right newsmore" target="_blank">更多<i>&gt;</i></a></h2>
					<ul class="index-newlist">		
						<li>
							<i class="recticon"></i>
							<a href="" title="" target="_blank">
								<span class="left">title</span>
								<span class="right">date</span>
							</a>
						</li>
						<li>
							<i class="recticon"></i>
							<a href="" title="" target="_blank">
								<span class="left">title</span>
								<span class="right">date</span>
							</a>
						</li>
						<li>
							<i class="recticon"></i>
							<a href="" title="" target="_blank">
								<span class="left">title</span>
								<span class="right">date</span>
							</a>
						</li>
						<li>
							<i class="recticon"></i>
							<a href="" title="" target="_blank">
								<span class="left">title</span>
								<span class="right">date</span>
							</a>
						</li>
						<li>
							<i class="recticon"></i>
							<a href="" title="" target="_blank">
								<span class="left">title</span>
								<span class="right">date</span>
							</a>
						</li>
						<li>
							<i class="recticon"></i>
							<a href="" title="" target="_blank">
								<span class="left">title</span>
								<span class="right">date</span>
							</a>
						</li>
						<li>
							<i class="recticon"></i>
							<a href="" title="" target="_blank">
								<span class="left">title</span>
								<span class="right">date</span>
							</a>
						</li>
					</ul>
				</div>
			</div>
			<div class="q-hbbiv"></div>
	</div>
	<!-- index news end -->	

	<!-- footer start -->
	<div id="footer">
	    <div class="f_con">
	        <div class="f_desc">
	            <dl>
	      	         <dt>关于奔跑在IT之路</dt>
	                <dd><a href="#">了解奔跑在IT之路</a></dd>
	                <dd><a href="#">加入奔跑在IT之路</a></dd>
	       	      	<dd><a href="#">联系我们的组织</a></dd>
	            </dl>
	
	            <dl>
	                <dt>学习资讯</dt>
	                <dd><a href="#">友好链接</a></dd>
	                <dd><a href="#">就业指南</a></dd>
	            </dl>
	
	            <dl>
	                <dt>服务中心</dt>
	                <dd><a href="#">安卓APP</a></dd>
	                <dd><a href="#">IOS APP</a></dd>
	            </dl>
	
	            <dl>
	                <dt>关注我们</dt>
	                <dd>
	                    <a href="#" class="share f_wb"></a>
	                    <a href="#" class="share f_qq"></a>
	                </dd>
	            </dl>
	        </div>
	
	        <div class="f_tel">
	            <div class="f_qrcode">
	                <img src="${ctx }/public/front/images/wxgzh.jpg" alt="IT之路微信" width="102" height="127" />
	            </div>
	
	            <div class="f_time">
	                <p class="f_phone">400-009-6359</p>
	                <p class="f_price">
	              	     <span>周一至周六 9:30-23:00</span>
	                    <span>（仅收市话费）</span>
	                </p>
	                <p class="f_mm">24小时在线客服</p>
	            </div>
	        <div class="clear"></div>
	    </div>
	</div>
	</div>
	<!-- footer end -->

<!-- copyright start -->
<div class="copyright">
    Copyright &copy; 2016-2020 www.benpaoitroad.com All Rights Reserved 版权所有：北京数据之眼有限公司 备案号：备11111024号
</div>

	
	<!-- 页面js -->
	<script type="text/javascript">
		
		/* 轮播 */
		require(['front'],function(front){
			require(['slideleft','banner','share'])
		});
		 //下拉列表
       $('.productsStatic').hover(function(){
           $('.proStaProductList').stop().slideDown();
       },function(){
           $('.proStaProductList').stop().slideUp();
       });

       var area1 = document.getElementById('indexRankBox');
       var iliHeight = 28;//单行滚动的高度
       var speed = 50;//滚动的速度
       var time1;
       var delay = 1500;//设置延迟执行时间
       area1.scrollTop = 0;
       area1.innerHTML += area1.innerHTML;//克隆一份一样的内容
       function startScroll1() {
           time1 = setInterval("scrollUp1()", speed);
           area1.scrollTop++;
       }
       function scrollUp1() {
           if (area1.scrollTop % iliHeight == 0) {
               //如果当前滚动高度为单行高度的倍数
               clearInterval(time1);
               setTimeout(startScroll1, delay);//延迟执行2000毫秒
           } else {
               area1.scrollTop++;
               if (area1.scrollTop >= area1.scrollHeight / 2) {
                   area1.scrollTop = 0;
               }
           }
       }
       setTimeout(startScroll1, delay);
  
	</script>
</body>
</html>