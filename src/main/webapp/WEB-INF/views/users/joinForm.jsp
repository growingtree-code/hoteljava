<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>

$(document).ready(function() {
	$("#emailCheck").click(function() {
		$.post( "/users/emailCheck", { email: $("#email").val()} )
	    .done(function( data ) {
	    	$("#idResult").text(data);
	  });
	});
	$("#join").click(function() {
		if($("#idResult").text().trim()=="��밡��"){
			$("form").submit();
		}else{
			alert("id �ߺ�üũ ����");
		}
	});
});
	
</script>
</head>
<body>
	<h3>ȸ������</h3>
	<form action="${pageContext.request.contextPath }/users/join" method="post">
		
		email: <input type="text" name="email" id="email">
		<input type="button" id="emailCheck" value="email �ߺ�üũ">
			<span id="idResult"></span> <br>
		
		pwd:<input type="password" name="pwd"><br /> 
		
		name:<input	type="text" name="name"><br />
		
		type:<input type="radio" name="type" value="1">������
				<input type="radio" name="type" value="2">�Ǹ���
				<input type="radio" name="type" value="0">������<br/>

		<button type="button" onClick="location.href='/users/loginForm'">���</button>
		<input type="button" value="����" id = "join"> <br />
	</form>
	
</body>
</html>



