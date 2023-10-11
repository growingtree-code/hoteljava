<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
  
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(document).ready(
			
		function() {
			$('#hotel_name').change(
				function() {
					
					var id = this.options[this.options.selectedIndex].value;
					var addres = this.options[this.options.selectedIndex].dataset.addres;
					var phone = this.options[this.options.selectedIndex].dataset.phone;
					var img = this.options[this.options.selectedIndex].dataset.img;
					$('#hotel_id').val(id);
					$('#hotel_addres').val(addres);
					$('#hotel_phone').val(phone);
					$('#upload-name').val(img);
					
					$('#roomcontainer').css("display","");
					
					$("#room_name").empty();
					$('#room_id').val("");
					$('#room_type').val("");
					$('#room_info').val("");
					$('#price').val("");
					
					 $.post("/hotel/getsub", {
						id : id
					}).done(
						function(data) {
							var c = eval("(" + data + ")");
							$("#room_name").append("<option></option>");
							for (i = 0; i < c.length; i++) {
								$("#room_name").append(
										"<option value='"
										+c[i].room_id+
										"' data-type='"
										+c[i].room_type+
										"' data-info='"
										+c[i].room_info+
										"' data-price='"
										+c[i].price+
										"' data-img='"
										+c[i].room_img+
										"' data-name='"
										+c[i].room_name+
										"'>"
										+ c[i].room_name +
										"</option>"
								);
							}
						}
					);
			});
			
			$('#room_name').change(
				function() {
					var id = this.options[this.options.selectedIndex].value;
					var type = this.options[this.options.selectedIndex].dataset.type;
					var info = this.options[this.options.selectedIndex].dataset.info;
					var price = this.options[this.options.selectedIndex].dataset.price;
					var img = this.options[this.options.selectedIndex].dataset.img;
					
					$('#room_id').val(id);
					$('#room_type').val(type);
					$('#room_info').val(info);
					$('#price').val(price);
					$('#upload-name2').val(img);
					
			});
			
			$("#hotel_imgfile").on('change',function(){
				  var fileName = $("#hotel_imgfile").val();
				  $("#upload-name").val(fileName);
			});
			
			$("#room_imgfile").on('change',function(){
				  var fileName = $("#room_imgfile").val();
				  $("#upload-name2").val(fileName);
			});
			
			$("#delbtn").click(
				function(){
					var id = $('#hotel_name').val();
					location.href="/hotel/del?id="+id;
			});
			
			$("#delbtn2").click(
				function(){
					var id = $('#room_name').val();
					location.href="/room/del?id="+id;
			});
		}
	);
