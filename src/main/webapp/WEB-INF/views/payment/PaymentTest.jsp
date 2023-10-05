<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>결제하기 버튼</title>
    <!-- 포트원 결제 -->
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
    <!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <!-- 포트원 결제 -->
</head>

<body>
...
<button id="requestPay" onclick="requestPay()">구매하기</button> <!-- 결제하기 버튼 생성 -->
...

</body>

<script>

    function requestPay(){
        IMP.init("imp24438240"); // 가맹점 식별코드
        IMP.request_pay({
            pg : 'kakaopay.TC0ONETIME',
            pay_method : 'card',
            merchant_uid: "order_no_0002", // 상점에서 관리하는 주문 번호
            name : '주문명:결제테스트',
            amount : 15000,
            buyer_email : 'iamport@siot.do',
            buyer_name : '구매자이름',
            buyer_tel : '010-1234-5678',
            buyer_addr : '서울특별시 강남구 삼성동',
            buyer_postcode : '123-456'
        }, function(rsp) {
            if ( rsp.success ) {
                //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
                jQuery.ajax({
                    url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        imp_uid : rsp.imp_uid
                        //기타 필요한 데이터가 있으면 추가 전달
                    }
                }).done(function(data) {
                    //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                    if ( everythings_fine ) {
                        var msg = '결제가 완료되었습니다.';
                        msg += '\n고유ID : ' + rsp.imp_uid;
                        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                        msg += '\n결제 금액 : ' + rsp.paid_amount;
                        msg += '카드 승인번호 : ' + rsp.apply_num;

                        alert(msg);
                    } else {
                        //[3] 아직 제대로 결제가 되지 않았습니다.
                        //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                    }
                });
            } else {
                var msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;

                alert(msg);
            }
        });
    }
</script>
<script>
    // 구매자 정보
    const user_email = "ljh";
    const username = "이재혁";

    // 결제창 함수 넣어주기
    const buyButton = document.getElementById('payment')
    buyButton.setAttribute('onclick', `kakaoPay('${user_email}', '${username}')`)

    var IMP = window.IMP;

    var today = new Date();
    var hours = today.getHours(); // 시
    var minutes = today.getMinutes();  // 분
    var seconds = today.getSeconds();  // 초
    var milliseconds = today.getMilliseconds();
    var makeMerchantUid = `${hours}` + `${minutes}` + `${seconds}` + `${milliseconds}`;

    function kakaoPay(useremail, username) {
        if (confirm("구매 하시겠습니까?")) { // 구매 클릭시 한번 더 확인하기
            if (localStorage.getItem("access")) { // 회원만 결제 가능
                const emoticonName = document.getElementById('title').innerText

                IMP.init("imp24438240"); // 가맹점 식별코드
                IMP.request_pay({
                    pg: 'kakaopay.TC0ONETIME', // PG사 코드표에서 선택
                    pay_method: 'card', // 결제 방식
                    merchant_uid: "IMP" + makeMerchantUid, // 결제 고유 번호
                    name: '상품명', // 제품명
                    amount: 100, // 가격
                    //구매자 정보 ↓
                    buyer_email: `${useremail}`,
                    buyer_name: `${username}`,
                    // buyer_tel : '010-1234-5678',
                    // buyer_addr : '서울특별시 강남구 삼성동',
                    // buyer_postcode : '123-456'
                }, async function (rsp) { // callback
                    if (rsp.success) { //결제 성공시
                        console.log(rsp);
                        //결제 성공시 프로젝트 DB저장 요청


                        if (response.status == 200) { // DB저장 성공시
                            alert('결제 완료!')
                            window.location.reload();
                        } else { // 결제완료 후 DB저장 실패시
                            alert(`error:[${response.status}]\n결제요청이 승인된 경우 관리자에게 문의바랍니다.`);
                            // DB저장 실패시 status에 따라 추가적인 작업 가능성
                        }
                    } else if (rsp.success == false) { // 결제 실패시
                        alert(rsp.error_msg)
                    }
                });
            }
            else { // 비회원 결제 불가r
                alert('로그인이 필요합니다!')
            }
        } else { // 구매 확인 알림창 취소 클릭시 돌아가기
            return false;
        }
    }

</script>

</html>