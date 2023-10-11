<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<meta
				name="viewport"
				content="width=device-width, initial-scale=1, shrink-to-fit=no"
		/>
		<link
				href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
				rel="stylesheet"
		/>

	<title>Hotel JAVA : 관리자 페이지</title>

	<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
</head>
<body>
<%--	<%@ include file="../nav.jsp" %>--%>
	<h3>관리자</h3>


	<br>
	회원관리:

<table>
	<tr>
		<th>회원번호</th>
		<th>이메일</th>
		<th>이름</th>
		<th>포인트</th>
		<th>타입</th>
	</tr>
	<c:forEach var="users" items="${users}">
		<tr>
			<td>${users.user_id}</td>
			<td>${users.email}</td>
			<td>${users.name}</td>
			<td>${users.point}</td>
			<td>${users.type}</td>
<%--			<c:when test="${users.type == 1}">--%>
<%--				<td>판매자</td>--%>
<%--			</c:when>--%>
<%--			<c:when test="${users.type == 2}">--%>
<%--				<td>구매자</td>--%>
<%--			</c:when>--%>
			<td>${users.type}</td>
		</tr>
	</c:forEach>

</table>


</body>
</html>