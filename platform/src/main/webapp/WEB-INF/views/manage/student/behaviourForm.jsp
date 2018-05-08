<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>表现信息管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/student/behaviour/">表现信息列表</a></li>
		<li class="active"><a href="${ctx}/student/behaviour/form?id=${behaviour.id}">表现信息<shiro:hasPermission name="student:behaviour:edit">${not empty behaviour.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="student:behaviour:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="behaviour" action="${ctx}/student/behaviour/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<form:hidden path="student.id"/>
		<%-- <input type="hidden" name="student.id" value="${student.id }"/> --%>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">学生：</label>
			<div class="controls">
				<%-- <sys:treeselect id="student" name="student" value="${behaviour.student}" labelName="" labelValue="${behaviour.student.name}"
					title="用户" url="/sys/office/treeData?type=3" cssClass="" allowClear="true" notAllowSelectParent="true"/> --%>
				<%-- <input type="text" name="student.name" value="${student.name }" readonly="true"/> --%>
				<form:input path="student.name" htmlEscape="false" maxlength="50" class="required" readonly="true"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">日期：</label>
			<div class="controls">
				<input name="behaDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${behaviour.behaDate}" pattern="yyyy-MM-dd"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">内容 ：</label>
			<div class="controls">
				<form:textarea path="content" htmlEscape="false" rows="4" maxlength="512" class="input-xxlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">评价：</label>
			<div class="controls">
				<form:textarea path="comment" htmlEscape="false" maxlength="255" class="input-xlarge "/>
			</div>
		</div>
		<%-- <div class="control-group">
			<label class="control-label">教师名称：</label>
			<div class="controls">
				<sys:treeselect id="teacher" name="teacher" value="${behaviour.teacher}" labelName="" labelValue="${behaviour.teacher.name}"
					title="用户" url="/sys/office/treeData?type=3" cssClass="" allowClear="true" notAllowSelectParent="true"/>
			</div>
		</div> --%>
		<%-- <div class="control-group">
			<label class="control-label">状态（0正常 1删除 2停用）：</label>
			<div class="controls">
				<form:input path="status" htmlEscape="false" maxlength="1" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div> --%>
		<div class="control-group">
			<label class="control-label">备注信息：</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="500" class="input-xxlarge "/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="student:behaviour:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>