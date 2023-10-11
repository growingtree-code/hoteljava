<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

    <title>Hotel JAVA : Home</title>

    <!-- Bootstrap core CSS -->
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="../assets/css/fontawesome.css" />
    <link rel="stylesheet" href="../assets/css/templatemo-cyborg-gaming.css" />
    <link rel="stylesheet" href="../assets/css/owl.css" />
    <link rel="stylesheet" href="../assets/css/animate.css" />
    <link
      rel="stylesheet"
      href="https://unpkg.com/swiper@7/swiper-bundle.min.css"
    />

  </head>

  <body>
    <!-- ***** Header Area Start ***** -->
    <%@ include file="nav.jsp" %>
    <!-- ***** Header Area End ***** -->

    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="page-content">

            <c:choose>
              <c:when test="${sessionScope.type == 0}">
                <c:set var="path" value="/users/adminPage" />
              </c:when>
              <c:otherwise>
                <%-- 0이 아닌 경우 아무 작업도 수행하지 않음 --%>
              </c:otherwise>
            </c:choose>
            
            <c:choose>
              <c:when test="${sessionScope.type == 0 || sessionScope.type == 2}">
                <c:set var="path2" value="/hotel/edit" />
              </c:when>
              <c:otherwise>
                <%-- 0이 아닌 경우 아무 작업도 수행하지 않음 --%>
              </c:otherwise>
            </c:choose>

            <c:if test="${!empty path}">
              <c:import url="${path}" />
            </c:if>
            <c:if test="${!empty path2}">
              <c:import url="${path2}" />
            </c:if>

            <!-- ***** Banner Start ***** -->
            <div class="main-banner">
              <div class="row">
                <div class="col-lg-7">
                  <div class="header-text">
                    <h6>Welcome To Hotel JAVA</h6>
                    <h4><em>Browse</em> Our Popular Hotels & Rooms Here</h4>
                    <div class="main-button">
