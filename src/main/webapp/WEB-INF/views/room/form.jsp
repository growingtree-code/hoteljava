<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
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

  --></head>

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
            <div class="heading-section" style="display: flex; justify-content: space-around;">
              <h4><a href="${pageContext.request.contextPath }/hotel/form"><em style="text-decoration: none;">호텔 등록</em></a></h4>
              <h4>객실 등록</h4>
            </div>
            <div class="row">
              <div class="col-lg-12">
                <form
                  action="${pageContext.request.contextPath }/room/add"
                  method="post"
                  enctype="multipart/form-data"
                >                  
                  <div class="main-profile">
                    <div class="row">
                      <div class="align-self-center">
                        <div class="main-info header-text">
                          <div class="item">
                            <ul>
                              <li>
                                <h5 style="display: inline-block; width: 10vw">호텔</h5>
                                <select
                                  id="hotel"
                                  name="hotel_id"
                                  style="color: #bbb; border: none; border-radius: 23px; background-color: #27292a"
                                >
                                  <c:forEach items="${hotellist }" var="h">
                                    <option value="${h.hotel_id }">${h.hotel_name }</option>
                                  </c:forEach>
                                </select>
                              </li>
                              <li>
                                <h5 style="display: inline-block; width: 10vw">객실명</h5>
                                <input
                                  type="text"
                                  name="room_name"
                                  style="color: #bbb; border: none; border-radius: 23px; background-color: #27292a"
                                  placeholder="객실명을 입력하세요"
                                />
                              </li>
                              <li>
                                <h5 style="display: inline-block; width: 10vw">객실유형</h5>
                                <input
                                  type="number"
                                  name="room_type"
                                  style="color: #bbb; border: none; border-radius: 23px; background-color: #27292a"
                                  placeholder="몇인실인지 입력하세요"
                                /><br />
                              </li>
                              <li>
                                <h5 style="display: inline-block; width: 10vw">객실정보</h5>
                                <input
                                  type="text"
                                  name="room_info"
                                  style="color: #bbb; border: none; border-radius: 23px; background-color: #27292a"
                                  placeholder="객실정보를 입력하세요"
                                /><br />
                              </li>
                              <li>
                                <h5 style="display: inline-block; width: 10vw">가격</h5>
                                <input
                                  type="number"
                                  name="price"
                                  style="color: #bbb; border: none; border-radius: 23px; background-color: #27292a"
                                  placeholder="가격을 입력하세요"
                                /><br />
                              </li>
                              <li>
                                <h5 style="display: inline-block; width: 10vw">이미지</h5>
                                <input
                                  type="file"
                                  name="room_imgfile"
                                  style="color: #bbb; border: none; background-color: #27292a"
                                /><br />
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
                                  value="등록"
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

    <footer>
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <p>
              Copyright ? 2036 <a href="#">Cyborg Gaming</a> Company. All rights reserved.

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
