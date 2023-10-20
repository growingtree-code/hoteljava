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
    <title>Hotel JAVA :리뷰 작성 페이지</title>
    <!-- Bootstrap core CSS -->
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="../assets/css/fontawesome.css" />
    <link rel="stylesheet" href="../assets/css/templatemo-cyborg-gaming.css" />
    <link rel="stylesheet" href="../assets/css/owl.css" />
    <link rel="stylesheet" href="../assets/css/animate.css" />
    <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />

    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script>
        $(document).ready(function() {
            $("#div_review").hide();

            // $("#show_form").click(function() {
            //     $("#div_review").toggle();
            // });

            $("#review-button a").click(function() {
                $("#current-date").val(new Date());
                $("#content").val($("#comment-textarea").val());

                $("#comment-form").submit();
            });

            $(".review-toggle").click(function() {
                // data-room-id 속성을 사용하여 방 ID 값을 읽음
                var roomId = $(this).data("room-id");

                // roomId을 사용하여 해당 방에 대한 작업 수행
                console.log("방 ID: " + roomId);
            });
        });

    </script>
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
                    <h4>리뷰 작성</h4>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <form id="comment-form" method="post" action="${pageContext.request.contextPath }/comments/add">
                            <input type="text" name="user_id" value="${sessionScope.ui}">
                            <input type="text" name="room_id2" value="${sessionScope.ri}">
                            <textarea id="comment-textarea" name="content"></textarea>
                            <input type="hidden" id="current-date" name="comment_date">
                            <div id="review-button" class="main-button">
                                <a href="javascript:void(0);">전송</a>
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