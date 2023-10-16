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


  <!-- Additional CSS Files -->
  <link rel="stylesheet" href="assets/css/fontawesome.css">
  <link rel="stylesheet" href="assets/css/templatemo-cyborg-gaming.css">
  <link rel="stylesheet" href="assets/css/owl.css">
  <link rel="stylesheet" href="assets/css/animate.css">
  <link rel="stylesheet"href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
  <!-- 포트원 결제 -->
  <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
  <!-- jQuery -->
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
  <!-- iamport.payment.js -->
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

  <script>

    const response = new Response();
    var IMP = window.IMP;
    // const form = document.querySelector(".getReservation");

    function requestPay(){
      var today = new Date();
      var hours = today.getHours(); // 시
      var minutes = today.getMinutes();  // 분
      var seconds = today.getSeconds();  // 초
      var milliseconds = today.getMilliseconds();
      var makeMerchantUid = hours + minutes + seconds + milliseconds;
      const totalPrice = $('.order_price').val();
      const roomName = '${c_room.room_name}';
      const email = '${c_user.email}';

      IMP.init("imp24438240"); // 가맹점 식별코드
      IMP.request_pay({
        pg : 'kakaopay.TC0ONETIME',
        pay_method : 'card',
        merchant_uid: "IMP" + makeMerchantUid, // 상점에서 관리하는 주문 번호
        name : roomName,
        amount : totalPrice,
        buyer_email : email,
        // buyer_name : '구매자이름',
        // buyer_tel : '010-1234-5678',
        // buyer_addr : '서울특별시 강남구 삼성동',
        // buyer_postcode : '123-456'
      }, async function(rsp) {
        if ( rsp.success ) {
          //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
          jQuery.ajax({
            url: "/payment/complete", //cross-domain error가 발생하지 않도록 주의해주세요
            type: 'POST',
            dataType: 'json',
            contentType: 'application/json',
            data: JSON.stringify({
              payment_method: 'kakaoPay',
              payment_total_price: totalPrice,
              payment_flag: 1,
              payment_time: today,
              payment_uid : rsp.imp_uid
              //기타 필요한 데이터가 있으면 추가 전달
            })

          })
          if ( response.ok ) {
            var msg = '결제가 완료되었습니다.';
            msg += '\n고유ID : ' + rsp.imp_uid;
            msg += '\n상점 거래ID : ' + rsp.merchant_uid;
            // msg += '\n결제 금액 : ' + rsp.paid_amount;
            // msg += '카드 승인번호 : ' + rsp.apply_num;
            alert(msg);
            const form = document.querySelector(".CartToReservation");
            form.submit();
          }else { // 결제완료 후 DB저장 실패시
            alert(`error:[${response.status}]\n결제요청이 승인된 경우 관리자에게 문의바랍니다.`);
            // DB저장 실패시 status에 따라 추가적인 작업 가능성
          }

        } else {
          var msg = '결제에 실패하였습니다.';
          msg += '에러내용 : ' + rsp.error_msg;

          alert(msg);
        }
      });
    }
  </script>
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
<%@ include file="../nav.jsp" %>
<!-- ***** Header Area End ***** -->

<div class="container">
  <div class="row">
    <div class="col-lg-12">
      <div class="page-content">
        <div class="heading-section">
          <h4><em>숙소</em> 결제</h4>
        </div>

        <form class="CartToReservation  getReservation" action="${pageContext.request.contextPath }/ReservationUpdate" method="post" onsubmit="requestPay()">

          <div class="row">
            <div class="col-lg-12">
              <div class="main-profile ">
                <div class="row">
                  <div class="col-lg-4 align-self-center">
                    <div class="main-info header-text">
                      <span>${c_hotel.hotel_name}</span>
                      <img src="${pageContext.request.contextPath }/hotel/img?filename=${c_hotel.hotel_img}&num=${c_hotel.hotel_id}" width="219px" height="370px" alt="">
                      <br><br>
                      <h3>${c_room.room_name}</h3>
                      <br>
                      <h5>${c_room.room_info}</h5>
                      <br><br>
                      <img src="${pageContext.request.contextPath }/room/img?filename=${c_room.room_img}&num=${c_room.room_id}" alt="" width="356px" height="264px" style="border-radius: 23px; margin-bottom: 30px"
                      />
                      <div class="main-border-button">
                      </div>
                    </div>
                  </div>
                </div>
                <div>
                  <div class="item reservation-form">
                    <ul>
                      <li><h5><input type="date" class="datepicker fromDate"  name="order_start_date" placeholder="체크인 날짜 선택" value="<fmt:formatDate value="${c_order.order_start_date}" pattern = "yyyy-MM-dd"/>"></h5><span>체크인</span></li>
                      <li><h5><input type="date" class="datepicker toDate"  name="order_end_date"placeholder="체크아웃 날짜 선택" value="<fmt:formatDate value="${c_order.order_end_date}" pattern = "yyyy-MM-dd"/>"></h5><span>체크아웃</span></li>
                      <li><h5><input class="bak" ></h5><span>숙박일</span></li>
                      <input class="order_period" name="order_period" value="${c_order.order_period}" type="hidden">
                      <li><h5><input class="order_price" name="order_price" ></h5><span>금액</span></li>
                    </ul>
                  </div>
                </div>


                <div class="row">
                  <div class="col-lg-12">
                    <div class="clips">
                      <div class="row">
                        <div class="col-lg-12">
                          <div class="main-button">
                            <input type="hidden" name="user_id" value="${c_user.user_id}">
                            <input type="hidden" name="room_id2" value="${c_room.room_id}">
                            <input type="hidden" name="hotel_id" value="${c_order.hotel_id}">
                            <input type="hidden" name="order_id" value="${c_order.order_id}">
                            <input type="button" onclick="requestPay()" value="결제">
                            <%--                          <a href="#">결제</a>--%>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </form>

        <!-- ***** Banner Start ***** -->


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

