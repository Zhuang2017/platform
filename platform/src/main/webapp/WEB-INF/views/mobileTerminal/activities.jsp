<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ include file="/WEB-INF/views/mobileTerminal/include/css.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <title>西交康桥临渭示范幼儿园</title>
 <link rel="stylesheet" href="css/jquery-weui.min.css" />
 <link rel="stylesheet" href="css/swiper.min.css" />
 <link rel="stylesheet" href="css/weui.min.css" />
 	<style>
			*{
				margin: 0;
				padding: 0;
				border: none;
			}
			ul,li{	margin: 0;
				padding: 0;
				border: none;
				list-style: none;}
			html,body{
				width: 100%;
				height: auto;
				font-family: "microsoft yahei,微软雅黑 ";
				background-color: #f3f4f6;
			}
			.containar{
				width: 100%;
				height: auto;
				background-color: #f3f4f6;
			}
			 .weui-grids:before{
right: 0;
 height: 0px; 
 border-top: 0px solid #d9d9d9; 
transform-origin: 0 0;
-webkit-transform: scaleY(.5);
transform: scaleY(.5);
}
.weui-grid:before {
top: 0;
 width: 0px; 
 border-right: 1px solid #f3f4f6;
-webkit-transform-origin: 100% 0;
transform-origin: 100% 0;
-webkit-transform: scaleX(.5);
transform: scaleX(.5);
}
.weui-grid {
width: 25%;
}
.weui-grids{
	padding: 10px 0px;
	margin-top: -5px;
}
.weui-grid:after {
left: 0;
height: 0px;
border-bottom: 0px solid #d9d9d9;
}
.weui-grids:after {
width: 1px;
bottom: 0;
border-bottom: 1px solid #d9d9d9;
transform-origin: 0 0;
-webkit-transform: scaleX(.5);
transform: scaleX(.5);
background: #D9D9D9;
}
.weui-media-box:before {
content: " ";
position: absolute;
left: 0;
top: 0;
right: 0;
height: 1px;
border-top: 1px solid #f3f4f6;
color: #f3f4f6;
-webkit-transform-origin: 0 0;
transform-origin: 0 0;
-webkit-transform: scaleY(.5);
transform: scaleY(.5);
left: 15px;
}
.weui-media-box:after{
	content: " ";
position: absolute;
left: 0;
bottom: 0;
right: 0;
height: 1px;
border-bottom: 1px solid #f3f4f6;
color: #f3f4f6;
-webkit-transform-origin: 0 100%;
transform-origin: 0 100%;
-webkit-transform: scaleY(.5);
transform: scaleY(.5);
left: 15px;
}
.weui-panel__ft .weui-cell_link:after{
		content: " ";
position: absolute;
left: 0;
bottom: 0;
right: 0;
height: 1px;
border-bottom: 1px solid #f3f4f6;
color: #f3f4f6;
-webkit-transform-origin: 0 100%;
transform-origin: 0 100%;
-webkit-transform: scaleY(.5);
transform: scaleY(.5);
left: 15px;
}
.weui-grid__label{
	color: #41444a;
/*	font-weight: bold;*/
}
.h-tittle{
color:#999;	
}
.footer{
	position: fixed!important;
	/*height: 58px;*/
	bottom: 0px;
}
 </style>
</head>
<body>
<div class="containar">


