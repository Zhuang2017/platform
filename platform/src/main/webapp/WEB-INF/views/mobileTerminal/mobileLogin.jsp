<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page
	import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML>

<html>

<head>



<title>智能托管-家长端登录</title>



<meta charset="utf-8" />

<meta
	content="width=device-width, initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"
	name="viewport" />

<meta content="yes" name="apple-mobile-web-app-capable" />

<meta content="black" name="apple-mobile-web-app-status-bar-style" />

<meta content="telephone=yes" name="format-detection" />

<meta content="email=no" name="format-detection" />

<meta name="keywords" content="托管平台，家长端  微信公众平台" />

<meta name="description" content="儿童智能托管平台" />

<link href="${ctxStatic }/moblieLogin/css/public.css" rel="stylesheet">

<link href="${ctxStatic }/moblieLogin/css/login.css" rel="stylesheet">

<style>
.alert {
	position: relative;
	width: 300px;
	margin: 0 auto;
	*padding-bottom: 0px;
}

label.error {
	background: none;
	width: 270px;
	font-weight: normal;
	color: inherit;
	margin: 0;
}
</style>

<script src="${ctxStatic }/moblieLogin/js/jquery.js"
	type="text/javascript"></script>
<script
	src="${ctxStatic }/jquery-validation/1.11.1/jquery.validate.min.js"
	type="text/javascript"></script>

<script src="${ctxStatic }/moblieLogin/js/common.js"
	type="text/javascript"></script>

<script type="text/javascript">
	$(document).ready(function() {
		var message = "${message}";
		console.log("message = "+ message);
		if (message == null || message == "") {
			console.log("隐藏了");
			$("#messageBox").hide();
		} else {
			console.log("显示");
			$("#messageBox").show();
		}
		$("#loginForm").validate({
			messages : {
				username : {
					required : "请填写用户名."
				},
				password : {
					required : "请填写密码."
				},
			},
			errorLabelContainer : "#messageBox",
			errorPlacement : function(error, element) {
				error.appendTo($("#loginError").parent());
			}
		});
		
		$(".close").click(function(){
			$("#messageBox").hide();
		});
	});
</script>

</head>



<body id="body">
	<div class="fullscreen per_login">
		<div class="alert"></div>
		<header class="header">

			<div class="header_bar">
				<div class="header">
					<div id="messageBox" class="alert alert-error">
						<button data-dismiss="alert" class="close">×</button>
						<label id="loginError" class="error">${message}</label>
					</div>
				</div>
				<h1 class="logo">
					<a href="#">儿童智能托管平台</a>
				</h1>

				<div class="per_login" id="per_login">
					<div class="account">
						<div class="per_name">
							<span id="per_name">注册/登录</span> <i class="arrowIcon"></i>
						</div>
					</div>

					<div class="quick_links hide">

						<ul>
							<li><a href="#">个人注册</a></li>
							<li><a href="#">个人登录</a></li>
							<li><a href="#">企业注册</a></li>
							<li><a href="#">企业登录</a></li>
							<li><a href="#">返回主页</a></li>
						</ul>
					</div>
				</div>
			</div>

		</header>


		<div class="header">
			<div id="messageBox"
				class="alert alert-error ${empty message ? 'hide' : ''}">
				<button id="close" data-dismiss="alert" class="close">×</button>
				<label id="loginError" class="error">${message}</label>
			</div>
		</div>
		<div class="operate_Bar1 clearfix">

			<div class="text">用户登录</div>

		</div>



		<section class="inner_content">

			<form id="loginForm" name="loginForm" action="${ctxP}/index"
				method="post">

				<li class="username"><input type="text" name="username"
					placeholder="用户名" id="username" class="input-block-level required"
					value="" /></li>

				<li class="pwd"><input type="password" name="password"
					placeholder="密码" id="password" class="input-block-level required"
					value="" /></li>
				<c:if test="${isValidateCodeLogin}">
					<div class="validateCode">
						<label class="input-label mid" for="validateCode">验证码</label>
						<sys:validateCode name="validateCode"
							inputCssStyle="margin-bottom:0;" />
					</div>
				</c:if>
				<li class="login_free"><label for="rememberMe" title="下次不需要再登录"><input
						type="checkbox" id="rememberMe" name="rememberMe"
						${rememberMe ? 'checked' : ''} /> 记住账号密码</label></li>
				<li class="submit_btn"><button type="submit" id="login_btn">登
						录</button></li>
				<li class="reg_findPwd"><a href="register.html">免费注册</a> <a
					href="#">忘记密码</a></li>
			</form>

		</section>

		<div id="tFooter" class="footer">

			<footer>
				<div class="footer_l">
					<a href="#">安卓版</a> <span>|</span> <a href="#">电脑版</a> <span>|</span>
					<a href="#">WAP版</a> <span>|</span> <a href="#">服务协议</a>
				</div>
				<p class="copyRight">
					<span>&copy;@123.207.241.50</span> <span>工程学院ICP备888888888号</span>
				</p>

			</footer>
		</div>

	</div>
	<script src="${ctxStatic }/flash/zoom.min.js" type="text/javascript"></script>
</body>
</html>