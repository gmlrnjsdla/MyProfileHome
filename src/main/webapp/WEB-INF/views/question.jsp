<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/title.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/content.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/question.js"></script>
<title>** Heekwon's Profile **</title>
</head>
<body>
	<%@ include file="include/header.jsp" %>
	<center>
	<table width="75%" border="0" cellspacing="0" cellpadding="20">
		<tr>
			<td class="titlebox">
				<span class="title01">DEVELOPER HEEKWON'S PROFILE</span>
			</td>
		</tr>
		<tr>
			<td class="titlebox">
				<span class="title02">I'm Heekwon Lim, a developer who wants a development job. Please call me back.</span>
			</td>
		</tr>
		<tr>
			<td>
				<center>
				<table width="80%" border="0" cellspacing="0" cellpadding="10">
					<tr class="contentbox">
						<td class="content">
							<center>						
							<table border="0" cellspacing="0" cellpadding="10">
								<form action="questionOk" method="post" name="question_frm">
									<tr>
										<td><span class="content_text01">MEMBER ID</span></td>
										<td><input class="input_type01" type="text" name="qid" value="${mid}" readonly="true"></td>
									</tr>
									<tr>
										<td><span class="content_text01">NAME</span></td>
										<td><input class="input_type01" type="text" name="qname" value="${mname}" readonly="true"></td>
									</tr>
									<tr>
										<td><span class="content_text01">QUESTION</span></td>
										<td><textarea class="textarea_type01" rows="5" cols="30" name="qcontent"></textarea></td>
									</tr>									
									<tr>
										<td><span class="content_text01">E-MAIL</span></td>
										<%
											if(sid == null){
										%>
												<td><input class="input_type01" type="text" name="qemail"></td>
										<%	
											}else{
										%>
												<td><input class="input_type01" type="text" name="qemail" value="${memail}" readonly="true"></td>
										<%
											}
										%>
										
									</tr>
									
									<tr>
										<td colspan="2">
											<input class="button_type01" type="button" value="????????????" onclick="questionCheck()">&nbsp;&nbsp;
											<input class="button_type01" type="button" value="?????????" onclick="script:window.location='list'">
										</td>
									</tr>
								</form>							
							</table>
							</center>							
						</td>						
					</tr>
					
				</table>
				</center>			
			</td>
		</tr>
	</table>
	</center>
	<%@ include file="include/footer.jsp" %>
</body>
</html>