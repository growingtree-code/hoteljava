<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

    <link
      href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
      rel="stylesheet"
    />

    <title>Cyborg - Awesome HTML5 Template</title>

    <!-- Bootstrap core CSS -->
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="../assets/css/fontawesome.css" />
    <link rel="stylesheet" href="../assets/css/templatemo-cyborg-gaming.css" />
    <link rel="stylesheet" href="../assets/css/owl.css" />
    <link rel="stylesheet" href="../assets/css/animate.css" />
    <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />
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
                    >Profile <img src="../assets/images/profile-header.jpg" alt=""
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
            

          
            <!-- ***** Details Start ***** -->
            <div class="game-details">
              <div class="row">
                <div class="col-lg-12 header-text">
                  <c:choose>
                  	<c:when test="${cate == 1 }">
                  	  <h2>호텔/리조트</h2>
                  	</c:when>
                  	<c:when test="${cate == 2 }">
                  	  <h2>펜션/풀빌라</h2>
                  	</c:when>
                  	<c:when test="${cate == 3 }">
                  	  <h2>모텔</h2>
                  	</c:when>
                  	<c:when test="${cate == 4 }">
                  	  <h2>게스트하우스</h2>
                  	</c:when>
                  </c:choose>
                  
                </div>
                
                <c:forEach items="${catelist }" var="h">
	                <div class="col-lg-3" style="margin-bottom: 10px;">
	                  <div class="content">
	                    <div class="row">
	                      <div class="col-lg-12">
	                        <div class="left-info" style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
	                          <div class="left">
	                            <h4>${h.hotel_name }</h4>
	                            <p>${h.hotel_addres }</p>
	                          </div>
	                        </div>
	                      </div>
	                      <!-- <div class="col-lg-6">
	                        <div class="right-info">
	                          <ul>
	                            <li><i class="fa fa-star"></i> 4.8</li>
	                            <li><i class="fa fa-download"></i> 2.3M</li>
	                            <li><i class="fa fa-server"></i> 36GB</li>
	                            <li><i class="fa fa-gamepad"></i> Action</li>
	                          </ul>
	                        </div>
	                      </div> -->
	                      <div class="col-lg-12">
	                        <img
	                          src="${pageContext.request.contextPath }/hotel/img?filename=${h.hotel_img}&num=${h.hotel_id}"
	                          alt=""
	                          width="261px"
	                          height="261px"
	                          style="border-radius: 23px; margin-bottom: 30px"
	                        />
	                      </div>
	                      <!-- <div class="col-lg-4">
	                        <img
	                          src="../assets/images/details-02.jpg"
	                          alt=""
	                          style="border-radius: 23px; margin-bottom: 30px"
	                        />
	                      </div>
	                      <div class="col-lg-4">
	                        <img
	                          src="../assets/images/details-03.jpg"
	                          alt=""
	                          style="border-radius: 23px; margin-bottom: 30px"
	                        />
	                      </div> -->
	                      <div class="col-lg-12">
	                        <div class="main-border-button">
	                          <a href="${pageContext.request.contextPath }/hotel/detail?num=${h.hotel_id}">살펴보기</a>
	                        </div>
	                      </div>
	                    </div>
	                  </div>
	                </div>
                </c:forEach>
              </div>
            </div>
            <!-- ***** Details End ***** -->
          </div>
        </div>
      </div>
    </div>

    <footer>
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <p>
              Copyright © 2036 <a href="#">Cyborg Gaming</a> Company. All rights reserved.

              <br />Design:
              <a href="https://templatemo.com" target="_blank" title="free CSS templates">TemplateMo</a> Distributed By
              <a href="https://themewagon.com" target="_blank">ThemeWagon</a>
            </p>
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
