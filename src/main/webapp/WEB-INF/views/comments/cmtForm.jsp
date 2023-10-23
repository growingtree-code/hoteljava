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
                            <div class="main-profile">
                                <div class="row">

                                    <div class="align-self-center">
                                        <div class="main-info header-text">
                                            <div class="item" style="display: flex; justify-content: space-around;">
                                                <div class="col-lg-4">
                                                    <img src="${pageContext.request.contextPath }/room/img?filename=${sessionScope.r.room_img}&num=${sessionScope.r.room_id}" alt="" style="border-radius: 23px; width: 30em;height: 25em;">
                                                </div>
                                                <ul style="display: inline-block">
                                                    <li>
                                                        <h5 style="display: inline-block; width: 10vw">작성자</h5>
                                                        <input type="hidden" name="user_id" value="${sessionScope.ui}" style="color: #bbb; border: none; border-radius: 23px; background-color: #27292a">
                                                        <input type="text" name="user_id" value="${sessionScope.name}" style="color: #bbb; border: none; border-radius: 23px; background-color: #27292a">
                                                    </li>
                                                    <li>
                                                        <h5 style="display: inline-block; width: 10vw">객 실명</h5>
                                                    <input type="hidden" name="room_id2" value="${sessionScope.ri}" style="color: #bbb; border: none; border-radius: 23px; background-color: #27292a">
                                                    <input type="text" name="room_id2" value="${sessionScope.r.room_name}" style="color: #bbb; border: none; border-radius: 23px; background-color: #27292a">
                                                    </li>
                                                    <li>
                                                        <h5 style="display: inline-block; width: 10vw">리뷰 내용</h5>
                                                        <textarea id="comment-textarea" name="content" placeholder="재밌는 여행 되셨나요?&#13;&#10;소중한 후기를 남겨주세요!!"></textarea>
                                                    </li>
                                                    <input type="hidden" id="current-date" name="comment_date">
                                                    <div id="review-button" class="main-button ">
                                                        <a href="javascript:void(0);">작성 완료</a>
                                                    </div>

                                                </ul>

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
<style>
    textarea {
        width: 100%;
        height: 100px;
        padding: 10px;
        box-sizing: border-box;
        border: solid 2px #E75E8C;
        border-radius: 5px;
        font-size: 16px;
        resize: none;
        background-color: #26292A;
        color: #ffffff;
    }
    textarea:focus {
        outline: none;
    }
</style>
</body>
</html>