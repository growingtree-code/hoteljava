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
            <!-- ***** Featured Start ***** -->
            <div class="row">
              <div class="col-lg-12">
                <div class="feature-banner header-text">
                  <div class="row">
                    <div class="col-lg-8" style="overflow: hidden;">
                      <img
                        src="${pageContext.request.contextPath }/hotel/img?filename=${h.hotel_img}&num=${h.hotel_id}"
                        width="776px"
                        height="358px"
                        alt=""
                        style="border-radius: 23px"
                      />
                    </div>
                    <input type="hidden" id="addres" value="${h.hotel_addres }" />
                    <div class="col-lg-4" id="map" style="border-radius: 23px;">
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- ***** Featured End ***** -->

            <!-- ***** Details Start ***** -->
            <div class="game-details">
              <div class="row">
                <div class="col-lg-12">
                  <h2>${h.hotel_name }</h2>
                </div>
                
                <c:forEach items="${roomlist }" var="r">
	                <div class="col-lg-6" style="margin-bottom: 10px;">
	                  <div class="content">
	                    <div class="row">
	                      <div class="col-lg-12">
	                        <div class="left-info">
	                          <div class="left">
	                            <h4>${r.room_name }</h4>
	                            <span>${r.room_type }인실</span>
	                          </div>
	                          <ul>
	                            <li><i class="fa fa-star"></i> 4.8</li>
	                            <li><i class="fa fa-download"></i> 2.3M</li>
	                          </ul>
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
	                          src="${pageContext.request.contextPath }/room/img?filename=${r.room_img}&num=${r.room_id}"
	                          alt=""
	                          width="356px"
	                          height="264px"
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
	                        <p>
	                          ${r.room_info }
	                        </p>
	                      </div>
	                      <div class="col-lg-12">
	                        <div class="main-border-button">
	                          <a href="#">예약하기</a>
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
    
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cef5a7f0c580b9754da1ab4dd9de119e&libraries=services"></script>
	<script type="text/javascript">
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
			level: 3 //지도의 레벨(확대, 축소 정도)
		};
	
		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();

		// 주소로 좌표를 검색합니다
		var address = document.getElementById('addres').value;
		geocoder.addressSearch(address, function(result, status) {

		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {

		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });

		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        //var infowindow = new kakao.maps.InfoWindow({
		        //    content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
		        //});
		        //infowindow.open(map, marker);

		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 
		});    
		
	</script>
    
  </body>
</html>
