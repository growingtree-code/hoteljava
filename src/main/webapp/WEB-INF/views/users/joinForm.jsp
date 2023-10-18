<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
	<title>Hotel JAVA : ȸ������</title>

	<!-- Bootstrap core CSS -->
	<link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

	<!-- Additional CSS Files -->
	<link rel="stylesheet" href="../assets/css/fontawesome.css">
	<link rel="stylesheet" href="../assets/css/templatemo-cyborg-gaming.css">
	<link rel="stylesheet" href="../assets/css/owl.css">
	<link rel="stylesheet" href="../assets/css/animate.css">
	<link rel="stylesheet"href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>

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
			var emailValue = $("#email").val().trim();

			if (emailValue === "") {
				if (confirm("�̸��� �ּҸ� �Է����ּ���")) {
					window.location.reload();
				}
			} else {
				if($("#idResult").text().trim()=="��밡���� �̸����Դϴ�."){
					if (confirm("��� �����Ͻðڽ��ϱ�?")) {
						window.location.href = $(this).attr("href");
					}
					$("#join_btn").submit();
				}else{
					alert("�̸��� �ߺ�üũ �����������ּ���");
				}
			}
		});
	});
	</script>
	<style>
		#emailCheck{
			background-color: #744285;
			color: #fff;
		}
		#emailCheck:hover{
			background-color: white;
			color:#744285 ;
		}
	</style>
</head>
<body>
	<!-- loding view -->
	<div id="js-preloader" class="js-preloader">
		<div class="preloader-inner">
			<span class="dot"></span>
			<div class="dots">
				<span></span>
				<span></span>
				<span></span>
			</div>
		</div>
	</div>
	<!-- loding view end -->

    <!-- ***** Header Area Start ***** -->
    <%@ include file="../nav.jsp" %>
    <!-- ***** Header Area End ***** -->

	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="page-content">
					<div class="heading-section" style="justify-content: center; display: flex">
						<h4>ȸ������</h4>
					</div>
					<!-- ***** Banner Start ***** -->
					<div class="row">
						<div class="col-lg-12">
							<div class="main-profile">
								<div class="align-self-center"style="display: flex; align-items: center;">
									<%--�α��� �̹���--%>
									<div class="col-lg-4" style="width:25%;margin:1% 10% 1% 10%;">
										<img  src="../assets/images/joinHotelJava.png" alt="" style="width: 370px; height: auto; border-radius: 23px;">
									</div>
										<form id = "join_btn" action="${pageContext.request.contextPath }/users/join" method="post">
											<div class="main-info header-text">
												<div class="item" style="padding-top: 10%;">
													<ul>
														<li>
															<h5 style="display: inline-block; width: 10vw;">�̸���</h5>
															<input type="text" name="email" id="email" placeholder="�̸����� �Է����ּ���."
																   style="color:#bbb; border: none; border-radius: 23px; background-color: #27292a;">
															<input type="button" id="emailCheck" name="emailCheck" value="�̸��� �ߺ�üũ"
																   style="
																	font-size: 13px;
																	font-weight: 600;
																	padding: 10px;
																	border-radius: 40px;
																	">
														</li>
														<div id="idResult" style="color: #b28df5; font-weight: bold;display:flex; justify-content: center;"></div> <br>
														<li>
															<h5 style="display: inline-block; width: 10vw;">��й�ȣ</h5>
															<input type="password" name="pwd"  placeholder="��й�ȣ�� �Է����ּ���."
																   style="color:#bbb; border: none; border-radius: 23px; background-color: #27292a;">
														</li>
														<li>
															<h5 style="display: inline-block; width: 10vw;">�̸�</h5>
															<input type="text" name="name" placeholder="�̸��� �Է����ּ���."
																   style="color:#bbb; border: none; border-radius: 23px; background-color: #27292a;">
														</li>
														<li>
															<h5 style="display: inline-block; width: 10vw;">��������</h5>
															<input type="radio" name="type" value="1">������
															<input type="radio" name="type" value="2">�Ǹ���
														</li>
													</ul>

													<div class="main-button" style="display: inline;">
														<a href="${pageContext.request.contextPath }/users/loginForm"style="font-weight: bold;margin-left: 55%; margin-right: 5%;">���</a>
													</div>
													<div class="main-border-button" style="display: inline;">
														<a id="join" href="javascript:void(0);" style="font-weight: bold; margin-top: 30px">����</a>
													</div>
												</div>
											</div>
										</form>
								</div>
							</div>
						</div>
					</div>
					<!-- ***** Banner End ***** -->
				</div>
			</div>
		</div>
	</div>


	<!-- Scripts -->
	<!-- Bootstrap core JavaScript -->
	<script src="../vendor/jquery/jquery.min.js"></script>
	<script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

	<script src="../assets/js/isotope.min.js"></script>
	<script src="../assets/js/owl-carousel.js"></script>
	<script src="../assets/js/tabs.js"></script>
	<script src="../assets/js/popup.js"></script>
	<script src="../assets/js/custom.js"></script>
</body>
</html>



