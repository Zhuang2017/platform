<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ include file="/WEB-INF/views/mobileTerminal/include/css.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<title>${student.trusts }</title>
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

.footer {
	position: fixed !important;
	/*height: 58px;*/
	bottom: 0px;
}

.about_contain {
	width: 100%;
	height: auto;
	/*	background: #FFFFFF;*/
}

.about_tittle {
	width: 94%;
	margin: 0 auto;
	padding: 20px 0px;
}

.about_tittle p {
	margin: 10px 0px;
	text-indent: 32px;
	color: #41444A;
}

.a_title {
	color: #353535;
	font-weight: bold;
}

.food_title {
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
		<div class="about_contain" style="padding-bottom: 80px;">

			<h2
				class="weui-form-preview__btn weui-form-preview__btn_primary food_title">作业完成情况</h2>
			<ul>
				<c:forEach var="homework" items="${homeworkList}"
					varStatus="varStatus">
					<li>
						<div class="weui-form-preview">
							<div class="weui-form-preview__hd">
								<h3
									class="weui-form-preview__btn weui-form-preview__btn_primary food_title">${fns:getDictLabel(homework.subject, 'subject', '')}作业</h3>
							</div>
							<div class="weui-form-preview__bd">
								<div class="weui-form-preview__item">
									<label class="weui-form-preview__label a_title">题目：</label> <span
										class="weui-form-preview__value">${homework.title}</span> <label
										class="weui-form-preview__label a_title">布置时间：</label> <span
										class="weui-form-preview__value"><fmt:formatDate value="${homework.assignTime}"
											pattern="MM-dd HH时" /></span> <label
										class="weui-form-preview__label a_title">完成时间：</label> <span
										class="weui-form-preview__value">
										<fmt:formatDate value="${homework.completionTime}"
											pattern="MM-dd HH时" /></span> <label
										class="weui-form-preview__label a_title">完成情况：</label> <span
										class="weui-form-preview__value"><img
										src="${homework.comment}" alt="作业完成情况" /></span> <label
										class="weui-form-preview__label a_title">老师评语：</label> <span
										class="weui-form-preview__value">${homework.comment}</span>
								</div>
							</div>
						</div>
					</li>
				</c:forEach>
			</ul>

		</div>
		</div>
		<!--内容-->
		<!--底部导航-->
		<%@ include
			file="/WEB-INF/views/mobileTerminal/include/bottomandjs.jsp"%>
</body>
</html>