<!--活动-->
<div class="weui-panel weui-panel_access " style=" padding-bottom: 60px;">
		<div class="weui-panel__ft">
    <a href="javascript:void(0);" class="weui-cell weui-cell_access weui-cell_link">
      <div class="weui-cell__bd h-tittle">最新活动</div>
     <!-- <span class="weui-cell__ft"></span>-->
    </a>    
  </div>
            <div class="weui-panel__bd">
            	<ul>
            		<li >
                <a href="javascript:void(0);" class="weui-media-box weui-media-box_appmsg">
                    <div class="weui-media__hd">
                        <img class="weui-media__thumb" src="img/ch1.jpg" alt="">
                    </div>
                    <div class="weui-media__bd">
                        <h4 class="weui-media__title">标题一</h4>
                        <p class="weui-media__desc">由各种物质组成的巨型球状天体，叫做星球。星球有一定的形状，有自己的运行轨道。</p>
                    </div>
                </a>
 
                </li>
                <li>
                <a href="javascript:void(0);" class="weui-media-box weui-media-box_appmsg">
                    <div class="weui-media__hd">
                        <img class="weui-media__thumb" src="img/ch8.jpg" alt="">
                    </div>
                    <div class="weui-media__bd">
                        <h4 class="weui-media__title">标题一</h4>
                        <p class="weui-media__desc">由各种物质组成的巨型球状天体，叫做星球。星球有一定的形状，有自己的运行轨道。</p>
                    </div>
                </a>
                </li>
                 <li>
                <a href="javascript:void(0);" class="weui-media-box weui-media-box_appmsg">
                    <div class="weui-media__hd">
                        <img class="weui-media__thumb" src="img/ch8.jpg" alt="">
                    </div>
                    <div class="weui-media__bd">
                        <h4 class="weui-media__title">标题一</h4>
                        <p class="weui-media__desc">由各种物质组成的巨型球状天体，叫做星球。星球有一定的形状，有自己的运行轨道。</p>
                    </div>
                </a>
                </li>
                <li >
                <a href="javascript:void(0);" class="weui-media-box weui-media-box_appmsg">
                    <div class="weui-media__hd">
                        <img class="weui-media__thumb" src="img/ch1.jpg" alt="">
                    </div>
                    <div class="weui-media__bd">
                        <h4 class="weui-media__title">标题一</h4>
                        <p class="weui-media__desc">由各种物质组成的巨型球状天体，叫做星球。星球有一定的形状，有自己的运行轨道。</p>
                    </div>
                </a>
 
                </li>
                <li>
                <a href="javascript:void(0);" class="weui-media-box weui-media-box_appmsg">
                    <div class="weui-media__hd">
                        <img class="weui-media__thumb" src="img/ch8.jpg" alt="">
                    </div>
                    <div class="weui-media__bd">
                        <h4 class="weui-media__title">标题一</h4>
                        <p class="weui-media__desc">由各种物质组成的巨型球状天体，叫做星球。星球有一定的形状，有自己的运行轨道。</p>
                    </div>
                </a>
                </li>
                 <li>
                <a href="javascript:void(0);" class="weui-media-box weui-media-box_appmsg">
                    <div class="weui-media__hd">
                        <img class="weui-media__thumb" src="img/ch8.jpg" alt="">
                    </div>
                    <div class="weui-media__bd">
                        <h4 class="weui-media__title">标题一</h4>
                        <p class="weui-media__desc">由各种物质组成的巨型球状天体，叫做星球。星球有一定的形状，有自己的运行轨道。</p>
                    </div>
                </a>
                </li>
                <li >
                <a href="javascript:void(0);" class="weui-media-box weui-media-box_appmsg">
                    <div class="weui-media__hd">
                        <img class="weui-media__thumb" src="img/ch1.jpg" alt="">
                    </div>
                    <div class="weui-media__bd">
                        <h4 class="weui-media__title">标题一</h4>
                        <p class="weui-media__desc">由各种物质组成的巨型球状天体，叫做星球。星球有一定的形状，有自己的运行轨道。</p>
                    </div>
                </a>
 
                </li>
                <li>
                <a href="javascript:void(0);" class="weui-media-box weui-media-box_appmsg">
                    <div class="weui-media__hd">
                        <img class="weui-media__thumb" src="img/ch8.jpg" alt="">
                    </div>
                    <div class="weui-media__bd">
                        <h4 class="weui-media__title">标题一</h4>
                        <p class="weui-media__desc">由各种物质组成的巨型球状天体，叫做星球。星球有一定的形状，有自己的运行轨道。</p>
                    </div>
                </a>
                </li>
                 <li>
                <a href="javascript:void(0);" class="weui-media-box weui-media-box_appmsg">
                    <div class="weui-media__hd">
                        <img class="weui-media__thumb" src="img/ch8.jpg" alt="">
                    </div>
                    <div class="weui-media__bd">
                        <h4 class="weui-media__title">标题一</h4>
                        <p class="weui-media__desc">由各种物质组成的巨型球状天体，叫做星球。星球有一定的形状，有自己的运行轨道。</p>
                    </div>
                </a>
                </li>
            	</ul>
            </div>
           
        </div>

<!--活动-->

<%@ include file="/WEB-INF/views/mobileTerminal/include/bottomandjs.jsp"%>
</body>
</html>