</script>

  <body>

            <div class="heading-section" style="display: flex; justify-content: space-around;">
              <h4>호텔 관리</h4>
            </div>
            <div class="row">
              <div class="col-lg-12">
                <form
                  action="${pageContext.request.contextPath }/hotel/update"
                  method="post"
                  enctype="multipart/form-data"
                >
                  <input type="hidden" id="hotel_id" name="hotel_id" value="" />
                  <div class="main-profile">
                    <div class="row">
                      <div class="align-self-center">
                        <div class="main-info header-text">
                          <div class="item">
                            <ul>
                              <li>
                                <h5 style="display: inline-block; width: 10vw">호텔명</h5>
                                <select
                                  id="hotel_name"
                                  name="hotel_name"
                                  style="color: #bbb; border: none; border-radius: 23px; background-color: #27292a"
                                >
                                	<option></option>
                                  <c:forEach var="i" items="${list }">
                                    <option
                                    value="${i.hotel_id }"
                                    data-addres="${i.hotel_addres }"
                                    data-phone="${i.hotel_phone }"
                                    data-img="${i.hotel_img }"
                                    > ${i.hotel_name } </option>
                                  </c:forEach>
                                </select>
                              </li>
                              <li>
                                <h5 style="display: inline-block; width: 10vw">주소</h5>
                                <input
                                  type="text"
                                  name="hotel_addres"
                                  id="hotel_addres"
                                  style="color: #bbb; border: none; border-radius: 23px; background-color: #27292a"
                                  placeholder="주소를 입력하세요"
                                /><br />
                              </li>
                              <li>
                                <h5 style="display: inline-block; width: 10vw">전화번호</h5>
                                <input
                                  type="text"
                                  name="hotel_phone"
                                  id="hotel_phone"
                                  style="color: #bbb; border: none; border-radius: 23px; background-color: #27292a"
                                  placeholder="전화번호를 입력하세요"
                                /><br />
                              </li>
                              <li>
                                <h5 style="display: inline-block; width: 10vw">이미지</h5>
                                <input id="upload-name" value="첨부파일" placeholder="첨부파일" readonly style="color: #bbb; border: none; border-radius: 23px; background-color: #27292a">
							    <label for="hotel_imgfile">파일찾기</label> 
							    <input type="file" name="hotel_imgfile" id="hotel_imgfile" style="display: none;">
							    <br />
                                
                              </li>
                            </ul>
                            <div class="col-lg-12" style="padding: 10px 30px">
                              <div class="row justify-content-md-center">
                                <input
                                  class="col col-lg-2"
                                  id="delbtn"
                                  type="button"
                                  value="삭제"
                                  style="color: #fff; border: none; border-radius: 25px; background-color: #e75e8d"
                                />
                                <div class="col col-lg-2"></div>
                                <input
                                  class="col col-lg-2"
                                  type="submit"
                                  value="수정"
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
            
            
            <div class="row" id="roomcontainer" style="display: none;">
              <div class="col-lg-12">
                <form
                  action="${pageContext.request.contextPath }/room/update"
                  method="post"
                  enctype="multipart/form-data"
                >
                  <input type="hidden" id="room_id" name="room_id" value="" />
                  <div class="main-profile">
                    <div class="row">
                      <div class="align-self-center">
                        <div class="main-info header-text">
                          <div class="item">
                            <ul>
                              <li>
                                <h5 style="display: inline-block; width: 10vw">객실명</h5>
                                <select
                                  id="room_name"
                                  name="room_name"
                                  style="color: #bbb; border: none; border-radius: 23px; background-color: #27292a"
                                >
                                </select>
                              </li>
                              <li>
                                <h5 style="display: inline-block; width: 10vw">객실유형</h5>
                                <input
                                  type="number"
                                  name="room_type"
                                  id="room_type"
                                  style="color: #bbb; border: none; border-radius: 23px; background-color: #27292a"
                                  placeholder="몇인실인지 입력하세요"
                                /><br />
                              </li>
                              <li>
                                <h5 style="display: inline-block; width: 10vw">객실정보</h5>
                                <input
                                  type="text"
                                  name="room_info"
                                  id="room_info"
                                  style="color: #bbb; border: none; border-radius: 23px; background-color: #27292a"
                                  placeholder="객실정보를 입력하세요"
                                /><br />
                              </li>
                              <li>
                                <h5 style="display: inline-block; width: 10vw">가격</h5>
                                <input
                                  type="number"
                                  name="price"
                                  id="price"
                                  style="color: #bbb; border: none; border-radius: 23px; background-color: #27292a"
                                  placeholder="가격을 입력하세요"
                                /><br />
                              </li>
                              <li>
                                <h5 style="display: inline-block; width: 10vw">이미지</h5>
                                <input id="upload-name2" value="첨부파일" placeholder="첨부파일" readonly style="color: #bbb; border: none; border-radius: 23px; background-color: #27292a">
							    <label for="room_imgfile">파일찾기</label> 
							    <input type="file" name="room_imgfile" id="room_imgfile" style="display: none;">
							    <br />
                                
                              </li>
                            </ul>
                            <div class="col-lg-12" style="padding: 10px 30px">
                              <div class="row justify-content-md-center">
                                <input
                                  class="col col-lg-2"
                                  id="delbtn2"
                                  type="button"
                                  value="삭제"
                                  style="color: #fff; border: none; border-radius: 25px; background-color: #e75e8d"
                                />
                                <div class="col col-lg-2"></div>
                                <input
                                  class="col col-lg-2"
                                  type="submit"
                                  value="수정"
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
            
            

    <!-- Scripts -->
    <!-- Bootstrap core JavaScript -->
    <script src="../vendor/jquery/jquery.min.js"></script>
    <script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

  </body>
</html>
