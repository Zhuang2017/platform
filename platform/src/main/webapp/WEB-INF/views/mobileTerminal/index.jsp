<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<title>${student.trusts }</title>
<link rel="stylesheet"
	href="${ctxStatic }/moblieLogin/css/jquery-weui.min.css" />
<link rel="stylesheet"
	href="${ctxStatic }/moblieLogin/css/swiper.min.css" />
<link rel="stylesheet" href="${ctxStatic }/moblieLogin/css/weui.min.css" />
<style>
* {
	margin: 0;
	padding: 0;
	border: none;
}

ul, li {
	margin: 0;
	padding: 0;
	border: none;
	list-style: none;
}

html, body {
	width: 100%;
	height: auto;
	font-family: "microsoft yahei,微软雅黑 ";
	background-color: #f3f4f6;
}

.containar {
	width: 100%;
	height: auto;
	background-color: #f3f4f6;
}

.weui-grids:before {
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

.weui-media__stu {
	color: #999;
	font-size: 13px;
	line-height: 1.2;
	display: -webkit-box;
	-webkit-box-orient: vertical;
	/* //-webkit-line-clamp: 2 */
}

.weui-grid {
	width: 25%;
}

.weui-grids {
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

.weui-media-box:after {
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

.weui-panel__ft .weui-cell_link:after {
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

.weui-grid__label {
	color: #41444a;
	/*	font-weight: bold;*/
}

.h-tittle {
	color: #999;
}

.footer {
	position: fixed !important;
	/*height: 58px;*/
	bottom: 0px;
}
</style>
</head>
<body>
	<div class="containar">
		<!--幻灯片-->
		<div class="swiper-container">
			<div class="swiper-wrapper">
				<div class="swiper-slide">
					<img src="${ctxStatic }/moblieLogin/img/slide-1.png" width="100%">
				</div>
				<div class="swiper-slide">
					<img src="${ctxStatic }/moblieLogin/img/slide-2.png" width="100%">
				</div>
				<div class="swiper-slide">
					<img src="${ctxStatic }/moblieLogin/img/slide-3.png" width="100%">
				</div>
			</div>
			<!-- 添加圆点导航 -->
			<div class="swiper-pagination"></div>

		</div>
		<!--幻灯片-->
		<!--中间分类-->
		<div class="weui-grids" style="background: #FFFFFF;">

			<a href="course" class="weui-grid js_grid">
				<div class="weui-grid__icon">
					<img src="${ctxStatic }/moblieLogin/img/icon_nav_kc.png" alt="">
				</div>
				<p class="weui-grid__label">课程安排</p>
			</a> <a href="beha" class="weui-grid js_grid">
				<div class="weui-grid__icon">
					<img src="${ctxStatic }/moblieLogin/img/icon_bg_hd.png" alt="">
				</div>
				<p class="weui-grid__label">表现情况</p>
			</a> <a href="homework" class="weui-grid js_grid">
				<div class="weui-grid__icon">
					<img src="${ctxStatic }/moblieLogin/img/baom.png" alt="">
				</div>
				<p class="weui-grid__label">作业情况</p>
			</a> <a href="exam" class="weui-grid js_grid">
				<div class="weui-grid__icon">
					<img src="${ctxStatic }/moblieLogin/img/icon_bg_bm.png" alt="">
				</div>
				<p class="weui-grid__label">学习成绩</p>
			</a> <a href="about_us" class="weui-grid js_grid">
				<div class="weui-grid__icon">
					<img src="${ctxStatic }/moblieLogin/img/icon_nav_hd.png" alt="">
				</div>
				<p class="weui-grid__label">签到记录</p>
			</a> <a href="teacher" class="weui-grid js_grid">
				<div class="weui-grid__icon">
					<img src="${ctxStatic }/moblieLogin/img/icon_nav_sz.png" alt="">
				</div>
				<p class="weui-grid__label">教师团队</p>
			</a> <a href="food" class="weui-grid js_grid">
				<div class="weui-grid__icon">
					<img src="${ctxStatic }/moblieLogin/img/icon_nav_sp.png" alt="">
				</div>
				<p class="weui-grid__label">一周食谱</p>
			</a> <a href="about_us" class="weui-grid js_grid">
				<div class="weui-grid__icon">
					<img src="${ctxStatic }/moblieLogin/img/icon_bg_home.png" alt="">
				</div>
				<p class="weui-grid__label">机构简介</p>
			</a>
		</div>

		<!--中间分类-->
		<!--孩子动态-->
		<div class="weui-panel weui-panel_access ">
			<div class="weui-panel__ft">
				<a href="javascript:void(0);"
					class="weui-cell weui-cell_access weui-cell_link">
					<div class="weui-cell__bd h-tittle">孩子最新动态</div>
				</a>
			</div>
			<div class="weui-panel__bd">
				<ul>
					<c:forEach var="student" items="${studentList}"
						varStatus="varStatus">
						<li><a href="javascript:void(0);"
							class="weui-media-box weui-media-box_appmsg">
								<div class="weui-media__hd">
									<img class="weui-media__thumb"
										src="${ctxStatic }/moblieLogin/img/ch1.jpg" alt="">
								</div>
								<div class="weui-media__bd">
									<h4 class="weui-media__title">${fns:getDictLabel(student.status, 'student_status', '')}</h4>
									<p class="weui-media__stu">
										${student.trusts.name } - ${student.name } <br /> 签到时间：
										<fmt:formatDate value="${student.signTime }"
											pattern="MM-dd HH:mm:ss" />
										<br /> 当前状态：在托管园中 -可过来接孩子
									</p>
								</div>
						</a></li>
					</c:forEach>
				</ul>
			</div>

		</div>
		<!--孩子动态-->

		<!--公告-->
		<div class="weui-panel weui-panel_access "
			style="padding-bottom: 60px;">
			<div class="weui-panel__ft">
				<a href="javascript:void(0);"
					class="weui-cell weui-cell_access weui-cell_link">
					<div class="weui-cell__bd h-tittle">公告</div> <span
					class="weui-cell__ft"></span>
				</a>
			</div>

			<div class="weui-panel__bd">

				<a href="javascript:void(0);"
					class="weui-media-box weui-media-box_appmsg">

					<div class="weui-media__bd">
						<h4 class="weui-media__title">六一节放假通知</h4>
						<p class="weui-media__desc">六一儿童节对孩子们来说是最开心的一天，也是最期盼的一天。
							在这一天不满14周岁的少年儿童放假1天</p>
					</div>
				</a>

			</div>

		</div>

		<!--公告-->


		<!--底部导航-->
		<%@ include
			file="/WEB-INF/views/mobileTerminal/include/bottomandjs.jsp"%>
</body>
</html>