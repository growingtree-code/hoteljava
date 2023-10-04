<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
	<title>Hotel JAVA : 회원가입</title>

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
			if($("#idResult").text().trim()=="사용가능"){
				$("form").submit();
			}else{
				alert("id 중복체크 먼저");
			}
		});
	});
	</script>
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
	<header class="header-area header-sticky">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav class="main-nav">
						<!-- ***** Logo Start ***** -->
						<a href="${pageContext.request.contextPath }/index" class="logo">
							<img src="../assets/images/hotelJAVA.png" alt="" />
						</a>
						<!-- ***** Logo End ***** -->
						<!-- ***** Search End ***** -->
						<div class="search-input">
							<form id="search" action="#">
								<input type="text" placeholder="Type Something" id='searchText' name="searchKeyword" onkeypress="handle" />
								<i class="fa fa-search"></i>
							</form>
						</div>
						<!-- ***** Search End ***** -->
						<!-- ***** Menu Start ***** -->
						<ul class="nav">
							<li><a href="${pageContext.request.contextPath }/index" class="active">Home</a></li>
							<li><a href="${pageContext.request.contextPath }/browse">Browse</a></li>
							<li><a href="${pageContext.request.contextPath }/details">Details</a></li>
							<li><a href="${pageContext.request.contextPath }/streams">Streams</a></li>
							<li>
								<a href="${pageContext.request.contextPath }/profile">Profile <img src="../assets/images/profile-header.jpg" alt=""
								/></a>
							</li>
						</ul>
						<a class='menu-trigger'>
							<span>Menu</span>
						</a>
						<!-- ***** Menu End ***** -->
					</nav>
				</div>
			</div>
		</div>
	</header>
	<!-- ***** Header Area End ***** -->

	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="page-content">
					<div class="heading-section">
						<h4>회원가입</h4>
					</div>
					<!-- ***** Banner Start ***** -->
					<div class="row">
						<div class="col-lg-12">
							<div class="main-profile">
								<div class="align-self-center"style="display: flex; align-items: center;">
									<%--로그인 이미지--%>
									<div class="col-lg-4" style="width:25%;margin:1% 10% 1% 10%;">
										<img src="../assets/images/profile.jpg" alt="" style="border-radius: 23px;">
									</div>
										<form id = "join_btn" action="${pageContext.request.contextPath }/users/join" method="post">
											<div class="main-info header-text">
												<div class="item">
													<ul>
														<li>
															<h5 style="display: inline-block; width: 10vw;">이메일</h5>
															<input type="text" name="email" id="email" placeholder="이메일을 입력해주세요."
																   style="color:#bbb; border: none; border-radius: 23px; background-color: #27292a;">
															<input type="button" id="emailCheck" value="email 중복체크">
															<span id="idResult"></span> <br>
														</li>
														<li>
															<h5 style="display: inline-block; width: 10vw;">비밀번호</h5>
															<input type="password" name="pwd"  placeholder="비밀번호을 입력해주세요."
																   style="color:#bbb; border: none; border-radius: 23px; background-color: #27292a;">
														</li>
														<li>
															<h5 style="display: inline-block; width: 10vw;">이름</h5>
															<input type="text" name="name" placeholder="이름을 입력해주세요."
																   style="color:#bbb; border: none; border-radius: 23px; background-color: #27292a;">
														</li>
														<li>
															<h5 style="display: inline-block; width: 10vw;">가입종류</h5>
															<input type="radio" name="type" value="1">구매자
															<input type="radio" name="type" value="2">판매자
															<input type="radio" name="type" value="0">관리자
														</li>
													</ul>
<%--													<input type="submit" value="로그인">--%>
<%--													<button type="submit" form="login_btn" >로그인</button>--%>
<%--													<a href="javascript:login_btn.submit();">로그인</a>--%>

													<div class="main-button" style="display: inline;">
														<a href="${pageContext.request.contextPath }/users/loginForm"style="font-weight: bold;margin-left: 35%; margin-right: 5%;">취소</a>
													</div>
													<div class="main-border-button" style="display: inline;">
														<a href=" javascript:join_btn.submit();" style="font-weight: bold; margin-top: 30px">가입</a>
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



