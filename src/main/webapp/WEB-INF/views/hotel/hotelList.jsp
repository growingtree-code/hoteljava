<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
         
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

    <title>Cyborg - Awesome HTML5 Template</title>

    <!-- Bootstrap core CSS -->
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="../assets/css/fontawesome.css">
    <link rel="stylesheet" href="../assets/css/templatemo-cyborg-gaming.css">
    <link rel="stylesheet" href="../assets/css/owl.css">
    <link rel="stylesheet" href="../assets/css/animate.css">
    <link rel="stylesheet"href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
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
                      <img src="../assets/images/hotelJAVA.png" alt="" />
                    </a>
                    <!-- ***** Logo End ***** -->
                    <!-- ***** Search End ***** -->
                    <div class="search-input">
                      <form id="search" action="${pageContext.request.contextPath }/hotel/search" method="post">
                        <input type="text" placeholder="Type Something" id='searchText' name="keyword" />
                        <i class="fa fa-search"></i>
                      </form>
                    </div>
                    <!-- ***** Search End ***** -->
                  <!-- ***** Menu Start ***** -->
                  <ul class="nav">
                    <li><a href="${pageContext.request.contextPath }/index" class="active">Home</a></li>
                    <li><a href="${pageContext.request.contextPath }/browse">Browse</a></li>
                    <li><a href="${pageContext.request.contextPath }/details">Details</a></li>
                    <li><a href="${pageContext.request.contextPath }/hotel/form">호텔등록</a></li>
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
        
          <!-- ***** Category Start ***** -->
          <div class="live-stream" style="padding:15px; margin: 0 0 60px 0;">
            <div class="row justify-content-evenly">
                <div class="col-lg-1">
                  <div>
                    <a href="${pageContext.request.contextPath }/hotel/category?cate=1">
                      <div class="thumb">
                        <img src="../assets/images/hotel.png" alt="">
                      </div>
                      <div class="down-content" style="text-align: center;">
                        <p style="color: white; font-size: 11px;">호텔/리조트</p>
                      </div>
                    </a> 
                  </div>
                </div>
                <div class="col-lg-1">
                  <div>
                    <a href="${pageContext.request.contextPath }/hotel/category?cate=2">
                      <div class="thumb">
                        <img src="../assets/images/pool.png" alt="">
                      </div>
                      <div class="down-content" style="text-align: center;">
                        <p style="color: white; font-size: 11px;">펜션/풀빌라</p>
                      </div>
                    </a>
                  </div>
                </div>
                <div class="col-lg-1">
                  <div>
                    <a href="${pageContext.request.contextPath }/hotel/category?cate=3">
                      <div class="thumb">
                        <img src="../assets/images/motel.png" alt="">
                      </div>
                      <div class="down-content" style="text-align: center;">
                        <p style="color: white; font-size: 11px;">모텔</p>
                      </div>
                    </a>
                  </div>
                </div>
                <div class="col-lg-1">
                  <div>
                    <a href="${pageContext.request.contextPath }/hotel/category?cate=4">
                      <div class="thumb">
                        <img src="../assets/images/guesthouse.png" alt="">
                      </div>
                      <div class="down-content" style="text-align: center;">
                        <p style="color: white; font-size: 11px;">게스트 하우스</p>
                      </div>
                    </a>
                  </div>
                </div>
            </div>
          </div>
          <!-- ***** Category End ***** -->

          <!-- ***** Featured Games Start ***** -->
          <div class="row">
            <div class="col-lg-8">
              <div class="featured-games header-text">
                <div class="heading-section">
                  <h4 style="margin-bottom: 5px;"><em>인기 HOTEL</em></h4>
                  <h6 style="margin-bottom: 30px;"><i class="fa fa-check">최근 인기 HOTEL 미리 예약</i></h6>
                </div>
                <div class="owl-features owl-carousel">
                  <c:forEach var="h" items="${list }">
                  	<div class="item">
                      <div class="thumb">
                      	<a href="${pageContext.request.contextPath }/hotel/detail?num=${h.hotel_id}">
                          <img src="${pageContext.request.contextPath }/hotel/img?filename=${h.hotel_img}&num=${h.hotel_id}" width="219px" height="370px" alt="">
                          <div class="hover-effect">
                            <h6>살펴보기</h6>
                          </div>
                        </a>
                      </div>
                      <h4>${h.hotel_name}<br>
                      <span>
                      	<c:choose>
                      		<c:when test="${h.hotel_category==1 }">
                      		호텔/리조트
                      		</c:when>
                      		<c:when test="${h.hotel_category==2 }">
                      		펜션/풀빌라
                      		</c:when>
                      		<c:when test="${h.hotel_category==3 }">
                      		모텔
                      		</c:when>
                      		<c:when test="${h.hotel_category==4 }">
                      		게스트하우스
                      		</c:when>
                      	</c:choose>
                      </span></h4>
                    </div>
                  </c:forEach>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="top-streamers">
                <div class="heading-section">
                  <h4 style="margin-bottom: 5px;"><em>HOTEL</em> 예약 TOP</h4>
                  <h6 style="margin-bottom: 30px;"><i class="fa fa-check">최근 한주 가장 많은 예약</i></h6>
                </div>
                <ul>
                  <c:forEach begin="0" end="4" step="1">
                    <li>
                      <span>01</span>
                      <img src="../assets/images/avatar-01.jpg" alt="" style="max-width: 46px; border-radius: 50%; margin-right: 15px;">
                      <h6><i class="fa fa-check"></i> LahutaM</h6>
                      <div class="main-button">
                        <a href="#">Follow</a>
                      </div>
                    </li>
                  </c:forEach>
                </ul>
              </div>
            </div>
          </div>
          <!-- ***** Featured Games End ***** -->

          <!-- ***** Live Stream Start ***** -->
          <div class="live-stream">
            <div class="col-lg-12">
              <div class="heading-section">
                <h4 style="margin-bottom: 5px;"><em>특가 HOTEL</em></h4>
                <h6 style="margin-bottom: 30px;"><i class="fa fa-check">할인중인 HOTEL 예약</i></h6>
              </div>
            </div>
            <div class="row">
              <c:forEach begin="0" end="7" step="1">
                <div class="col-lg-3 col-sm-6">
                  <div class="item">
                    <div class="thumb">
                      <img src="../assets/images/stream-05.jpg" alt="">
                      <div class="hover-effect">
                        <div class="content">
                          <div class="live">
                            <a href="#">Live</a>
                          </div>
                          <ul>
                            <li><a href="#"><i class="fa fa-eye"></i> 1.2K</a></li>
                            <li><a href="#"><i class="fa fa-gamepad"></i> CS-GO</a></li>
                          </ul>
                        </div>
                      </div>
                    </div>
                    <div class="down-content">
                      <div class="avatar">
                        <img src="../assets/images/avatar-01.jpg" alt="" style="max-width: 46px; border-radius: 50%; float: left;">
                      </div>
                      <span><i class="fa fa-check"></i> Kengan Omeg</span>
                      <h4>Just Talking With Fans</h4>
                    </div> 
                  </div>
                </div>
              </c:forEach>
              
              <div class="col-lg-12">
                <div class="main-button">
                  <a href="streams.jsp">더 보기</a>
                </div>
              </div>
            </div>
          </div>
          <!-- ***** Live Stream End ***** -->

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
  <script src="../vendor/jquery/jquery.min.js"></script>
  <script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

  <script src="../assets/js/isotope.min.js"></script>
  <script src="../assets/js/owl-carousel.js"></script>
  <script src="../assets/js/tabs.js"></script>
  <script src="../assets/js/popup.js"></script>
  <script src="../assets/js/custom.js"></script>


  </body>

</html>
