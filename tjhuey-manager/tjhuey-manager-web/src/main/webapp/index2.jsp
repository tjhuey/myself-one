<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="zh-cn" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Welcome</title>
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">


    <style>
        /*缩小自适应*/
        @media screen and (max-width: 768px) {
            .myform .form-control {
                display: inline-block;
                width: 60%;
            }
        }

        /*logo 选项*/
        .navbar-nav li {
            width: 180px;
        }

        .navbar-header {
            width: 200px;
        }

        /*固定式侧边*/
        .side-nav {
            position: fixed;
            top: 45%;
            right: 20px;
            z-index: 1;
        }

        .side-nav ul.nav-side-nav {
            text-align: center;
            list-style: none;
            margin: 0;
            padding-left: 0;
        }

        .side-nav ul.nav-side-nav > li > a {
            display: block;
            width: 10px;
            height: 10px;
            border-radius: 50%;
            background: red;
            transition: .5s;
        }

        .side-nav ul.nav-side-nav > li {
            display: block;
            line-height: 1.45em;
            margin: 0;
            padding: 8px 0;
        }

        /*图片轮播*/
        .carousel {
            height: 400px;
        }

        .carousel .item {
            height: 400px;
        }

        .carousel .item img {
            width: 100%;
        }

        /*视频教程*/
        /*课程*/
        .lesson_index {
            margin: 0;
            padding: 0;
            width: auto;
            height: 200px;
            background-color: #285e8e;
            position: relative;
        }

        .index_detail {
            color: white;
            position: absolute;
            left: 30%;
            top: 20%;
        }

        .desc {
            position: absolute;
            left: 30%;
            top: 60%;
        }

        /*学习资料*/
        .data_index {
            margin: 0;
            padding: 0;
            width: auto;
            height: 200px;
            background-color: #2b542c;
            position: relative;
        }

        /*开发工具*/
        .tool_index {
            margin: 0;
            padding: 0;
            width: auto;
            height: 200px;
            background-color: #d58512;
            position: relative;
        }

        /*其他*/
        .other_index {
            margin: 0;
            padding: 0;
            width: auto;
            height: 200px;
            background-color: #d9534f;
            position: relative;
        }

        /*图片弹起效果*/
        .up {
            transition: .5s;
            position: relative;
            overflow: hidden;
        }

        .up:hover {
            transform: translate3d(0px, -5px, 0px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, .5);
            /*opacity: .8;*/
        }

        /*图片划过显示数据*/
        .browseNum h3 {
            margin-top: 180px;
            margin-left: 150px;
            color: black;
        }



        .browseNum {
            width: 100%;
            height: 100%;
            position: absolute;
            left: 0;
            top: 0;
            color: #0f0;
            opacity: 0;
        }

        .browseNum:hover {
            background: #ff0000;
            /*opacity: 0.7;
            transition: opacity 0.7s;
            -webkit-transiton: opacity 0.7s;*/
        }

        /*网页结尾区域*/
        #footer{
            height: 330px;/*设置底部高度*/
            width: 100%;
            background: #15171f;
        }

        /*结尾区域主体部分*/
        #footer .f_con{
            width: 1180px;
            /*调整外边距,居中显示*/
            margin: 0px auto;
            color: #51555d;
            padding: 40px 0px;
        }

        /*内部元素布局*/
        #footer .f_con .f_desc dl{
            /*向左浮动*/
            float: left;
            margin-right: 60px;
        }

        /*内部元素样式*/
        #footer .f_con .f_desc dl dt{
            font-size: 18px;
            margin-bottom: 10px;
        }

        /*内部元素样式*/
        #footer .f_con .f_desc dl dd{
            line-height: 34px;
        }

        /*内部元素样式*/
        #footer .f_con .f_desc dl dd a{
            text-decoration: none;
            color: #51555d;
            font-size: 14px;
        }

        /*鼠标滑过样式*/
        #footer .f_con .f_desc dl dd a:hover{
            color: #fff;
        }

        /*分享图标*/
        #footer .f_con .f_desc dl dd .share{
            width:35px;
            height:34px;
            /*转换为块级元素*/
            display:block;
            /*向左浮动*/
            float:left;
            /*设置背景图片*/
            background:url("images/pe_icon.png") no-repeat;
            margin-right:5px;
        }

        /*通过定位,获取所需logo*/
        #footer .f_con .f_desc dl dd .f_wb{
            background-position: -227px -77px;
        }

        /*鼠标划过定位新logo*/
        #footer .f_con .f_desc dl dd .f_wb:hover{
            background-position: -227px -113px;
        }

        /*通过定位,获取所需logo*/
        #footer .f_con .f_desc dl dd .f_qq{
            background-position: -265px -77px;
        }

        /*鼠标划过定位新logo*/
        #footer .f_con .f_desc dl dd .f_qq:hover{
            background-position: -265px -113px;
        }

        /*联系方式区域*/
        #footer .f_con .f_tel{
            width: 365px;
            /*向右浮动*/
            float: right;
        }

        /*图片区域*/
        #footer .f_con .f_tel .f_qrcode{
            width: 153px;
            height: 135px;
            margin-left: 80px;
            /*向左浮动*/
            float: left;
        }

        /*时间部分*/
        #footer .f_con .f_tel .f_time{
            /*向左浮动*/
            float: left;
            padding-left: 51px;
        }

        /*内部元素样式*/
        #footer .f_con .f_tel .f_time .f_price{
            /*调整外边距,居中显示*/
            margin: 10px auto;
            /*内部元素居中显示*/
            text-align: center;
        }

        /*内部元素样式*/
        #footer .f_con .f_tel .f_time .f_price span{
            /*转换为块级元素*/
            display: block;
        }

        /*内部元素样式*/
        #footer .f_con .f_tel .f_time .f_phone{
            font-size: 24px;
            color: #fff;
            /*下方外边距为10像素*/
            margin-bottom: 10px;
        }

        /*内部元素样式*/
        #footer .f_con .f_tel .f_time .f_price span{
            line-height: 24px;
            font-size: 14px;
        }

        /*内部元素样式*/
        #footer .f_con .f_tel .f_time .f_mm{
            width: 152px;
            height: 39px;
            /*内部元素居中显示*/
            text-align: center;
            border: 1px solid #292c35;
            line-height: 39px;
            font-size: 14px;
            /*设置圆角为19像素*/
            border-radius: 19px;
        }

        /*end footer*/

        /*copyright start*/

        /*页脚部分*/
        .copyright{
            width:100%;
            height:54px;
            background:#191b24;
            line-height:54px;
            /*内部元素居中显示*/
            text-align:center;
            font-size:14px;
            color:#333740;
        }

        /*end copyright*/


    </style>
