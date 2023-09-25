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
<h3>내 정보 수정</h3>
<form action="${pageContext.request.contextPath }/member/edit" method="post">

id:<input type="text" name="id" value="${m.id }" readonly><br/>
pwd:<input type="text" name="pwd" value="${m.pwd }" ><br/>
name:<input type="text" name="name" value="${m.name }" ><br/>
tel:<input type="text" name="tel" value="${m.tel }" ><br/>
address:<input type="text" name="address" value="${m.address }" ><br/>
type:
<c:choose>
	<c:when test="${m.type==1 }">구매자</c:when>
	<c:when test="${m.type==2 }">판매자</c:when>
	<c:when test="${m.type==3 }">관리자</c:when>
	<c:otherwise>잘못된 type</c:otherwise>
</c:choose>
<br>
<input type="reset" value="취소"/>
<input type="submit" value="수정"/>

</form>
</body>
</html>