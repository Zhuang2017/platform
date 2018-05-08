<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>班级信息管理</title>
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
		<li class="active"><a href="${ctx}/classes/classes/">班级信息列表</a></li>
		<shiro:hasPermission name="classes:classes:edit"><li><a href="${ctx}/classes/classes/form">班级信息添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="classes" action="${ctx}/classes/classes/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>班级名称：</label>
				<form:input path="name" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>托管机构：</label>
				<form:input path="trusts" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>班级名称</th>
				<th>托管机构</th>
				<th>修改时间</th>
				<th>备注信息</th>
				<shiro:hasPermission name="classes:classes:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="classes">
			<tr>
				<td><a href="${ctx}/classes/classes/form?id=${classes.id}">
					${classes.name}
				</a></td>
				<td>
					${classes.trusts}
				</td>
				<td>
					<fmt:formatDate value="${classes.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${classes.remarks}
				</td>
				<shiro:hasPermission name="classes:classes:edit"><td>
    				<a href="${ctx}/classes/classes/form?id=${classes.id}">修改</a>
					<a href="${ctx}/classes/classes/delete?id=${classes.id}" onclick="return confirmx('确认要删除该班级信息吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>