<%--                      <a href="browse.jsp">Browse Now</a>--%>
                      <a href="../hotel/hotelList">호텔 목록</a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- ***** Banner End ***** -->

            <!-- ***** Most Popular Start ***** -->
            <div class="most-popular">
              <div class="row">
                <div class="col-lg-12">
                  <div class="heading-section">
                    <h4><em>Most Popular</em> Right Now</h4>
                  </div>
                  <div class="row">
                    <div class="col-lg-3 col-sm-6">
                      <div class="item">
                        <img src="../assets/images/popular-01.jpg" alt="" />
                        <h4>Fortnite<br /><span>Sandbox</span></h4>
                        <ul>
                          <li><i class="fa fa-star"></i> 4.8</li>
                          <li><i class="fa fa-download"></i> 2.3M</li>
                        </ul>
                      </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                      <div class="item">
                        <img src="../assets/images/popular-02.jpg" alt="" />
                        <h4>PubG<br /><span>Battle S</span></h4>
                        <ul>
                          <li><i class="fa fa-star"></i> 4.8</li>
                          <li><i class="fa fa-download"></i> 2.3M</li>
                        </ul>
                      </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                      <div class="item">
                        <img src="../assets/images/popular-03.jpg" alt="" />
                        <h4>Dota2<br /><span>Steam-X</span></h4>
                        <ul>
                          <li><i class="fa fa-star"></i> 4.8</li>
                          <li><i class="fa fa-download"></i> 2.3M</li>
                        </ul>
                      </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                      <div class="item">
                        <img src="../assets/images/popular-04.jpg" alt="" />
                        <h4>CS-GO<br /><span>Legendary</span></h4>
                        <ul>
                          <li><i class="fa fa-star"></i> 4.8</li>
                          <li><i class="fa fa-download"></i> 2.3M</li>
                        </ul>
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="item">
                        <div class="row">
                          <div class="col-lg-6 col-sm-6">
                            <div class="item inner-item">
                              <img src="../assets/images/popular-05.jpg" alt="" />
                              <h4>Mini Craft<br /><span>Legendary</span></h4>
                              <ul>
                                <li><i class="fa fa-star"></i> 4.8</li>
                                <li><i class="fa fa-download"></i> 2.3M</li>
                              </ul>
                            </div>
                          </div>
                          <div class="col-lg-6 col-sm-6">
                            <div class="item">
                              <img src="../assets/images/popular-06.jpg" alt="" />
                              <h4>Eagles Fly<br /><span>Matrix Games</span></h4>
                              <ul>
                                <li><i class="fa fa-star"></i> 4.8</li>
                                <li><i class="fa fa-download"></i> 2.3M</li>
                              </ul>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                      <div class="item">
                        <img src="../assets/images/popular-07.jpg" alt="" />
                        <h4>Warface<br /><span>Max 3D</span></h4>
                        <ul>
                          <li><i class="fa fa-star"></i> 4.8</li>
                          <li><i class="fa fa-download"></i> 2.3M</li>
                        </ul>
                      </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                      <div class="item">
                        <img src="../assets/images/popular-08.jpg" alt="" />
                        <h4>Warcraft<br /><span>Legend</span></h4>
                        <ul>
                          <li><i class="fa fa-star"></i> 4.8</li>
                          <li><i class="fa fa-download"></i> 2.3M</li>
                        </ul>
                      </div>
                    </div>
                    <div class="col-lg-12">
                      <div class="main-button">
                        <a href="browse.jsp">Discover Popular</a>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- ***** Most Popular End ***** -->

            <!-- ***** Gaming Library Start ***** -->
            <div class="gaming-library">
              <div class="col-lg-12">
                <div class="heading-section">
                  <h4><em>Your Gaming</em> Library</h4>
                </div>
                <div class="item">
                  <ul>
                    <li>
                      <img
                        src="../assets/images/game-01.jpg"
                        alt=""
                        class="templatemo-item"
                      />
                    </li>
                    <li>
                      <h4>Dota 2</h4>
                      <span>Sandbox</span>
                    </li>
                    <li>
                      <h4>Date Added</h4>
                      <span>24/08/2036</span>
                    </li>
                    <li>
                      <h4>Hours Played</h4>
                      <span>634 H 22 Mins</span>
                    </li>
                    <li>
                      <h4>Currently</h4>
                      <span>Downloaded</span>
                    </li>
                    <li>
                      <div class="main-border-button border-no-active">
                        <a href="#">Donwloaded</a>
                      </div>
                    </li>
                  </ul>
                </div>
                <div class="item">
                  <ul>
                    <li>
                      <img
                        src="../assets/images/game-02.jpg"
                        alt=""
                        class="templatemo-item"
                      />
                    </li>
                    <li>
                      <h4>Fortnite</h4>
                      <span>Sandbox</span>
                    </li>
                    <li>
                      <h4>Date Added</h4>
                      <span>22/06/2036</span>
                    </li>
                    <li>
                      <h4>Hours Played</h4>
                      <span>740 H 52 Mins</span>
                    </li>
                    <li>
                      <h4>Currently</h4>
                      <span>Downloaded</span>
                    </li>
                    <li>
                      <div class="main-border-button">
                        <a href="#">Donwload</a>
                      </div>
                    </li>
                  </ul>
                </div>
                <div class="item last-item">
                  <ul>
                    <li>
                      <img
                        src="../assets/images/game-03.jpg"
                        alt=""
                        class="templatemo-item"
                      />
                    </li>
                    <li>
                      <h4>CS-GO</h4>
                      <span>Sandbox</span>
                    </li>
                    <li>
                      <h4>Date Added</h4>
                      <span>21/04/2036</span>
                    </li>
                    <li>
                      <h4>Hours Played</h4>
                      <span>892 H 14 Mins</span>
                    </li>
                    <li>
                      <h4>Currently</h4>
                      <span>Downloaded</span>
                    </li>
                    <li>
                      <div class="main-border-button border-no-active">
                        <a href="#">Donwloaded</a>
                      </div>
                    </li>
                  </ul>
                </div>
              </div>
              <div class="col-lg-12">
                <div class="main-button">
                  <a href="profile.jsp">View Your Library</a>
                </div>
              </div>
            </div>
            <!-- ***** Gaming Library End ***** -->
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
              <a
                href="https://templatemo.com"
                target="_blank"
                title="free CSS templates"
                >TemplateMo</a
              >
              Distributed By
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
