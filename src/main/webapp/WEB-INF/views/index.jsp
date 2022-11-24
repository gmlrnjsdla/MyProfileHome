<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/title.css">
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
					<tr>
						<td class="skillbox"><span class="title03">J</span><span class="title04">AVA</span></td>
						<td rowspan="6" class="picbox">
							<img width="695" src="${pageContext.request.contextPath }/resources/img/home.jpg">
						</td>
					</tr>
					<tr>
						<td class="skillbox"><span class="title03">J</span><span class="title04">SP</span></td>
					
					</tr>
					<tr>
						<td class="skillbox"><span class="title03">S</span><span class="title04">PRINGBOOT</span></td>
					
					</tr>
					<tr>
						<td class="skillbox"><span class="title03">J</span><span class="title04">AVASCRIPT</span></td>
						
					</tr>
					<tr>
						<td class="skillbox"><span class="title03">H</span><span class="title04">TML5</span></td>
						
					</tr>
					<tr>
						<td class="skillbox"><span class="title03">D</span><span class="title04">ATABASE</span></td>
						
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