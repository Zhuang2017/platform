<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <title>西交康桥临渭示范幼儿园</title>
 <link rel="stylesheet" href="${ctxStatic }/mobileTerminal/css/jquery-weui.min.css" />
 <link rel="stylesheet" href="${ctxStatic }/mobileTerminal/css/swiper.min.css" />
 <link rel="stylesheet" href="${ctxStatic }/mobileTerminal/css/weui.min.css" />
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
 	<c:forEach items="${page.list}" var="behaviour">
  	<li>
  	<div class="weui-form-preview">
  	<div class="weui-form-preview__hd">
          <h3 class="weui-form-preview__btn weui-form-preview__btn_primary food_title" >
          <fmt:formatDate value="${behaviour.behaDate}" pattern="MM月dd日"/>表现情况
          </h3>
     </div>
      <div class="weui-form-preview__bd">
        <div class="weui-form-preview__item">
          <label class="weui-form-preview__label a_title">内容</label>
          <span class="weui-form-preview__value">${behaviour.content}</span>
          <label class="weui-form-preview__label a_title">老师寄语</label>
          <span class="weui-form-preview__value">${behaviour.comment}</span>
          <label class="weui-form-preview__label a_title">老师</label>
          <span class="weui-form-preview__value">${behaviour.teacher.name}</span>
        </div>
      </div>
     </div>
  </li>
 </c:forEach>
  </ul>
  


</div>
<!--内容-->
<!--底部导航-->
<div class="weui-tabbar footer">
    <a href="index.html" class="weui-tabbar__item">
      <span class="weui-badge" style="position: absolute;top: -.4em;right: 1em;">8</span>
      <div class="weui-tabbar__icon">
        <img src="img/home.png" alt="">
      </div>
      <p class="weui-tabbar__label">首页</p>
    </a>
    
    <a href="applicant.html" class="weui-tabbar__item">
      <div class="weui-tabbar__icon">
        <img src="img/icon_bg_bm.png" alt="">
      </div>
      <p class="weui-tabbar__label">报名</p>
    </a>
    <a href="activities.html" class="weui-tabbar__item">
      <div class="weui-tabbar__icon">
        <img src="img/icon_bg_hd.png" alt="">
      </div>
      <p class="weui-tabbar__label">活动</p>
    </a>
  </div>
<!--底部导航-->

</div>


<script type="text/javascript" src="${ctxStatic }/mobileTerminal/js/jquery-2.1.4.js" ></script>
<script type="text/javascript" src="${ctxStatic }/mobileTerminal/js/jquery-weui.min.js" ></script>
<script type="text/javascript" src="${ctxStatic }/mobileTerminal/js/swiper.js" ></script>

	<script>
        var swiper = new Swiper('.swiper-container', {
        pagination: '.swiper-pagination',
        paginationClickable: true,
        autoplay: 2500
    });
    </script>
</body>
</html>