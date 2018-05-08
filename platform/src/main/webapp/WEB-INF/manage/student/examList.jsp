<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>成绩信息管理</title>
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
		<li class="active"><a href="${ctx}/student/exam/">成绩信息列表</a></li>
		<shiro:hasPermission name="student:exam:edit"><li><a href="${ctx}/student/exam/form">成绩信息添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="exam" action="${ctx}/student/exam/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>学生：</label>
				<form:input path="student" htmlEscape="false" maxlength="11" class="input-medium"/>
			</li>
			<li><label>科目：</label>
				<form:select path="subject" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>考试日期：</label>
				<input name="beginExamTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${exam.beginExamTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/> - 
				<input name="endExamTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${exam.endExamTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>考试名称：</label>
				<form:input path="examName" htmlEscape="false" maxlength="64" class="input-medium"/>
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
				<th>科目</th>
				<th>分数</th>
				<th>考试日期</th>
				<th>考试名称</th>
				<th>更新时间</th>
				<th>备注信息</th>
				<shiro:hasPermission name="student:exam:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="exam">
			<tr>
				<td><a href="${ctx}/student/exam/form?id=${exam.id}">
					${exam.student}
				</a></td>
				<td>
					${fns:getDictLabel(exam.subject, '', '')}
				</td>
				<td>
					${exam.score}
				</td>
				<td>
					<fmt:formatDate value="${exam.examTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${exam.examName}
				</td>
				<td>
					<fmt:formatDate value="${exam.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${exam.remarks}
				</td>
				<shiro:hasPermission name="student:exam:edit"><td>
    				<a href="${ctx}/student/exam/form?id=${exam.id}">修改</a>
					<a href="${ctx}/student/exam/delete?id=${exam.id}" onclick="return confirmx('确认要删除该成绩信息吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>