</head>
<body>
<!--侧边-->
<div class="side-nav" role="navigation">
    <ul class="nav-side-nav">
        <li><a href="#head" class="tooltip-side-nav" title="头部"></a></li>
        <li><a href="#resource" class="tooltip-side-nav"></a></li>
        <li><a href="#" class="tooltip-side-nav"></a></li>
        <li><a href="#" class="tooltip-side-nav"></a></li>
        <li><a href="#" class="tooltip-side-nav"></a></li>
    </ul>
</div>
<!--头部导航-->
<div id="head">
    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <!--logo-->
            <div class="navbar-header">
                <button class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a href="#" class="navbar-brand">
                    <img src="images/1.png" alt=""/>
                </a>
            </div>
            <div class="collapse navbar-collapse">
                <!--列表-->
                <ul class="nav navbar-nav">
                    <li><a href="#">视频教程</a></li>
                    <li><a href="#">学习资料</a></li>
                    <li><a href="#">开发工具</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">其他
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="#">111111</a></li>
                            <li><a href="#">111111</a></li>
                            <li><a href="#">111111</a></li>
                            <li><a href="#">111111</a></li>
                            <li class="divider"><a href=""></a></li>
                            <li><a href="#">111111</a></li>
                            <li><a href="#">111111</a></li>
                        </ul>
                    </li>
                </ul>
                <!--搜索-->
                <form action="#" class="navbar-form navbar-left myform">
                    <a href="#">登录</a>
                    <a id="rigistUser" href="${ctx}/pages/rigistUser.jsp">注册</a>