<!-- Bootstrap core JavaScript -->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="assets/js/isotope.min.js"></script>
<script src="assets/js/owl-carousel.js"></script>
<script src="assets/js/tabs.js"></script>
<script src="assets/js/popup.js"></script>
<script src="assets/js/custom.js"></script>
<script>
  window.onload=function (){

    const getDateDiff = (d1, d2) => {
      const date1 = new Date(d1);
      const date2 = new Date(d2);

      const diffDate = date1.getTime() - date2.getTime();

      return Math.abs(diffDate / (1000 * 60 * 60 * 24)); // 밀리세컨 * 초 * 분 * 시 = 일
    }

    if ($(".fromDate").val() != null && $(".toDate").val() != null){
      const stay = getDateDiff($(".fromDate").val(), $(".toDate").val());
      const price = '${c_room.price}';

      $(".bak").val(stay+"박 " + (stay+1)+"일");
      $(".order_period").val(stay);
      $(".order_price").val(price*stay);

      console.log($(".fromDate").val());
      console.log($(".toDate").val());

      }

  }






</script>
<script>

  $( function() {
    const getDateDiff = (d1, d2) => {
      const date1 = new Date(d1);
      const date2 = new Date(d2);

      const diffDate = date1.getTime() - date2.getTime();

      return Math.abs(diffDate / (1000 * 60 * 60 * 24)); // 밀리세컨 * 초 * 분 * 시 = 일
    }

    $( ".datepicker" ).datepicker( "option", "showAnim", "slideDown" );
    //시작일.
    $('.fromDate').datepicker({
      showOn: "focus",                     // 달력을 표시할 타이밍 (both: focus or button)
      dateFormat: "yy-mm-dd",             // 날짜의 형식
      changeMonth: true,                  // 월을 이동하기 위한 선택상자 표시여부
      minDate: 0,
      maxDate: 30,                     // 선택할수있는 최소날짜, ( 0 : 오늘 이전 날짜 선택 불가)
      onClose: function( selectedDate ) {
        const pickDate = new Date(selectedDate);
        const pickDateAfter = new Date(pickDate)
        pickDateAfter.setDate(pickDate.getDate() + 1);
        // 시작일(fromDate) datepicker가 닫힐때
        // 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
        $(".toDate").datepicker( "option", "minDate", pickDateAfter );
        const stay = getDateDiff($(".fromDate").val(), $(".toDate").val());
        const price = '${c_room.price}';
        if (isNaN(stay) == true){
          $(".order_period").val("");
          $(".bak").val("");
        }
        else {
          $(".bak").val(stay+"박 " + (stay+1)+"일");
          $(".order_period").val(stay);
          $(".order_price").val(price*stay);

          console.log($(".fromDate").val());
          console.log($(".toDate").val());

        }
      }
    });

    //종료일
    $('.toDate').datepicker({
      showOn: "focus",
      dateFormat: "yy-mm-dd",
      changeMonth: true,
      //minDate: 0, // 오늘 이전 날짜 선택 불가
      maxDate: 30,
      onClose: function( selectedDate ) {
        // 종료일(toDate) datepicker가 닫힐때
        // 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정
        $(".fromDate").datepicker( "option", "maxDate", selectedDate );
        const stay = getDateDiff($(".fromDate").val(), $(".toDate").val());
        const price = '${c_room.price}';

        if (isNaN(stay) == true){
          $(".order_period").val("");
          $(".bak").val("");
        }
        else {
          $(".bak").val(stay+"박 " + (stay+1)+"일");
          $(".order_period").val(stay);
          $(".order_price").val(price*stay);

        }
      }
    });




// 30

  } );

  $.datepicker.setDefaults({
    dateFormat: 'yy-mm-dd',
    prevText: '이전 달',
    nextText: '다음 달',
    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
    showMonthAfterYear: true,
    yearSuffix: '년'
  });
