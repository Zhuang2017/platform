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

.footer{
	position: fixed!important;
	/*height: 58px;*/
	bottom: 0px;
}
.about_contain{
	width: 100%;
	height: auto;
/*	background: #FFFFFF;*/
	
}
.about_tittle{
	width: 94%;
	margin: 0 auto;
	padding: 20px 0px;
}
.about_tittle p{
margin: 10px 0px;
text-indent: 32px;
color: #41444A;
}
.a_title{
	color: #353535;
	font-weight: bold;
}
.food_title{
	color: #F08519;
}
.weui-form-preview__hd:after {

left: 0px;
}
 </style>
</head>
<body>
<div class="containar">
<!--内容-->
<div class="about_contain">

  
  <ul>
  	<li style=" padding-bottom: 60px;">
  	<div class="weui-form-preview">
  	<div class="weui-form-preview__hd">
          <h3 class="weui-form-preview__btn weui-form-preview__btn_primary food_title" >本周六课程安排</h3>
     </div>
      <div class="weui-form-preview__bd">
        <div class="weui-form-preview__item">
          <label class="weui-form-preview__label a_title">07:50-08:20</label>
         <span class="weui-form-preview__value">早俱乐部（清洁教室、喂养小动物、日常活动准备、师生日常交流）</span>
        <label class="weui-form-preview__label a_title">08:20-08:50</label>
          <span class="weui-form-preview__value">营养早餐</span>
         <label class="weui-form-preview__label a_title">08:50-09:00 </label>
          <span class="weui-form-preview__value">整理，自我照料</span>
          
          
          <label class="weui-form-preview__label a_title"> 09:00-09:30  </label>
         <span class="weui-form-preview__value">主题教学、绘本故事、国学小课堂</span>
        <label class="weui-form-preview__label a_title"> 09:30-10:00  </label>
          <span class="weui-form-preview__value">分龄艺术（湿水彩、蜂蜡、戏剧、音乐、画信、手工等）</span>
         <label class="weui-form-preview__label a_title"> 10:00-10:10  </label>
          <span class="weui-form-preview__value">整理，自我照料</span>
          
          <label class="weui-form-preview__label a_title"> 10:10-11:00  </label>
         <span class="weui-form-preview__value">种植+室外玩耍+整理  </span>
        <label class="weui-form-preview__label a_title"> 11:00-11:30  </label>
          <span class="weui-form-preview__value">英语互动、英语绘本阅读 </span>
         <label class="weui-form-preview__label a_title">  11:30-11:40  </label>
          <span class="weui-form-preview__value"> 手指谣+餐前准备</span>
         
         
                   <label class="weui-form-preview__label a_title">  11:40-14:20   </label>
         <span class="weui-form-preview__value">丰富午餐+餐后清理（含散步）+午休充电   </span>
        <label class="weui-form-preview__label a_title">  14:20-14:40  </label>
          <span class="weui-form-preview__value"> 起床，自我照料</span>
         <label class="weui-form-preview__label a_title"> 14:40-15:00   </label>
          <span class="weui-form-preview__value"> 午点，餐后清理</span>
         
             <label class="weui-form-preview__label a_title">  15:00-15:30    </label>
         <span class="weui-form-preview__value">下午俱乐部   </span>
        <label class="weui-form-preview__label a_title">   15:30-16:40  </label>
          <span class="weui-form-preview__value"> 室内外自由活动+自我料理 </span>
         <label class="weui-form-preview__label a_title"> 16:40-17:20    </label>
          <span class="weui-form-preview__value"> 餐前准备+营养晚餐</span>
          <label class="weui-form-preview__label a_title">  17:20-17:50    </label>
          <span class="weui-form-preview__value"> 离园准备+离园  </span>
        </div>
      </div>
          </div>
  </li>

 
  </ul>
  
     
     
     
     
     



</div>
<!--内容-->
<!--底部导航-->
<%@ include file="/WEB-INF/views/mobileTerminal/include/bottomandjs.jsp"%>
</body>
</html>