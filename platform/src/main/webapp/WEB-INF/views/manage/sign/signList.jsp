<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>签到信息管理</title>
	<meta name="decorator" content="default"/>
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
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/sign/sign/">签到信息列表</a></li>
		<shiro:hasPermission name="sign:sign:edit"><li><a href="${ctx}/sign/sign/form">签到信息添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="sign" action="${ctx}/sign/sign/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>签到日期：</label>
				<input name="beginSignDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${sign.beginSignDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/> - 
				<input name="endSignDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${sign.endSignDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>学生</th>
				<th>签到日期</th>
				<th>第一次签到</th>
				<th>sign_time1</th>
				<th>第二次签到</th>
				<th>sign_time2</th>
				<th>第三次签到</th>
				<th>sign_time3</th>
				<th>第四次签到</th>
				<th>sign_time4</th>
				<th>更新时间</th>
				<th>备注信息</th>
				<shiro:hasPermission name="sign:sign:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="sign">
			<tr>
				<td><a href="${ctx}/sign/sign/form?id=${sign.id}">
					${sign.student}
				</a></td>
				<td>
					<fmt:formatDate value="${sign.signDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${sign.signNo1}
				</td>
				<td>
					<fmt:formatDate value="${sign.signTime1}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${sign.signNo2}
				</td>
				<td>
					<fmt:formatDate value="${sign.signTime2}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${sign.signNo3}
				</td>
				<td>
					<fmt:formatDate value="${sign.signTime3}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${sign.signNo4}
				</td>
				<td>
					<fmt:formatDate value="${sign.signTime4}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					<fmt:formatDate value="${sign.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${sign.remarks}
				</td>
				<shiro:hasPermission name="sign:sign:edit"><td>
    				<a href="${ctx}/sign/sign/form?id=${sign.id}">修改</a>
					<a href="${ctx}/sign/sign/delete?id=${sign.id}" onclick="return confirmx('确认要删除该签到信息吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>