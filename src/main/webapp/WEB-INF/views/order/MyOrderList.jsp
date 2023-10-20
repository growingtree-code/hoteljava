<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.Date" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

    <title>Cyborg - Awesome HTML5 Template</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="assets/css/fontawesome.css">
    <link rel="stylesheet" href="assets/css/templatemo-cyborg-gaming.css">
    <link rel="stylesheet" href="assets/css/owl.css">
    <link rel="stylesheet" href="assets/css/animate.css">
    <link rel="stylesheet"href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>

</head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
    $(document).ready(function() {
        // $("#comment-form").hide();

        $("#review-button a").click(function() {
            // $("#comment-form").toggle(); // 댓글 폼 표시/숨기기
            var currentDate = new Date();

            // 날짜를 "yyyy-MM-dd" 형식의 문자열로 변환
            var formattedDate = currentDate.toISOString().slice(0,10);

            // 폼의 숨겨진 입력 필드에 현재 날짜 설정
            // $("#current-date").val(formattedDate);
            $("#current-date").val(new Date());
            $("#content").val($("#comment-textarea").val());

            // 폼 제출
            $("#comment-form1").submit();
            // console.log( $("#current-date").val(formattedDate));
        });

        //테스트용
        $("#display-button").click(function() {
            var textAreaContent = $("#comment-textarea").val(); // <textarea>의 내용 가져오기
            $("#output-div").text(textAreaContent); // <div> 태그에 내용 출력
        });


    });

</script>



<body>

<!-- ***** Preloader Start ***** -->
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
<!-- ***** Preloader End ***** -->

<!-- ***** Header Area Start ***** -->
<%@ include file="../nav.jsp" %>
<!-- ***** Header Area End ***** -->

<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <div class="page-content">

                <!-- ***** Banner Start ***** -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="main-profile ">
                            <div class="heading-section">
                                <h4><em>내</em> 주문내역</h4>
                            </div>

                                <c:forEach var="ohr" items="${ohr }">
                                <div class="row">

                                    <div class="col-lg-4">
                                        <img src="${pageContext.request.contextPath }/room/img?filename=${ohr.room_img}&num=${ohr.room_id}" alt="" style="border-radius: 23px;">
                                    </div>
                                    <div class="col-lg-4 align-self-center">
                                        <div class="main-info header-text">
                                            <span>${ohr.hotel_name}</span>
                                            <h4>${ohr.room_id}</h4>
                                            <h4>${ohr.order_price}</h4>
                                            <p>호텔 번호: ${ohr.hotel_phone}</p>


                                            <div class="main-border-button">

                                            </div>
                                            <div class="main-border-button">

                                            </div>
                                            <div class="main-button">
                                                <a href="${pageContext.request.contextPath }/hotel/detail?num=${ohr.hotel_id}">호텔 다시보기</a>
                                            </div>
                                            <%--댓글 달기--%>
                                            <%
                                                java.util.Date currentDate = new java.util.Date();
                                                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                                                String formattedDate = dateFormat.format(currentDate);
                                            %>
                                            <form id="comment-form1" method="post" action="${pageContext.request.contextPath }/comments/add
<%--                                            ?comment_date=<%=formattedDate %>--%>
                                            ">
                                                <input type="hidden" name="user_id" value="${ohr.user_id}">
                                                <input type="hidden" name="room_id2" value="${ohr.room_id}">
                                                    <textarea id="comment-textarea" name="content"></textarea>
<%--                                                <input type="hidden" id="current-date" name="comment_date" value="<%= formattedDate %>">--%>
                                                <input type="hidden" id="current-date" name="comment_date">
<%--                                                <div>현재 날짜: <%= formattedDate %></div>--%>
                                                <div id="review-button" class="main-button"  >
                                                    <a href="javascript:void(0);">리뷰</a>
                                                </div>
                                            </form>
<%--                                            <div style="background-color: white;color: black">--%>
<%--                                                ohr.user_id  ${ohr.user_id}--%>
<%--                                                ohr.room_id   ${ohr.room_id}--%>
<%--                                                <div id="output-div"></div>--%>

<%--                                                <button id="display-button">내용 표시</button>--%>
<%--                                                <%--%>
<%--                                                    java.util.Date currentDate = new java.util.Date();--%>
<%--                                                    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");--%>
<%--                                                    String formattedDate = dateFormat.format(currentDate);--%>
<%--                                                %>--%>
<%--                                                <div>현재 날짜: <%= formattedDate %></div>--%>
<%--                                            </div>--%>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 align-self-center">
                                        <ul>
                                            <li>체크인 <span><fmt:formatDate value="${ohr.order_start_date}" pattern="yyyy-MM-dd" /></span></li>
                                            <li>체크아웃 <span><fmt:formatDate value="${ohr.order_end_date}" pattern="yyyy-MM-dd" /></span></li>
                                            <li>숙박일<span  id="period">${ohr.order_period}박</span></li>
                                            <li>인원 수<span>${ohr.room_type}</span></li>
                                        </ul>
                                    </div>
                                    <hr>
                                </div>
                            </form>
                                </c:forEach>

                        </div>

                    </div>
                </div>
                <!-- ***** Banner End ***** -->


            </div>
        </div>
    </div>
</div>

<footer>
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <p>Copyright © 2036 <a href="#">Cyborg Gaming</a> Company. All rights reserved.

                    <br>Design: <a href="https://templatemo.com" target="_blank" title="free CSS templates">TemplateMo</a>  Distributed By <a href="https://themewagon.com" target="_blank" >ThemeWagon</a></p>
            </div>
        </div>
    </div>
</footer>


<!-- Scripts -->
<!-- Bootstrap core JavaScript -->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>

<script src="assets/js/isotope.min.js"></script>
<script src="assets/js/owl-carousel.js"></script>
<script src="assets/js/tabs.js"></script>
<script src="assets/js/popup.js"></script>
<script src="assets/js/custom.js"></script>


</body>

</html>
