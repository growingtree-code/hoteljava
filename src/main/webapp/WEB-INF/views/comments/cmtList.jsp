<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <link
            href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
            rel="stylesheet"
    />
    <title>Hotel JAVA : 리뷰 목록</title>

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
                <div class="heading-section" style="display: flex; justify-content: center;">
                    <h4>리뷰 목록</h4>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="main-profile">
                            <div class="row">
                                <div class="align-self-center">
                                    <div class="main-info header-text">
                                        <div class="item">
                                            <table>
                                                <tr>
                                                    <th style="width:5%">No</th>
                                                    <th style="width:15%">작성자</th>
                                                    <th>내용</th>
                                                    <th style="width: 15%">작성날짜</th>
                                                </tr>
                                                <c:forEach var="cmt" items="${comments}">
                                                    <tr>
                                                        <td style="width: 5%; text-align: center">${cmt.comment_id}</td>
                                                        <td style="width: 15%; max-width: 10ch; white-space: nowrap; overflow: hidden; text-overflow: ellipsis">${cmt.name}</td>
                                                        <td style="padding: 5px">${cmt.content}</td>
                                                        <td style="width: 15%; text-align: right"><fmt:formatDate value="${cmt.comment_date}" pattern="yyyy/MM/dd" /></td>
                                                    </tr>
                                                </c:forEach>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- Bootstrap core JavaScript -->
<script src="../vendor/jquery/jquery.min.js"></script>
<script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

<script src="../assets/js/isotope.min.js"></script>
<script src="../assets/js/owl-carousel.js"></script>
<script src="../assets/js/tabs.js"></script>
<script src="../assets/js/popup.js"></script>
<script src="../assets/js/custom.js"></script>

</body>
<style>
    table {
        width: 100%; /* 테이블 너비 설정 */
        border-collapse: collapse; /* 셀 경계선 중복 제거 */
        /*background-color: black; !* 배경색 검정으로 설정 *!*/
        color: white; /* 글자색 하얗게 설정 */
        border-radius: 20px;
    }
    th {
        font-weight: bold; /* 제목 셀 강조 */
        padding: 10px; /* 패딩으로 내부 간격 조절 */
        border-bottom: 2px solid white; /* 바닥 경계선 설정 */
        font-size: 20px;
    }
    td {
        padding: 10px;
        border-bottom: 1px solid white;
    }

</style>
</html>