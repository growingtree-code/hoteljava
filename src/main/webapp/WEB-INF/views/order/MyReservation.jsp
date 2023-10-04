<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta
            name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />

    <link
            href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
            rel="stylesheet"
    />

    <title>Cyborg - Awesome HTML5 Template</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="assets/css/fontawesome.css" />
    <link rel="stylesheet" href="assets/css/templatemo-cyborg-gaming.css" />
    <link rel="stylesheet" href="assets/css/owl.css" />
    <link rel="stylesheet" href="assets/css/animate.css" />
    <link
            rel="stylesheet"
            href="https://unpkg.com/swiper@7/swiper-bundle.min.css"
    />
    <!--

TemplateMo 579 Cyborg Gaming

https://templatemo.com/tm-579-cyborg-gaming

-->
</head>

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
<header class="header-area header-sticky">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <nav class="main-nav">
                    <!-- ***** Logo Start ***** -->
                    <a href="${pageContext.request.contextPath }/index" class="logo">
                        <img src="assets/images/hotelJAVA.png" alt="" />
                    </a>
                    <!-- ***** Logo End ***** -->
                    <!-- ***** Search End ***** -->
                    <div class="search-input">
                        <form id="search" action="#">
                            <input
                                    type="text"
                                    placeholder="Type Something"
                                    id="searchText"
                                    name="searchKeyword"
                                    onkeypress="handle"
                            />
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
                            <a href="${pageContext.request.contextPath }/profile"
                            >Profile <img src="assets/images/profile-header.jpg" alt=""
                            /></a>
                        </li>
                    </ul>
                    <a class="menu-trigger">
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
                <!-- ***** 내 예약 내역 시작 ***** -->
                <div class="gaming-library">
                    <div class="col-lg-12">
                        <div class="heading-section">
                            <h4><em>내 예약</em> 내역</h4>
                        </div>
                        <div class="item">
                            <ul>
                                <li>
                                    <img src="assets/images/game-02.jpg" alt="" class="templatemo-item"/>
                                </li>
                                <li>
                                    <h4>호텔명</h4>
                                    <span>야놀자</span>
                                </li>
                                <li>
                                    <h4>객실명</h4>
                                    <span>스위트룸</span>
                                </li>
                                <li>
                                    <h4>숙박일</h4>
                                    <span>4박</span>
                                </li>
                                <li>
                                    <h4>예약 날짜</h4>
                                    <span>23.09.26(화) ~ 23.09.30(토)</span>
                                </li>
                                <li>
                                    <div class="main-border-button">
                                        <a href="#">다시 예약하기</a>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <!-- ***** 내 예약 내역 끝 ***** -->
                    <div class="col-lg-12">
                        <div class="main-button">
                            <a href="../profile.jsp">View Your Library</a>
                        </div>
                    </div>
                </div>
                <!-- ***** Gaming Library End ***** -->
            </div>
        </div>
    </div>
</div>
</div>

<footer>
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <p>
                    Copyright © 2036 <a href="#">Cyborg Gaming</a> Company. All rights
                    reserved.

                    <br />Design:
                    <a href="https://templatemo.com" target="_blank" title="free CSS templates">TemplateMo</a>
                    Distributed By
                    <a href="https://themewagon.com" target="_blank">ThemeWagon</a>
                </p>
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
