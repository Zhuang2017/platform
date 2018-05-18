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
	background: #FFFFFF;
	
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
 </style>
</head>
<body>
<div class="containar">
<!--内容-->
<div class="about_contain">
<img src="${ctxStatic }/moblieLogin/img/about.jpg"  width="100%"/>
<div class="about_tittle">
	<h3>小鳝溪托管园</h3>
	<p>小鳝溪是国脉信息科技股份有限公司为了响应国家创新驱动发展战略，
	发起设立的一个新型教育投资管理平台。
	植根福建工程学院国脉信息学院120年的优良传统，以交大先进的教育教学理念、优秀的基础教育品牌和独特教育资源优势，
	与渭南市政府合作，共同打造西交康桥临渭示范托管园。
	以“高起点高品质办学、打造高水平的优质园”为目标；依托西安交大基础教学办学经验，引进意大利先进的瑞吉欧国际化幼儿教育理念，聘请国际知名设计师打造独特的最适合孩子成长的乐园</p>
	<p>礼、乐、射、御、书、数，古之六艺，今为小鳝溪托管园的课程纲领；</p>
	<p>看、听、触、闻、尝、思，今之六感，现为小鳝溪托管园的教育方法。</p>
	<p>小鳝溪托管园作为一所国际化托管园，特别聘请高素质的中外专家及教师团队，以国学为根本，以六感促六艺，同时邀请家长、老师、专家一起来帮助孩子积淀身体财富、心灵财富、思想和精神财富，培养能感受、能思考、能表达、能作为、回归本真面貌、发现自我天赋的孩子，支持孩子成为拥有中国灵魂的世界公民。</p>

</div>
</div>
<!--内容-->
<%@ include file="/WEB-INF/views/mobileTerminal/include/bottomandjs.jsp"%>
</body>
</html>