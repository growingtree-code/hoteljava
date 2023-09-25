<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(document).ready(
			function() {
				$.post("/admin/getsub", {
					type : 1,
					p_id : 0
				}).done(
						function(data) {
							var c = eval("(" + data + ")");
							for (i = 0; i < c.length; i++) {
								$("#s1").append(
										"<option value='"+c[i].id+"'>"
												+ c[i].name + "</option>");
							}
						});

				$("#s1").click(
						function() {
							var x = 0;
							x = this.options[this.options.selectedIndex].value
							$.post("/admin/getsub", {
								type : 2,
								p_id : x
							}).done(
									function(data) {
										var c = eval("(" + data + ")");
										$("#s2").empty();
										$("#s3").empty();
										for (i = 0; i < c.length; i++) {
											$("#s2").append(
													"<option value='"+c[i].id+"'>"
															+ c[i].name
															+ "</option>");
										}
									});
						});

				$("#s2").click(
						function() {
							var x = 0;
							x = this.options[this.options.selectedIndex].value
							$.post("/admin/getsub", {
								type : 3,
								p_id : x
							}).done(
									function(data) {
										var c = eval("(" + data + ")");
										$("#s3").empty();
										for (i = 0; i < c.length; i++) {
											$("#s3").append(
													"<option value='"+c[i].id+"'>"
															+ c[i].name
															+ "</option>");
										}
									});
						});

			});
</script>
</head>
<body>
	<h3>상품 등록 페이지</h3>
	<form action="${pageContext.request.contextPath }/seller/add" 
	method="post" enctype="multipart/form-data"> 
	대분류<select id="s1" name="category1_id"></select>
	중분류<select id="s2" name="category2_id"></select>
	소분류<select id="s3" name="category3_id"></select>	<br>
	name:<input type="text" name="name"><br>
	info:<input type="text" name="info"><br>
	quantity:<input type="text" name="quantity"><br>
	price:<input type="text" name="price"><br>
	seller_id:<input type="text" name="seller_id" 
	value="${sessionScope.id }" readonly><br>
	img1:<input type="file" name="file1"><br>
	img2:<input type="file" name="file2"><br>
	img3:<input type="file" name="file3"><br>
	<input type="reset" value="취소">	<input type="submit" value="등록">
	</form>
</body>
</html>