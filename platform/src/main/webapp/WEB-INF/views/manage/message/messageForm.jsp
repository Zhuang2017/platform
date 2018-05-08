<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>留言信息管理</title>
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
		function addRow(list, idx, tpl, row){
			$(list).append(Mustache.render(tpl, {
				idx: idx, delBtn: true, row: row
			}));
			$(list+idx).find("select").each(function(){
				$(this).val($(this).attr("data-value"));
			});
			$(list+idx).find("input[type='checkbox'], input[type='radio']").each(function(){
				var ss = $(this).attr("data-value").split(',');
				for (var i=0; i<ss.length; i++){
					if($(this).val() == ss[i]){
						$(this).attr("checked","checked");
					}
				}
			});
		}
		function delRow(obj, prefix){
			var id = $(prefix+"_id");
			var delFlag = $(prefix+"_delFlag");
			if (id.val() == ""){
				$(obj).parent().parent().remove();
			}else if(delFlag.val() == "0"){
				delFlag.val("1");
				$(obj).html("&divide;").attr("title", "撤销删除");
				$(obj).parent().parent().addClass("error");
			}else if(delFlag.val() == "1"){
				delFlag.val("0");
				$(obj).html("&times;").attr("title", "删除");
				$(obj).parent().parent().removeClass("error");
			}
		}
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/message/message/">留言信息列表</a></li>
		<li class="active"><a href="${ctx}/message/message/form?id=${message.id}">留言信息<shiro:hasPermission name="message:message:edit">${not empty message.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="message:message:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="message" action="${ctx}/message/message/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">用户id：</label>
			<div class="controls">
				<sys:treeselect id="user" name="user.id" value="${message.user.id}" labelName="user.name" labelValue="${message.user.name}"
					title="用户" url="/sys/office/treeData?type=3" cssClass="" allowClear="true" notAllowSelectParent="true"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">托管机构：</label>
			<div class="controls">
				<form:input path="trusts" htmlEscape="false" maxlength="64" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">留言内容：</label>
			<div class="controls">
				<form:textarea path="content" htmlEscape="false" rows="4" maxlength="512" class="input-xxlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">主题：</label>
			<div class="controls">
				<form:input path="title" htmlEscape="false" maxlength="100" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">状态（0正常 1删除 2停用）：</label>
			<div class="controls">
				<form:input path="status" htmlEscape="false" maxlength="1" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注信息：</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="500" class="input-xxlarge "/>
			</div>
		</div>
			<div class="control-group">
				<label class="control-label">留言回复表：</label>
				<div class="controls">
					<table id="contentTable" class="table table-striped table-bordered table-condensed">
						<thead>
							<tr>
								<th class="hide"></th>
								<th>tea_id</th>
								<th>回复内容</th>
								<th>回复类型</th>
								<shiro:hasPermission name="message:message:edit"><th width="10">&nbsp;</th></shiro:hasPermission>
							</tr>
						</thead>
						<tbody id="mesReplyList">
						</tbody>
						<shiro:hasPermission name="message:message:edit"><tfoot>
							<tr><td colspan="5"><a href="javascript:" onclick="addRow('#mesReplyList', mesReplyRowIdx, mesReplyTpl);mesReplyRowIdx = mesReplyRowIdx + 1;" class="btn">新增</a></td></tr>
						</tfoot></shiro:hasPermission>
					</table>
					<script type="text/template" id="mesReplyTpl">//<!--
						<tr id="mesReplyList{{idx}}">
							<td class="hide">
								<input id="mesReplyList{{idx}}_id" name="mesReplyList[{{idx}}].id" type="hidden" value="{{row.id}}"/>
								<input id="mesReplyList{{idx}}_delFlag" name="mesReplyList[{{idx}}].delFlag" type="hidden" value="0"/>
							</td>
							<td>
								<input id="mesReplyList{{idx}}_teaId" name="mesReplyList[{{idx}}].teaId" type="text" value="{{row.teaId}}" maxlength="64" class="input-small "/>
							</td>
							<td>
								<textarea id="mesReplyList{{idx}}_content" name="mesReplyList[{{idx}}].content" rows="4" maxlength="255" class="input-small ">{{row.content}}</textarea>
							</td>
							<td>
								<input id="mesReplyList{{idx}}_type" name="mesReplyList[{{idx}}].type" type="text" value="{{row.type}}" maxlength="64" class="input-small "/>
							</td>
							<shiro:hasPermission name="message:message:edit"><td class="text-center" width="10">
								{{#delBtn}}<span class="close" onclick="delRow(this, '#mesReplyList{{idx}}')" title="删除">&times;</span>{{/delBtn}}
							</td></shiro:hasPermission>
						</tr>//-->
					</script>
					<script type="text/javascript">
						var mesReplyRowIdx = 0, mesReplyTpl = $("#mesReplyTpl").html().replace(/(\/\/\<!\-\-)|(\/\/\-\->)/g,"");
						$(document).ready(function() {
							var data = ${fns:toJson(message.mesReplyList)};
							for (var i=0; i<data.length; i++){
								addRow('#mesReplyList', mesReplyRowIdx, mesReplyTpl, data[i]);
								mesReplyRowIdx = mesReplyRowIdx + 1;
							}
						});
					</script>
				</div>
			</div>
		<div class="form-actions">
			<shiro:hasPermission name="message:message:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>