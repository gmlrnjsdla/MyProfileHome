<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/title.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/content.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/list.css">
<title>** Heekwon's Profile **</title>
</head>
<body>
	<%@ include file="include/header.jsp" %>
	<center>
	<table width="1500" border="0" cellspacing="0" cellpadding="20">
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
							<table width="80%" border="0" cellspacing="0" cellpadding="10">
									<tr class="listbox01">
										<td><span class="content_text02">NO</span></td>
										<td><span class="content_text02">ID</span></td>
										<td width="45%"><span class="content_text02">QUESTION</span></td>
										<td><span class="content_text02">NAME</span></td>
										<td><span class="content_text02">DATE</span></td>
									</tr>
									<c:forEach items="${list}" var="list">
									<tr class="listbox02">
										<td>${list.qnum}</td>
										<td>${list.qid}</td>
										<c:choose>
											<c:when test="${list.qcontent.length() >28 }">
												<td align="left"><a href="contentView?qnum=${list.qnum}">${list.qcontent.substring(0,27)}...</a></td>
											</c:when>
											<c:otherwise>
												<td align="left"><a href="contentView?qnum=${list.qnum}">${list.qcontent}</a></td>										
											</c:otherwise>
										</c:choose>
										<td>${list.qname}</td>
										<td>${list.qdate.substring(0,10)}</td>
									</tr>
									</c:forEach>
									<tr>
										<td colspan = "5" align="center">
											<c:if test="${pageMaker.prev}">
												<a href="list?pageNum=${pageMaker.startPage - 5}">prev</a>&nbsp;&nbsp;
											</c:if>
											<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="num">
												<c:choose>
													<c:when test="${num == pageNum }">
														<u style="color:black;">${num}</u>&nbsp;&nbsp;
													</c:when>
													<c:otherwise>
														<a href="list?pageNum=${num}">${num}</a>&nbsp;&nbsp;
													</c:otherwise>
												</c:choose>
											</c:forEach>
											<c:if test="${pageMaker.next}">
												<a href="list?pageNum=${pageMaker.startPage + 5}">next</a>
											</c:if>
										</td>
									</tr>
							</table>
							<input class="button_type02" type="button" value="????????????" onclick="script:window.location='question'">
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