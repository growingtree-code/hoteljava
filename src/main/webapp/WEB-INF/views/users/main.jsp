<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
${sessionScope.name }�� �α��� ����
<a href="${pageContext.request.contextPath }/users/editForm">����������</a><br>
<a href="${pageContext.request.contextPath }/users/logout">�α׾ƿ�</a><br>
<a href="${pageContext.request.contextPath }/users/out">Ż��</a><br>

<%--<c:if test="${sessionScope.type==1 }">--%>
<%--	<c:set var="path" value="/seller/allList"/>--%>
<%--</c:if>--%>
<%--<c:if test="${sessionScope.type==2 }">--%>
<%--	<c:set var="path" --%>
<%--	value="/seller/myList"/>--%>
<%--</c:if>--%>

<%--<c:if test="${sessionScope.type==0 }">--%>
<%--	<c:set var="path" --%>
<%--	value="/users/adminPage"/>--%>
<%--</c:if>--%>
<%--<c:import url="${path }"></c:import>--%>


</body>
</html>



