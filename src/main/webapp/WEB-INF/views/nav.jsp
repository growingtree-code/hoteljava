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

    <title>Cyborg - Awesome HTML5 Template</title>

    <!-- Bootstrap core CSS -->
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="../assets/css/fontawesome.css" />
    <link rel="stylesheet" href="../assets/css/templatemo-cyborg-gaming.css" />
    <link rel="stylesheet" href="../assets/css/animate.css" />
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
                <li><a href="${pageContext.request.contextPath }/streams">Streams</a></li>
                <c:if test="${sessionScope.type==0 || sessionScope.type==2}">
                  <li><a href="${pageContext.request.contextPath }/hotel/form">호텔등록</a></li>
                </c:if>
                <li><a href="${pageContext.request.contextPath }/users/loginForm">
                  로그인<img src="../assets/images/profile-header.jpg" alt=""/></a></li>
<%--                <li>--%>
<%--                  <a href="${pageContext.request.contextPath }/profile"--%>
<%--                    >Profile <img src="assets/images/profile-header.jpg" alt=""--%>
<%--                  /></a>--%>
<%--                </li>--%>
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

    <!-- Scripts -->
    <!-- Bootstrap core JavaScript -->
    <script src="../vendor/jquery/jquery.min.js"></script>
    <script src="../vendor/bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>
