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
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script>
      $(document).ready(function() {
        $("#scrollTopButton").click(function(e) {
          document.body.scrollTop = 0; // For Safari
          document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE, and Opera
        });
        $("#scrollDownButton").click(function(e) {
          window.scrollBy(0,200000);
        });
      });
    </script>

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
              <c:when test="${sessionScope.type == 0 || sessionScope.type == 2}">
                <c:set var="path2" value="/hotel/edit" />
              </c:when>
              <c:when test="${sessionScope.type == 1 || sessionScope.type == null}">
                <!-- ***** Banner Start ***** -->
                <div class="main-banner" style="margin-bottom: 2%">
                  <div class="row">
                    <div class="col-lg-7">
                      <div class="header-text">
                        <h6>Hotel JAVA에 오신 것을 환영합니다</h6>
                        <h4><em>Browse</em> Our Popular Hotels & Rooms Here</h4>
                        <div class="main-button">
                          <a href="../hotel/hotelList">호텔 목록</a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- ***** Banner End ***** -->
              </c:when>

              <c:otherwise>
                <%-- 0이 아닌 경우 아무 작업도 수행하지 않음 --%>
              </c:otherwise>
            </c:choose>

            <c:if test="${!empty path2}">
              <c:import url="${path2}" />
            </c:if>

            <!-- ***** Most Popular Start ***** -->
            <div id="top">
              <c:import url="http://localhost:8081/hotel/hotelList"/>
            </div>
            <!-- ***** Most Popular End ***** -->

          </div>
        </div>
      </div>
      <button id="scrollTopButton" onclick="scrollTop()">&#9650;</button>
      <button id="scrollDownButton" onclick="scrollDownButton()">&#9660;</button>
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
<style>
  #top{
    margin: -10% -55px -5% -55px;
  }

  #scrollTopButton {
    display: block;
    position: fixed;
    bottom: 80px;
    right: 20px;
    z-index: 99;
    background-color: #b68fc4;
    color: #fff;
    border: none;
    border-radius: 50%;
    width: 40px;
    height: 40px;
    font-size: 24px;
    cursor: pointer;
    text-align: center;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
  }

  #scrollTopButton:hover {
    background-color: #744285;
  }
  #scrollDownButton {
    display: block;
    position: fixed;
    bottom: 20px;
    right: 20px;
    z-index: 99;
    background-color: #b68fc4;
    color: #fff;
    border: none;
    border-radius: 50%;
    width: 40px;
    height: 40px;
    font-size: 24px;
    cursor: pointer;
    text-align: center;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
  }

  #scrollDownButton:hover {
    background-color: #744285;
  }

</style>
</html>
