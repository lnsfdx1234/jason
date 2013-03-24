<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">
<head>
	<%@ include file="/common/global.jsp"%>
	<title>登录页</title>
	<script>
		var logon = ${not empty user};
		if (logon) {
			location.href = '${ctx}/main/index';
		}
	</script>
	
	<link rel="stylesheet" type="text/css" href="${ctx}/hzbank/activiti/styles.css">
	
	
</head>

<body scroll="auto" class="v-generated-body v-sa v-ch v-webkit v-win login-general">
	<div id="login-central-components">
		<div id="login-content" location="login-content" style="">
			<div
				class="v-customcomponent v-customcomponent-v-loginform v-loginform"
				style="height: 200px; width: 360px;">
				<div class="v-embedded v-embedded-browser"
					style="height: 200px; width: 360px;">
					<form id="loginf" target="logintarget"
						onkeypress="submitOnEnter(event)" method="post"
						action="${ctx}/main/index">
						<table width="100%">
							<tbody>
								<tr>
									<td class="login-field-caption">用户名</td>
									<td width="80%"><input class="login-field" type="text"
										name="username">
									</td>
								</tr>
								<tr>
									<td class="login-field-caption">密码</td>
									<td><input class="login-field" type="password"
										name="password">
									</td>
								</tr>
							</tbody>
						</table>
						<div>
							<div onclick="document.forms[0].submit();" tabindex="0"
								class="login-button" role="button">
								<span>登录</span>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<div id="login-background">
		<div id="login-logo">
			<img src="${ctx}/hzbank/activiti/2.png">
		</div>
	</div>
</body>
</html>
