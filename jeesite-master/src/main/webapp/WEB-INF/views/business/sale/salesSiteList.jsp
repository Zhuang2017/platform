<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>销售网站管理</title>
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
		<li class="active"><a href="${ctx}/sale/salesSite/">销售网站列表</a></li>
		<shiro:hasPermission name="sale:salesSite:edit"><li><a href="${ctx}/sale/salesSite/form">销售网站添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="salesSite" action="${ctx}/sale/salesSite/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>编号：</label>
				<form:input path="number" htmlEscape="false" maxlength="11" class="input-medium"/>
			</li>
			<li><label>服务器地址：</label>
				<form:input path="serverAddress" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>ip：</label>
				<form:input path="ip" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>网站状态：</label>
				<form:select path="status" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('site_status')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>上线日期：</label>
				<input name="beginOnlineDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${salesSite.beginOnlineDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/> - 
				<input name="endOnlineDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${salesSite.endOnlineDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>域名：</label>
				<form:input path="domainName" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>地区：</label>
				<form:input path="region" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>临时域名：</label>
				<form:input path="tempDomainName" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>编号</th>
				<th>服务器地址</th>
				<th>ip</th>
				<th>网站状态</th>
				<th>上线日期</th>
				<th>域名</th>
				<th>用户名</th>
				<th>密码</th>
				<th>地区</th>
				<th>临时域名</th>
				<!-- <th>数据库密码</th> -->
				<th>数据库用户名</th>
				<!-- <th>更新时间</th>
				<th>备注信息</th> -->
				<shiro:hasPermission name="sale:salesSite:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="salesSite">
				<c:choose>
					<c:when
						test="${salesSite.status == 1}">
						<tr bgcolor="#FF0000">
					</c:when>
					<c:otherwise>
						<tr>
					</c:otherwise>
				</c:choose>
				<td><a href="${ctx}/sale/salesSite/form?id=${salesSite.id}">
					${salesSite.number}
				</a></td>
				<td>
					${salesSite.serverAddress}
				</td>
				<td>
					${salesSite.ip}
				</td>
				<td>
					${fns:getDictLabel(salesSite.status, 'site_status', '')}
				</td>
				<td>
					<fmt:formatDate value="${salesSite.onlineDate}" pattern="yyyy-MM-dd"/>
				</td>
				<td>
					${salesSite.domainName}
				</td>
				<td>
					${salesSite.userName}
				</td>
				<td>
					${salesSite.password}
				</td>
				<td>
					${salesSite.region}
				</td>
				<td>
					${salesSite.tempDomainName}
				</td>
				<%-- <td>
					${salesSite.databasePassword}
				</td> --%>
				<td>
					${salesSite.databaseUsername}
				</td>
				<%-- <td>
					<fmt:formatDate value="${salesSite.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${salesSite.remarks}
				</td> --%>
				<shiro:hasPermission name="sale:salesSite:edit"><td>
    				<a href="${ctx}/sale/salesSite/form?id=${salesSite.id}">修改</a>
					<a href="${ctx}/sale/salesSite/delete?id=${salesSite.id}" onclick="return confirmx('确认要删除该销售网站吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>