<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>表现信息管理</title>
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
		<li class="active"><a href="${ctx}/student/behaviour/">表现信息列表</a></li>
		<shiro:hasPermission name="student:behaviour:edit"><li><a href="${ctx}/student/behaviour/form">表现信息添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="behaviour" action="${ctx}/student/behaviour/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>学生：</label>
				<sys:treeselect id="student" name="student" value="${behaviour.student}" labelName="" labelValue="${behaviour.student}"
					title="用户" url="/sys/office/treeData?type=3" cssClass="input-small" allowClear="true" notAllowSelectParent="true"/>
			</li>
			<li><label>表现的时间：</label>
				<input name="behaDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${behaviour.behaDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>教师：</label>
				<sys:treeselect id="teacher" name="teacher" value="${behaviour.teacher}" labelName="" labelValue="${behaviour.teacher}"
					title="用户" url="/sys/office/treeData?type=3" cssClass="input-small" allowClear="true" notAllowSelectParent="true"/>
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
				<th>日期</th>
				<th>内容</th>
				<th>评价</th>
				<th>教师</th>
				<th>更新时间</th>
				<th>备注信息</th>
				<shiro:hasPermission name="student:behaviour:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="behaviour">
			<tr>
				<%-- <td><a href="${ctx}/student/behaviour/form?id=${behaviour.id}">
					${behaviour.title}
				</a></td> --%>
				<td>
					${behaviour.student.name}
				</td>
				<td>
					<fmt:formatDate value="${behaviour.behaDate}" pattern="yyyy-MM-dd"/>
				</td>
				<td>
					${behaviour.content}
				</td>
				<td>
					${behaviour.comment}
				</td>
				<td>
					${behaviour.teacher.name}
				</td>
				<td>
					<fmt:formatDate value="${behaviour.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${behaviour.remarks}
				</td>
				<shiro:hasPermission name="student:behaviour:edit"><td>
    				<a href="${ctx}/student/behaviour/form?id=${behaviour.id}">修改</a>
					<a href="${ctx}/student/behaviour/delete?id=${behaviour.id}" onclick="return confirmx('确认要删除该表现信息吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>