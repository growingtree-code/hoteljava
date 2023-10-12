<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
	<link
			href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
			rel="stylesheet"
	/>
	<title>Hotel JAVA : 정보 수정 페이지</title>
	<!-- Bootstrap core CSS -->
	<link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />

	<!-- Additional CSS Files -->
	<link rel="stylesheet" href="../assets/css/fontawesome.css" />
	<link rel="stylesheet" href="../assets/css/templatemo-cyborg-gaming.css" />
	<link rel="stylesheet" href="../assets/css/owl.css" />
	<link rel="stylesheet" href="../assets/css/animate.css" />
	<link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />

	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	<!-- ***** Preloader Start ***** -->
	<div id="js-preloader" class="js-preloader">
		<div class="preloader-inner">
			<h4 class="dot"></h4>
			<div class="dots">
				<h4></h4>
				<h4></h4>
				<h4></h4>
			</div>
		</div>
	</div>
	<!-- ***** Preloader End ***** -->

	<!-- ***** Header Area Start ***** -->
	<%@ include file="../nav.jsp" %>
	<!-- ***** Header Area End ***** -->

	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="page-content">
					<div class="heading-section" style="display: flex; justify-content: space-around;">
						<h4>정보 수정</h4>
					</div>
					<div class="row">
						<div class="col-lg-12">
							<form action="${pageContext.request.contextPath }/users/edit" method="post">
								<div class="main-profile">
									<div class="row">
										<div class="align-self-center">
											<div class="main-info header-text">
												<div class="item">
													<ul>
														<li>
															<h5 style="display: inline-block; width: 10vw">이메일</h5>
															<input
																	type="text"
																	name="email"
																	style="color: #bbb; border: none; border-radius: 23px; background-color: #27292a"
																	value="${u.email }"
																	readonly
															/>
														</li>
														<li>
															<h5 style="display: inline-block; width: 10vw">비밀번호</h5>
															<input
																	type="text"
																	name="pwd"
																	style="color: #bbb; border: none; border-radius: 23px; background-color: #27292a"
																	value="${u.pwd }"
																	placeholder="비밀번호를 입력하세요"
															/><br/>
														</li>
														<li>
															<h5 style="display: inline-block; width: 10vw">이름</h5>
															<input
																	type="text"
																	name="name"
																	style="color: #bbb; border: none; border-radius: 23px; background-color: #27292a"
																	value="${u.name }"
																	placeholder="이름을 입력하세요"
															/><br/>
														</li>
														<li>
															<h5 style="display: inline-block; width: 10vw">타입</h5>
															<c:choose>
																<c:when test="${u.type==0 }">관리자</c:when>
																<c:when test="${u.type==1 }">판매자</c:when>
																<c:when test="${u.type==2 }">구매자</c:when>
																<c:otherwise>잘못된 type</c:otherwise>
															</c:choose>
															<br/>
														</li>
													</ul>
													<div class="col-lg-12" style="padding: 10px 30px">
														<div class="row justify-content-md-center">
															<input
																	class="col col-lg-2"
																	type="reset"
																	value="취소"
																	style="color: #fff; border: none; border-radius: 25px; background-color: #e75e8d"
															/>
															<div class="col col-lg-2"></div>
															<input
																	class="col col-lg-2"
																	type="submit"
																	value="수정하기"
																	style="color: #fff; border: none; border-radius: 25px; background-color: #e75e8d"
															/>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
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