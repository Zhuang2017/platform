<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>作业完成情况管理</title>
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
		<li class="active"><a href="${ctx}/student/homework/">作业完成情况列表</a></li>
		<shiro:hasPermission name="student:homework:edit"><li><a href="${ctx}/student/homework/form">作业完成情况添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="homework" action="${ctx}/student/homework/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>科目：</label>
				<form:select path="subject" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('subject')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>题目：</label>
				<form:input path="title" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>科目</th>
				<th>学生</th>
				<th>教师</th>
				<th>题目</th>
				<th>布置时间</th>
				<th>完成时间</th>
				<th>完成情况</th>
				<th>更新者</th>
				<th>更新时间</th>
				<th>备注信息</th>
				<shiro:hasPermission name="student:homework:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="homework">
			<tr>
				<td><a href="${ctx}/student/homework/form?id=${homework.id}">
					${fns:getDictLabel(homework.subject, 'subject', '')}
				</a></td>
				<td>
					${homework.student}
				</td>
				<td>
					${homework.}
				</td>
				<td>
					${homework.title}
				</td>
				<td>
					<fmt:formatDate value="${homework.assignTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					<fmt:formatDate value="${homework.completionTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${homework.comment}
				</td>
				<td>
					${homework.}
				</td>
				<td>
					<fmt:formatDate value="${homework.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${homework.remarks}
				</td>
				<shiro:hasPermission name="student:homework:edit"><td>
    				<a href="${ctx}/student/homework/form?id=${homework.id}">修改</a>
					<a href="${ctx}/student/homework/delete?id=${homework.id}" onclick="return confirmx('确认要删除该作业完成情况吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>