<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>托管机构管理</title>
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
		<li class="active"><a href="${ctx}/trusts/trusts/">托管机构列表</a></li>
		<shiro:hasPermission name="trusts:trusts:edit"><li><a href="${ctx}/trusts/trusts/form">托管机构添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="trusts" action="${ctx}/trusts/trusts/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>机构名称：</label>
				<form:input path="name" htmlEscape="false" maxlength="30" class="input-medium"/>
			</li>
			<li><label>园长：</label>
				<sys:treeselect id="leader" name="leader.id" value="${trusts.leader.id}" labelName="" labelValue="${trusts.}"
					title="用户" url="/sys/office/treeData?type=3" cssClass="input-small" allowClear="true" notAllowSelectParent="true"/>
			</li>
			<li><label>机构地址：</label>
				<form:input path="address" htmlEscape="false" maxlength="30" class="input-medium"/>
			</li>
			<li><label>联系电话：</label>
				<form:input path="phone" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>机构名称</th>
				<th>园长</th>
				<th>机构地址</th>
				<th>联系电话</th>
				<th>学生总数</th>
				<th>更新时间</th>
				<th>备注信息</th>
				<shiro:hasPermission name="trusts:trusts:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="trusts">
			<tr>
				<td><a href="${ctx}/trusts/trusts/form?id=${trusts.id}">
					${trusts.name}
				</a></td>
				<td>
					${trusts.}
				</td>
				<td>
					${trusts.address}
				</td>
				<td>
					${trusts.phone}
				</td>
				<td>
					${trusts.stuCount}
				</td>
				<td>
					<fmt:formatDate value="${trusts.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${trusts.remarks}
				</td>
				<shiro:hasPermission name="trusts:trusts:edit"><td>
    				<a href="${ctx}/trusts/trusts/form?id=${trusts.id}">修改</a>
					<a href="${ctx}/trusts/trusts/delete?id=${trusts.id}" onclick="return confirmx('确认要删除该托管机构吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>