<%--                      <button id="rigistUser" onclick="${ctx}/pages/rigistUser.jsp" class="btn btn-primary">注册</button> --%>
                    <button class="btn btn-primary">搜索</button>
                    <input type="text" class="form-control" placeholder="请输入搜索内容..."/>
                </form>
            </div>
        </div>
    </nav>
</div>
<!--图片动画-->
<div class="container" id="myCaro">
    <div id="myCarousel" class="carousel slide" data-interval="3000" data-ride="carousel">
        <ol class="carousel-indicators text-right">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="item active">
                <img src="images/a.jpg">

                <div class="carousel-caption">
                    <p>有了新一代 802.11ac 技术，MacBook Air 令 Wi-Fi 速度超越极限。</p>
                </div>
            </div>
            <div class="item">
                <img src="images/b.jpg">

                <div class="carousel-caption">
                    <p>有了新一代 802.11ac 技术，MacBook Air 令 Wi-Fi 速度超越极限。</p>
                </div>
            </div>
            <div class="item">
                <img src="images/c.jpg">

                <div class="carousel-caption">
                    <p>有了新一代 802.11ac 技术，MacBook Air 令 Wi-Fi 速度超越极限。</p>
                </div>
            </div>
        </div>
    </div>
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
        <span class="glyphicon  glyphicon-chevron-left"></span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right"></span>
    </a>
