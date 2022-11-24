<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/hyperlink.css">
<title>header</title>
</head>
<body>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr class="headline01">
		<%
			String sid = (String) session.getAttribute("sessionID");
			if(sid==null){
		%>
				<td width="65%" class="menu01">&nbsp;</td>
			<td width="5%" class="menu01"><a href="index">HOME</a></td>
			<td width="5%" class="menu01"><a href="login">LOGIN</a></td>
			<td width="5%" class="menu01"><a href="join">JOIN</a></td>
			<td width="6%" class="menu01"><a href="profile">PROFILE</a></td>
			<td width="7%" class="menu01"><a href="question">QUESTION</a></td>
			<td width="6%" class="menu01"><a href="contact">CONTACT</a></td>
			<td width="2%">&nbsp;</td>		
		<%
			}else{
		%>
				<td width="65%" class="menu01"><%=sid %>님 로그인중...</td>
			<td width="5%" class="menu01"><a href="index">HOME</a></td>
			<td width="6%" class="menu01"><a href="logout">LOGOUT</a></td>
			<td width="6%" class="menu01"><a href="member_modify">MODIFY</a></td>
			<td width="6%" class="menu01"><a href="profile">PROFILE</a></td>
			<td width="7%" class="menu01"><a href="question">QUESTION</a></td>
			<td width="6%" class="menu01"><a href="contact">CONTACT</a></td>
			<td width="2%">&nbsp;</td>
		<%
			}
		%>
			
		</tr>
		<tr class="headline02">
			<td>&nbsp;</td>
		</tr>
	</table>
</body>
</html>