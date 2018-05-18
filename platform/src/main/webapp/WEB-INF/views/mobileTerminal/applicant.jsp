<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ include file="/WEB-INF/views/mobileTerminal/include/css.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <title>西交康桥临渭示范幼儿园</title>
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
.weui-panel__hd:after {
content: " ";
position: absolute;
left: 0;
bottom: 0;
right: 0;
height: 0px;
border-bottom: 0px solid #e5e5e5;
color: #e5e5e5;
-webkit-transform-origin: 0 100%;
transform-origin: 0 100%;
-webkit-transform: scaleY(.5);
transform: scaleY(.5);
left: 0px;
}
.weui-grid__label{
	color: #41444a;
/*	font-weight: bold;*/
}
.h-tittle{
color:#f08519;	
}
.footer{
	position: fixed!important;
	/*height: 58px;*/
	bottom: 0px;
}
.weui-icon-img{
	display: block;
	height: 28px;
	position:relative;
	padding-right: 20px;
}
 </style>
</head>
<body>
<div class="containar">
<!--幻灯片-->
<div class="swiper-container" >
  <div class="swiper-wrapper">
    <div class="swiper-slide"><img src="img/slide-1.png" width="100%"></div>
    <div class="swiper-slide"><img src="img/slide-2.png" width="100%"></div>
    <div class="swiper-slide"><img src="img/slide-3.png" width="100%"></div>
  </div>
   <!-- 添加圆点导航 -->
     <div class="swiper-pagination"></div>

</div>
<!--幻灯片-->
<!--中间分类-->
<div class="weui-grids" style=" background: #FFFFFF;">
 
 <a href="teacher.html" class="weui-grid js_grid">
    <div class="weui-grid__icon">
      <img src="img/icon_nav_sz.png" alt="">
    </div>
    <p class="weui-grid__label">
      教师团队
    </p>
  </a>
  <a href="course.html" class="weui-grid js_grid">
    <div class="weui-grid__icon">
      <img src="img/icon_nav_kc.png" alt="">
    </div>
    <p class="weui-grid__label">
     课程安排
    </p>
  </a>
  <a href="food.html" class="weui-grid js_grid">
    <div class="weui-grid__icon">
      <img src="img/icon_nav_sp.png" alt="">
    </div>
    <p class="weui-grid__label">
     一周食谱  
    </p>
  </a>
  <a href="about_us.html" class="weui-grid js_grid">
    <div class="weui-grid__icon">
      <img src="img/icon_nav_hd.png" alt="">
    </div>
    <p class="weui-grid__label">
     校园简介
    </p>
  </a>
</div>	

<!--中间分类-->

<!--报名表单-->
<div class="weui-panel weui-panel_access ">
	  <div class="weui-panel__hd h-tittle" >预约入学</div>


<div class="weui-cells weui-cells_form" style="width: 94%; margin: 0 auto;" >
  <div class="weui-cell">
    <div class="weui-cell__hd">
    	 <img class="weui-icon-img" src="img/icon_user.png" alt="">
    	<!--<label class="weui-label">联系人：</label>-->
    </div>
    <div class="weui-cell__bd">
      <input class="weui-input" type="text" placeholder="请输入您的名字">
    </div>
  </div>
 <div class="weui-cell">
    <div class="weui-cell__hd">
    	 <img class="weui-icon-img" src="img/icon_tel.png" alt="">
    	<!--<label class="weui-label">手机号码：</label>-->
    </div>
    <div class="weui-cell__bd">
      <input class="weui-input" type="number" pattern="[0-9]*" placeholder="请输入手机号码号">
    </div>
  </div>
 
	  <div class="weui-cell">
    <div class="weui-cell__hd">
    	 <img class="weui-icon-img" src="img/icon_user.png" alt="">
    	<!--<label class="weui-label">联系人：</label>-->
    </div>
    <div class="weui-cell__bd">
      <input class="weui-input" type="text" placeholder="请输入您的名字">
    </div>
  </div>
 <div class="weui-cell">
    <div class="weui-cell__hd">
    	 <img class="weui-icon-img" src="img/icon_tel.png" alt="">
    
    </div>
    <div class="weui-cell__bd">
      <input class="weui-input" type="number" pattern="[0-9]*" placeholder="请输入手机号码号">
    </div>
  </div>
</div>


</div>
<!--报名表单-->
<!--底部导航-->
<%@ include file="/WEB-INF/views/mobileTerminal/include/bottomandjs.jsp"%>
</body>
</html>