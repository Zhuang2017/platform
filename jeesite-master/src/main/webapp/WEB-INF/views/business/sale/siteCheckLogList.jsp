<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>日志管理</title>
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
		<li class="active"><a href="${ctx}/sale/siteCheckLog/">日志列表</a></li>
		<shiro:hasPermission name="sale:siteCheckLog:edit"><li><a href="${ctx}/sale/siteCheckLog/form">日志添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="siteCheckLog" action="${ctx}/sale/siteCheckLog/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>检测网站：</label>
				<form:input path="salesSite.id" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>商品总数：</label>
				<form:input path="itemTotal" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>网站状态：</label>
				<form:input path="status" htmlEscape="false" maxlength="1" class="input-medium"/>
			</li>
			<li><label>检测时间：</label>
				<input name="createDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${siteCheckLog.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
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
				<th>检测网站</th>
				<th>状态码</th>
				<th>检测结果</th>
				<th>检测日志</th>
				<th>商品总数</th>
				<th>网站状态</th>
				<th>检测时间</th>
				<th>更新时间</th>
				<th>备注信息</th>
				<shiro:hasPermission name="sale:siteCheckLog:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="siteCheckLog">
			<tr>
				<td><a href="${ctx}/sale/siteCheckLog/form?id=${siteCheckLog.id}">
					${siteCheckLog.salesSite.id}
				</a></td>
				<td>
					${siteCheckLog.statusCode}
				</td>
				<td>
					${siteCheckLog.checkResult}
				</td>
				<td>
					${siteCheckLog.checkLog}
				</td>
				<td>
					${siteCheckLog.itemTotal}
				</td>
				<td>
					${siteCheckLog.status}
				</td>
				<td>
					<fmt:formatDate value="${siteCheckLog.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					<fmt:formatDate value="${siteCheckLog.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${siteCheckLog.remarks}
				</td>
				<shiro:hasPermission name="sale:siteCheckLog:edit"><td>
    				<a href="${ctx}/sale/siteCheckLog/form?id=${siteCheckLog.id}">修改</a>
					<a href="${ctx}/sale/siteCheckLog/delete?id=${siteCheckLog.id}" onclick="return confirmx('确认要删除该日志吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>