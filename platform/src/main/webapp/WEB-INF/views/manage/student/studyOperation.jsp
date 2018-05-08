<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>信息录入</title>
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
		<li class="active"><a href="${ctx}/student/student/operationList">信息列表</a></li>
	</ul>
	<form:form id="searchForm" modelAttribute="student" action="${ctx}/student/student/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>姓名：</label>
				<form:input path="name" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>性别：</label>
				<form:radiobuttons path="sex" items="${fns:getDictList('sex')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
			</li>
			<li><label>班级：</label>
				<form:input path="classesId" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>姓名</th>
				<th>性别</th>
				<th>班级</th>
				<shiro:hasPermission name="student:behaviour:edit"><th>表现情况</th></shiro:hasPermission>
				<shiro:hasPermission name="student:exam:edit"><th>考试成绩</th></shiro:hasPermission>
				<shiro:hasPermission name="student:homework:edit"><th>作业情况</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="student">
			<tr>
				<td><a href="${ctx}/student/student/form?id=${student.id}">
					${student.name}
				</a></td>
				<td>
					${fns:getDictLabel(student.sex, 'sex', '')}
				</td>
				<td>
					${student.classesId}
				</td>
				<shiro:hasPermission name="student:behaviour:edit"><td>
					<a href="${ctx}/student/behaviour/form?student.id=${student.id}">录入表现情况</a>
				</td></shiro:hasPermission>
				<shiro:hasPermission name="student:exam:edit"><td>
					<a href="${ctx}/student/exam/form?student.id=${student.id}">录入考试成绩</a>
				</td></shiro:hasPermission>
				<shiro:hasPermission name="student:homework:edit"><td>
					<a href="${ctx}/student/homework/form?student.id=${student.id}">录入作业情况</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>