</div>
<!--新闻-->
<div class="container" id="news">
    <div class="row">
        <div class="col-md-6">
            <ul class="nav nav-tabs">
                <li class="active"><a href="#one" data-toggle="tab">选项卡1</a></li>
                <li><a href="#two" data-toggle="tab">选项卡2</a></li>
                <li><a href="#three" data-toggle="tab">选项卡3</a></li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane active fade in" id="one">
                    <a href="#">最新文章最新文章<span class="pull-right">2016-7-12</span></a><br/>
                    <a href="#">最新文章最新文章<span class="pull-right">2016-7-12</span></a><br/>
                    <a href="#">最新文章最新文章<span class="pull-right">2016-7-12</span></a><br/>
                    <a href="#">最新文章最新文章<span class="pull-right">2016-7-12</span></a><br/>
                    <a href="#">最新文章最新文章<span class="pull-right">2016-7-12</span></a><br/>
                </div>
                <div class="tab-pane fade" id="two">
                    <a href="#">最新文章最新文章1<span class="pull-right">2016-7-12</span></a><br/>
                    <a href="#">最新文章最新文章1<span class="pull-right">2016-7-12</span></a><br/>
                    <a href="#">最新文章最新文章1<span class="pull-right">2016-7-12</span></a><br/>
                    <a href="#">最新文章最新文章1<span class="pull-right">2016-7-12</span></a><br/>
                    <a href="#">最新文章最新文章1<span class="pull-right">2016-7-12</span></a><br/>
                </div>
                <div class="tab-pane fade" id="three">
                    <a href="#">最新文章最新文章2<span class="pull-right">2016-7-12</span></a><br/>
                    <a href="#">最新文章最新文章2<span class="pull-right">2016-7-12</span></a><br/>
                    <a href="#">最新文章最新文章2<span class="pull-right">2016-7-12</span></a><br/>
                    <a href="#">最新文章最新文章2<span class="pull-right">2016-7-12</span></a><br/>
                    <a href="#">最新文章最新文章2<span class="pull-right">2016-7-12</span></a><br/>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="list-group">
                <div class="list-group-item" style="border: none;">
                    <h4>BootStrap教程</h4>

                    <p class="text-muted">
                        <span>2016-7-12</span>
                        <span class="pull-right">点击量<span class="badge" style="background: red;">200+</span></span>
                    </p>

                    <p class="text-muted">
                        文本内容文本内容文本内容文
                        本内容文本内容文本内容文本内容文本内容
                        文本内容文本内容文本内容文本内容文本内容文
                        本内容文本内容文本内容文本内容文本内容文本内容文本
                        内容文本内容文本内容文本内容文本内容文本内容文本内容
                    </p>

                    <p>
                        <span class="badge">前端</span>
                        <span class="badge">Web前端</span>
                        <span class="badge">前端视频</span>
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>
<!--资源-->
<div id="resource">
    <div class="container" id="videos">
        <div class="row">
            <div class="col-md-12">
                <ul class="breadcrumb">
                    <li><a href="#">后端学习</a></li>
                    <li><a href="#" class="text-muted">课程概要</a></li>
                </ul>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3">
                <div class="lesson_index">
                    <div class="index_detail">
                        <h2>Java教程</h2>
                    </div>
                    <a class="btn btn-default desc" href="#">查看更多>></a>
                </div>
            </div>
            <div class="col-md-3 up">
                <img src="images/1.jpg" alt=""/>

                <div class="caption">
                    <h3><a href="#">BootStrap教程</a></h3>

                    <p>
                        共12课
                    </p>
                </div>
                <div class="browseNum">
                    <h3> <a href="#" class="btn btn-info">浏览次数<span class="badge" style="background: red;">200+</span></a></h3>
                </div>
            </div>

            <div class="col-md-3 up">
                <img src="images/2.jpg" alt=""/>

                <div class="caption">
                    <h3><a href="#">BootStrap教程</a></h3>

                    <p>
                        共12课
                    </p>
                </div>
                <div class="browseNum">
                    <h3> <a href="#" class="btn btn-info">浏览次数<span class="badge" style="background: red;">200+</span></a></h3>
                </div>
            </div>
            <div class="col-md-3 up">
                <img src="images/3.jpg" alt=""/>

                <div class="caption">
                    <h3><a href="#">BootStrap教程</a></h3>

                    <p>
                        共12课
                    </p>
                </div>
                <div class="browseNum">
                    <h3> <a href="#" class="btn btn-info">浏览次数<span class="badge" style="background: red;">200+</span></a></h3>
                </div>
            </div>
        </div>
    </div>
    <div class="container" id="datas">
        <div class="row">
            <div class="col-md-3">
                <div class="data_index">
                    <div class="index_detail">
                        <h2>视频教程</h2>
                    </div>
                    <a class="btn btn-default desc" href="#">查看更多>></a>
                </div>
            </div>
            <div class="col-md-3 up">
                <img src="images/1.jpg" alt=""/>

                <div class="caption">
                    <h3><a href="#">BootStrap教程</a></h3>

                    <p>
                        共12课
                    </p>
                </div>
                <div class="browseNum">
                    <h3> <a href="#" class="btn btn-info">浏览次数<span class="badge" style="background: red;">200+</span></a></h3>
                </div>
            </div>
            <div class="col-md-3 up">
                <img src="images/2.jpg" alt=""/>

                <div class="caption">
                    <h3><a href="#">BootStrap教程</a></h3>

                    <p>
                        共12课
                    </p>
                </div>
                <div class="browseNum">
                    <h3> <a href="#" class="btn btn-info">浏览次数<span class="badge" style="background: red;">200+</span></a></h3>
                </div>
            </div>
            <div class="col-md-3 up">
                <img src="images/3.jpg" alt=""/>

                <div class="caption">
                    <h3><a href="#">BootStrap教程</a></h3>

                    <p>
                        共12课
                    </p>
                </div>
                <div class="browseNum">
                    <h3> <a href="#" class="btn btn-info">浏览次数<span class="badge" style="background: red;">200+</span></a></h3>
                </div>
            </div>
        </div>
    </div>
    <div class="container" id="tools">
        <div class="row">
            <div class="col-md-3">
                <div class="tool_index">
                    <div class="index_detail">
                        <h2>视频教程</h2>
                    </div>
                    <a class="btn btn-default desc" href="#">查看更多>></a>
                </div>
            </div>
            <div class="col-md-3 up">
                <img src="images/1.jpg" alt=""/>

                <div class="caption">
                    <h3><a href="#">BootStrap教程</a></h3>

                    <p>
                        共12课
                    </p>
                </div>
                <div class="browseNum">
                    <h3> <a href="#" class="btn btn-info">浏览次数<span class="badge" style="background: red;">200+</span></a></h3>
                </div>
            </div>
            <div class="col-md-3 up">
                <img src="images/2.jpg" alt=""/>

                <div class="caption">
                    <h3><a href="#">BootStrap教程</a></h3>

                    <p>
                        共12课
                    </p>
                </div>
                <div class="browseNum">
                    <h3> <a href="#" class="btn btn-info">浏览次数<span class="badge" style="background: red;">200+</span></a></h3>
                </div>
            </div>
            <div class="col-md-3 up">
                <img src="images/3.jpg" alt=""/>

                <div class="caption">
                    <h3><a href="#">BootStrap教程</a></h3>

                    <p>
                        共12课
                    </p>
                </div>
                <div class="browseNum">
                    <h3> <a href="#" class="btn btn-info">浏览次数<span class="badge" style="background: red;">200+</span></a></h3>
                </div>
            </div>
        </div>
    </div>
    <div class="container" id="others">
        <div class="row">
            <div class="col-md-3">
                <div class="other_index">
                    <div class="index_detail">
                        <h2>视频教程</h2>
                    </div>
                    <a class="btn btn-default desc" href="#">查看更多>></a>
                </div>
            </div>
            <div class="col-md-3 up">
                <img src="images/1.jpg" alt=""/>

                <div class="caption">
                    <h3><a href="#">BootStrap教程</a></h3>

                    <p>
                        共12课
                    </p>
                </div>
                <div class="browseNum">
                    <h3> <a href="#" class="btn btn-info">浏览次数<span class="badge" style="background: red;">200+</span></a></h3>
                </div>
            </div>
            <div class="col-md-3 up">
                <img src="images/2.jpg" alt=""/>

                <div class="caption">
                    <h3><a href="#">BootStrap教程</a></h3>

                    <p>
                        共12课
                    </p>
                </div>
                <div class="browseNum">
                    <h3> <a href="#" class="btn btn-info">浏览次数<span class="badge" style="background: red;">200+</span></a></h3>
                </div>
            </div>
            <div class="col-md-3 up">
                <img src="images/3.jpg" alt=""/>

                <div class="caption">
                    <h3><a href="#">BootStrap教程</a></h3>

                    <p>
                        共12课
                    </p>
                </div>
                <div class="browseNum">
                    <h3> <a href="#" class="btn btn-info">浏览次数<span class="badge" style="background: red;">200+</span></a></h3>
                </div>
            </div>
        </div>
    </div>

</div>
<!--底部-->

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

                <img src="images/weixin.png" alt="潭州官方微信" width="102" height="127" />

            </div>

            <div class="f_time">

                <p class="f_phone">400-009-6359</p>
                <p class="f_price">
                    <span>周一至周六 9:30-23:00</span>
                    <span>（仅收市话费）</span>
                </p>
                <p class="f_mm">24小时在线客服</p>

            </div>

        </div>

        <div class="clear"></div>

    </div>

</div>

<!-- footer end -->

<!-- copyright start -->

<div class="copyright">

    Copyright &copy; 2016-2020 www.benpaoitroad.com All Rights Reserved 版权所有：北京数据之眼有限公司 备案号：备11111024号

</div>
<script src="js/jquery-1.10.2.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="js/bootstrap.min.js"></script>
</body>
</html>