</script>

<style>
  .ui-widget-header { border: 0px solid #dddddd; background: #fff; }

  .ui-datepicker-calendar>thead>tr>th { font-size: 14px !important; }

  .ui-datepicker .ui-datepicker-header { position: relative; padding: 10px 0; }

  .ui-state-default,
  .ui-widget-content .ui-state-default,
  .ui-widget-header .ui-state-default,
  .ui-button,
  html .ui-button.ui-state-disabled:hover,
  html .ui-button.ui-state-disabled:active { border: 0px solid #c5c5c5; background-color: transparent; font-weight: normal; color: #454545; text-align: center; }

  .ui-datepicker .ui-datepicker-title { margin: 0 0em; line-height: 16px; text-align: center; font-size: 14px; padding: 0px; font-weight: bold; }

  .ui-datepicker { display: none; background-color: #fff; border-radius: 4px; margin-top: 10px; margin-left: 0px; margin-right: 0px; padding: 20px; padding-bottom: 10px; width: 300px; box-shadow: 10px 10px 40px rgba(0, 0, 0, 0.1); }

  .ui-widget.ui-widget-content { border: 1px solid #eee; }

  .datepicker:focus>.ui-datepicker { display: block; }

  .ui-datepicker-prev,
  .ui-datepicker-next { cursor: pointer; }

  .ui-datepicker-next { float: right; }

  .ui-state-disabled { cursor: auto; color: hsla(0, 0%, 80%, 1); }

  .ui-datepicker-title { text-align: center; padding: 10px; font-weight: 100; font-size: 20px; }

  .ui-datepicker-calendar { width: 100%; }

  .ui-datepicker-calendar>thead>tr>th { padding: 5px; font-size: 20px; font-weight: 400; }

  .ui-datepicker-calendar>tbody>tr>td>a { color: #000; font-size: 12px !important; font-weight: bold !important; text-decoration: none;}

  .ui-datepicker-calendar>tbody>tr>.ui-state-disabled:hover { cursor: auto; background-color: #fff; }

  .ui-datepicker-calendar>tbody>tr>td { border-radius: 100%; width: 44px; height: 30px; cursor: pointer; padding: 5px; font-weight: 100; text-align: center; font-size: 12px; }

  .ui-datepicker-calendar>tbody>tr>td:hover { background-color: transparent; opacity: 0.6; }

  .ui-state-hover,
  .ui-widget-content .ui-state-hover,
  .ui-widget-header .ui-state-hover,
  .ui-state-focus,
  .ui-widget-content .ui-state-focus,
  .ui-widget-header .ui-state-focus,
  .ui-button:hover,
  .ui-button:focus { border: 0px solid #cccccc; background-color: transparent; font-weight: normal; color: #2b2b2b; }

  .ui-widget-header .ui-icon { background-image: url('/assets/images/btns.png'); }

  .ui-icon-circle-triangle-e { background-position: -20px 0px; background-size: 36px; }

  .ui-icon-circle-triangle-w { background-position: -0px -0px; background-size: 36px; }

  .ui-datepicker-calendar>tbody>tr>td:first-child a { color: red !important; }

  .ui-datepicker-calendar>tbody>tr>td:last-child a { color: #0099ff !important; }

  .ui-datepicker-calendar>thead>tr>th:first-child { color: red !important; }

  .ui-datepicker-calendar>thead>tr>th:last-child { color: #0099ff !important; }

  .ui-state-highlight,
  .ui-widget-content .ui-state-highlight,
  .ui-widget-header .ui-state-highlight { border: 0px; background: #f1f1f1; border-radius: 50%; padding-top: 10px; padding-bottom: 10px; }

  .inp { padding: 10px 10px; background-color: #f1f1f1; border-radius: 4px; border: 0px; }

  .inp:focus { outline: none; background-color: #eee; }

</style>
</body>

</html>
