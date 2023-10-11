<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 카테고리 번호 이름  --> 


[

<c:forEach var="i" items="${rlist }" varStatus="status">
	
	<c:if test="${not status.first }">,</c:if>
	
	{room_id:${i.room_id }, room_name:'${i.room_name }', room_type:${i.room_type }, room_info:'${i.room_info }', room_img:'${i.room_img }', price:${i.price } } 

</c:forEach>

]
