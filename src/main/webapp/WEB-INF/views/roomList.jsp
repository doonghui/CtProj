<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ page session="true" %>
<c:set var="loginId"
       value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('id')}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? 'Login' : 'ID='+=loginId}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <%--    <meta charset="utf-8" />--%>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>With Us</title>


    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>


    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico"/>
    <!-- Bootstrap Icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet"/>
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic"
          rel="stylesheet" type="text/css"/>
    <!-- SimpleLightbox plugin CSS-->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.css" rel="stylesheet"/>
    <!-- Core theme CSS (includes Bootstrap)-->
    <%--    <link rel="stylesheet" type="text/css" href="<c:url value="/css/stylesmainpage.css"/>">--%>

    <link rel="stylesheet" type="text/css" href="<c:url value="/css/stylesmainpage.css"/>">
    <%--        <link rel="stylesheet" type="text/css" href="<c:url value="/css/stylesmaintest.css"/>">--%>


</head>
<body id="page-top">

<!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-light fixed-top py-3" id="mainNav">
    <div class="container px-4 px-lg-5">
        <a class="navbar-brand" href="#page-top">With us</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false"
                aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse mx-auto" id="navbarResponsive">
            <ul class="navbar-nav m-auto my-2 my-lg-0">
                <li class="nav-item"><a class="nav-link nav-menu" href="<c:url value='/'/>">홈</a></li>
                <li class="nav-item"><a class="nav-link nav-menu" href="<c:url value='/room/in-mem'/>">방 입장</a></li>
                <li class="nav-item"><a class="nav-link nav-menu" href="<c:url value='/room/find'/>">방 찾기</a></li>
                <li class="nav-item"><a class="nav-link nav-menu" href="<c:url value='/room/make'/>">방 생성</a></li>
                <li class="nav-item"><a class="nav-link nav-menu" href="<c:url value='/room/list'/>">나의 방</a></li>
                <%--                <li class="nav-item"><a class="nav-link " href="#contact">Contact</a></li>--%>
                <%--                <li class="nav-item"><a class="nav-link" href="#contact">Contact</a></li>--%>
                <%--                <li class="nav-item"><a class="nav-link" href="#contact">로그인</a></li>--%>
            </ul>

        </div>
        <!-- 로그인-->
        <a href="<c:url value='${loginOutLink}'/>">
            <button type="button" class="btn btn-outline-danger">${loginOut}</button>
        </a>
        <a href="<c:url value='/register/add'/>">
            <button type="button" class="btn btn-outline-danger">회원가입</button>
        </a>


    </div>
</nav>
<!-- Masthead-->
<header class="masthead">
    <div class="container px-4 px-lg-5 h-100">
        <div class="row gx-4  h-100 align-items-center justify-content-center text-center">
            <div class="card login-card">
                <div class="text-center my-3">
                    <img class="img-fluid rounded-circle mb-4" src="https://dummyimage.com/150x150/6c757d/dee2e6.jpg"
                         alt="..."/>
                    <!-- 유저정보-->
                    <div><p id=userInformation class="text-white-50 mb-0"
                            style="width: 182px;height: 72px;font-size: inherit;"></p></div>
                </div>
            </div>
        </div>
    </div>
</header>
<!-- Section-->
<section class="py-5 page-section">
    <h2>
        <div id="list-num"></div>
    </h2>    <!-- 방 정보를 가져와서 집어넣을 예정이다-->

    <div class="container px-4 px-lg-5 mt-5">
        <h1>방장인 방</h1>
        <div id="list-host"></div>        <!-- 방 정보를 가져와서 집어넣을 예정이다-->

    </div>

    <div class="container px-4 px-lg-5 mt-5">
        <h1>회원인 방</h1>
        <div id="list-mem"></div>        <!-- 방 정보를 가져와서 집어넣을 예정이다-->

    </div>

    <div class="container px-4 px-lg-5 mt-5">
        <h1>후기</h1>
        <div id="reviewList"></div>        <!-- 방 정보를 가져와서 집어넣을 예정이다-->

    </div>


    <%--    <!-- Modal(후기 남기기 화면) -->--%>
    <%--    <div class="modal">--%>
    <%--        <div class="modal-dialog" role="document">--%>
    <%--            <div class="modal-content">--%>
    <%--                <div class="modal-header">--%>
    <%--                    <h5 class="modal-title">Modal title</h5>--%>
    <%--                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">--%>
    <%--                        <span aria-hidden="true"></span>--%>
    <%--                    </button>--%>
    <%--                </div>--%>
    <%--                <div class="modal-body">--%>
    <%--                    <p>Modal body text goes here.</p>--%>
    <%--                    <div id="roomReviewList" class="wrapInfo"></div>--%>

    <%--                </div>--%>
    <%--                <div class="modal-footer">--%>

    <%--                    <button type="button" id="reviewBtn" class="btn btn-primary">저장하기</button>--%>
    <%--                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>--%>
    <%--                </div>--%>
    <%--            </div>--%>
    <%--        </div>--%>
    <%--    </div>--%>


    <button type="button" class="btn btn-outline-primary" data-bs-toggle="modal"
            data-bs-target="#reviewModal" style="width:80px;height:50px;left:80%; top:96%;">수정
    </button>
    <!-- Modal -->
    <div class="modal fade" id="reviewModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                    <button type="button" class="btn-close closeModalBtn" data-bs-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true"></span>
                    </button>
                </div>
                <div class="modal-body">
                    <div id="roomReviewList" class="wrapInfo"></div>
                </div>
                <div class="modal-footer">

                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소하기</button>
                    <button type="button" class="btn btn-primary">저장하기</button>
                </div>
            </div>
        </div>
    </div>

    <%--    <!-- Modal -->--%>
    <%--    <div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">--%>
    <%--        <div class="modal-dialog" role="document">--%>
    <%--            <div class="modal-content">--%>
    <%--                <div class="modal-header">--%>
    <%--                    <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>--%>
    <%--                    <button type="button" class="close closeModalBtn" data-dismiss="modal" aria-label="Close">--%>
    <%--                        <span aria-hidden="true">&times;</span>--%>
    <%--                    </button>--%>
    <%--                </div>--%>
    <%--                <div class="modal-body">--%>
    <%--                    ...--%>
    <%--                </div>--%>
    <%--                <div class="modal-footer">--%>
    <%--                    <button type="button" class="btn btn-secondary closeModalBtn" data-dismiss="modal">Close</button>--%>
    <%--                    <button type="button" class="btn btn-primary">Save changes</button>--%>
    <%--                </div>--%>
    <%--            </div>--%>
    <%--        </div>--%>
    <%--    </div>--%>

</section>


<!-- About-->

<footer class="bg-light py-5">
    <div class="container px-4 px-lg-5">
        <div class="small text-center text-muted">Copyright &copy; 2022 - Company Name</div>
    </div>
</footer>
<!-- Bootstrap core JS-->
<script src="<c:url value="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"/>"></script>
<!-- SimpleLightbox plugin JS-->
<script src="<c:url value="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.js"/>"></script>

<!-- Core theme JS-->
<script>

    let showList = function () {
        //
        // $('.openModalBtn').click(function (e) {
        //     e.preventDefault();
        //     $('#reviewModal').modal("show");
        // });
        // $('.closeModalBtn').on('click', function () {
        //     $('#reviewModal').modal('hide');
        // });


        let userId = "${loginId}";
        if (userId === '') {
            $("#userInformation").html("로그인해주세요");
        } else {
            $.ajax({
                type: 'GET',       // 요청 메서드
                url: '/CtProj/login/user',  // 요청 URI
                success: function (result) {
                    $("#userInformation").html(toUserHtml(result));    // 서버로부터 응답이 도착하면 호출될 함수
                },
                error: function () {
                    alert("error")
                } // 에러가 발생했을 때, 호출될 함수
            }); // $.ajax()
        }

        $.ajax({
            type: 'GET',       // 요청 메서드
            url: '/CtProj/list/mem',  // 요청 URI
            success: function (result) {
                $("#list-mem").html(toHtmlMem(result));    // 서버로부터 응답이 도착하면 호출될 함수
            },
            error: function () {
                alert("error")
            } // 에러가 발생했을 때, 호출될 함수
        }); // $.ajax()

        $.ajax({
            type: 'GET',       // 요청 메서드
            url: '/CtProj/list/host',  // 요청 URI
            success: function (result) {
                $("#list-host").html(toHtmlHost(result));    // 서버로부터 응답이 도착하면 호출될 함수
            },
            error: function () {
                alert("error")
            } // 에러가 발생했을 때, 호출될 함수
        }); // $.ajax()

        $.ajax({
            type: 'GET',       // 요청 메서드
            url: '/CtProj/list/num',  // 요청 URI
            success: function (result) {
                $("#list-num").html(toHtmlListNum(result));    // 서버로부터 응답이 도착하면 호출될 함수
            },
            error: function () {
                alert("error")
            } // 에러가 발생했을 때, 호출될 함수
        }); // $.ajax()


        $.ajax({
            type: 'GET',       // 요청 메서드
            url: '/CtProj/room_in/list/mem/review?bno=' +${roomDto.bno},  // 요청 URI
            success: function (result) {
                $("#roomReviewList").html(toHtmlroomReviewList(result));
            },
            error: function () {
                alert("안됨..")
            } // 에러가 발생했을 때, 호출될 함수
        }); // $.ajax()


        // $.ajax({
        //     type: 'GET',       // 요청 메서드
        //     url: '/CtProj/list/mem/review',  // 요청 URI
        //     success: function (result) {
        //         $("#reviewList").html(toHtmlReviewList(result));
        //     },
        //     error: function () {
        //         alert("안됨..")
        //     } // 에러가 발생했을 때, 호출될 함수
        // }); // $.ajax()
    }


    $(document).ready(function () {
        showList();


        $(".reveiwMemBtn").click(function () {
            let reviewRoomBno = $(this).parent().parent().attr("data-reviewBno");
            console.log(reviewRoomBno);

            $.ajax({
                type: 'POST',       // 요청 메서드
                url: '/CtProj/list/mem/review',   // 요청 URI /ch4/comments?bno=1085 POST
                headers: {"content-type": "application/json"}, // 요청 헤더
                data: JSON.stringify({
                    roomBno: reviewRoomBno,
                }),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
                success: function (result) {
                    alert("확인이 완료하였습니다.");
                    showList();
                },
                error: function () {
                    fail("failed..");
                    alert("다시 입력해주세요.")
                } // 에러가 발생했을 때, 호출될 함수
            }); // $.ajax()

        });


        <%--$('#reviewBtn').click(function () {--%>
        <%--    let userNum = $("#totalUserNum").text();--%>
        <%--    let bno = ${roomDto.bno};--%>
        <%--    let reviewKey = []--%>
        <%--    let reviewValue = []--%>
        <%--    console.log(userNum);--%>
        <%--    for (let i = 0; i < userNum - 1; i++) {--%>
        <%--        let reviewIdArr = {}--%>
        <%--        let idSelect = "#radioCheckUserId" + i + "";--%>
        <%--        let nameSelect = "chk_info" + i + "";--%>
        <%--        console.log(nameSelect)--%>
        <%--        if ($("input:radio[name=" + nameSelect + "]:checked")) {--%>
        <%--            reviewKey.push($(idSelect).text());--%>
        <%--            reviewValue.push($("input:radio[name=" + nameSelect + "]:checked").val());--%>
        <%--        }--%>

        <%--    }--%>
        <%--    console.log(reviewKey)--%>
        <%--    console.log(reviewValue)--%>
        <%--    $.ajax({--%>
        <%--        type: 'POST',       // 요청 메서드--%>
        <%--        url: '/CtProj/room_in/mem/drop/review/' + bno,  // 요청 URI /ch4/comments?bno=1085 POST--%>
        <%--        // headers: {"content-type": "application/json"}, // 요청 헤더--%>
        <%--        traditional: true,--%>
        <%--        data:--%>
        <%--            {--%>
        <%--                "reviewKey": reviewKey,--%>
        <%--                "reviewValue": reviewValue--%>
        <%--            },  // 서버로 전송할 데이터. stringify()로 직렬화 필요.--%>
        <%--        success: function (result) {--%>
        <%--            alert("완료하였습니다.");--%>
        <%--            window.location.href = 'http://localhost:8080/CtProj/';--%>


        <%--        },--%>
        <%--        error: function () {--%>
        <%--            alert("왜 실패하지..?")--%>
        <%--        } // 에러가 발생했을 때, 호출될 함수--%>
        <%--    });--%>
        <%--});--%>


        $("#list-mem").on("click", ".delBtn-Mem", function () {
            let bno = $(this).parent().parent().attr("data-bno");


            if (confirm("삭제하시겠습니까?")) {
                $.ajax({
                    type: 'DELETE',       // 요청 메서드
                    url: '/CtProj/list/mem/' + bno,  // 요청 URI
                    success: function (result) {
                        alert("삭제되었습니다.");
                        showList();          // 삭제된 이후에 목록에 다시 갱신해주며 보여주기
                    },
                    error: function () {
                        alert("삭제에 실패하였습니다.")
                    } // 에러가 발생했을 때, 호출될 함수
                }); // $.ajax()
            }

        });

        $("#list-host").on("click", ".delBtn-Host", function () {
            let bno = $(this).parent().parent().attr("data-bno");
            // let title = $(this).parent().attr("title");
            if (confirm("삭제하시겠습니까?")) {
                $.ajax({
                    type: 'DELETE',       // 요청 메서드
                    url: '/CtProj/list/host/' + bno,  // 요청 URI
                    success: function (result) {
                        alert("삭제되었습니다");
                        showList();          // 삭제된 이후에 목록에 다시 갱신해주며 보여주기
                    },
                    error: function () {
                        alert("삭제에 실패하였습니다.")
                    } // 에러가 발생했을 때, 호출될 함수
                }); // $.ajax()
            }
        });


    });

    let toUserHtml = function (userInfo) {
        let tmp = '<div>'
        tmp += '닉네임 =<div id="userIdInfo">' + userInfo.id + '</div><br>'
        tmp += '포인트 =' + userInfo.coin + '<br>'
        tmp += '레벨 =' + Math.floor(userInfo.level) + '<br>'


        return tmp + '</div>';
    }


    let toHtmlMem = function (rooms) {


        let tmp = '<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">'

        rooms.forEach(function (room) {
            const dateFormat = new Date(room.meet_Date);
            const meet_date = dateFormat.getFullYear() + '년 ' + (dateFormat.getMonth() + 1) + '월 ' + dateFormat.getDate() + '일 ' + dateFormat.getHours() + '시 ' + dateFormat.getMinutes() + '분';
            const meetDateFormat = dateFormat.getTime();

            tmp += '<div class="col " style="width:100%">'
            tmp += ' <div class="card border-danger mb-3" style="max-width: 100rem;height: 115px;">'
            tmp += '      <!-- Product details--> '
            tmp += '     <div class="card-body">'
            tmp += '              <!-- Product name-->'
            tmp += '<ul>'
            tmp += '<li data-bno=' + room.bno + ' ' + 'data-meet_date =' + meetDateFormat + ' style="list-style-type:none;">'
            // tmp += '방번호= ' + room.bno
            tmp += ' <h4 class="card-title">' + '제목: <span class="title">' + room.title + '</span>' + '</h4>'
            tmp += '<p class="card-text" style="display: inline-block">'
            tmp += '날짜: <span class="meet_Date">' + meet_date + '</span><br>'
            tmp += '장소: <span class="meet_Place">' + room.meet_place + '</span><br>'
            <%--tmp +=  '인원수: '+${list.size()+1} + ' / '+ room.user_limit;--%>
            tmp += '</p>'
            tmp += '      <!-- Product actions-->'
            tmp += '   <div class="sub" style="position:absolute;top:50%;left:84%">'
            tmp += '<form action = "/CtProj/room/in-mem" method = "post" style="display: inline-block">'
            tmp += '<input type = "hidden" name = "room_num" value ="' + room.bno + '"/>'
            tmp += ' <input type = "submit" value = "입장하기" class="btn btn-outline-danger btn-myroom"/>'
            tmp += '</form>'
            tmp += '  <button type="button" class="btn btn-outline-primary btn-myroom delBtn-Mem">나가기</button>'
            tmp += '      </div>'
            tmp += '</li>'
            tmp += '</ul>'
            tmp += '    </div>'
            tmp += '  </div>'
            tmp += ' </div>'


        })

        return tmp + "</div>";

    }


    let toHtmlReviewList = function (reviews) {

        let tmp = '<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">'

        reviews.forEach(function (room) {
            const dateFormat = new Date(room.review_date);
            const meet_date = dateFormat.getFullYear() + '년 ' + (dateFormat.getMonth() + 1) + '월 ' + dateFormat.getDate() + '일 ' + dateFormat.getHours() + '시 ' + dateFormat.getMinutes() + '분';
            const meetDateFormat = dateFormat.getDate();

            tmp += '<div class="col " style="width:100%">'
            tmp += ' <div class="card border-danger mb-3" style="max-width: 100rem;height: 115px;">'
            tmp += '      <!-- Product details--> '
            tmp += '     <div class="card-body">'
            tmp += '              <!-- Product name-->'
            tmp += '<ul>'
            tmp += '<li data-reviewBno=' + room.bno + ' style="list-style-type:none;">'
            // tmp += '방번호= ' + room.bno
            tmp += ' <h4 class="card-title">' + '제목: <span class="title">' + room.review_title + '</span>' + '</h4>'
            tmp += '<p class="card-text" style="display: inline-block">'
            tmp += '날짜: <span class="meet_Date">' + meet_date + '</span><br>'
            // tmp += '<div data-meetDate="meet_Place" style="display: none">' + meetDateFormat+ '</div><br>'
            tmp += '장소: <span class="meet_Place">' + room.review_place + '</span><br>'

            tmp += '</p>'
            tmp += '      <!-- Product actions-->'
            tmp += '   <div class="sub" style="position:absolute;top:50%;left:84%">'
            tmp += ' <button type="button"  class="btn btn-primary reveiwMemBtn" data-bs-toggle="modal" data-bs-target="#reviewModal">후기남기기</button>'
            tmp += '      </div>'
            tmp += '</li>'
            tmp += '</ul>'
            tmp += '    </div>'
            tmp += '  </div>'
            tmp += ' </div>'

        })

        return tmp + "</div>";


    }


    let toHtmlHost = function (rooms) {

        let tmp = '<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">'

        rooms.forEach(function (room) {
            const dateFormat = new Date(room.meet_Date);
            const meet_date = dateFormat.getFullYear() + '년 ' + (dateFormat.getMonth() + 1) + '월 ' + dateFormat.getDate() + '일 ' + dateFormat.getHours() + '시 ' + dateFormat.getMinutes() + '분';
            const meetDateFormat = dateFormat.getDate();

            tmp += '<div class="col " style="width:100%">'
            tmp += ' <div class="card border-danger mb-3" style="max-width: 100rem;height: 115px;">'
            tmp += '      <!-- Product details--> '
            tmp += '     <div class="card-body">'
            tmp += '              <!-- Product name-->'
            tmp += '<ul>'
            tmp += '<li data-bno=' + room.bno + ' style="list-style-type:none;">'
            // tmp += '방번호= ' + room.bno
            tmp += ' <h4 class="card-title">' + '제목: <span class="title">' + room.title + '</span>' + '</h4>'
            tmp += '<p class="card-text" style="display: inline-block">'
            tmp += '날짜: <span class="meet_Date">' + meet_date + '</span><br>'
            tmp += '<div data-meetDate="meet_Place" style="display: none">' + meetDateFormat + '</div><br>'
            tmp += '장소: <span class="meet_Place">' + room.meet_place + '</span><br>'

            <%--tmp +=  '인원수: '+${list.size()+1} + ' / '+ room.user_limit;--%>
            tmp += '</p>'
            tmp += '      <!-- Product actions-->'
            tmp += '   <div class="sub" style="position:absolute;top:50%;left:84%">'
            tmp += '<form action = "/CtProj/room/in-host" method = "post" style="display: inline-block">'
            tmp += '<input type = "hidden" name = "room_num" value ="' + room.bno + '"/>'
            tmp += ' <input type = "submit" value = "입장하기" class="btn btn-outline-danger btn-myroom"/>'
            tmp += '</form>'
            tmp += '  <button type="button" class="btn btn-outline-primary btn-myroom delBtn-Host">나가기</button>'
            tmp += '      </div>'
            tmp += '</li>'
            tmp += '</ul>'
            tmp += '    </div>'
            tmp += '  </div>'
            tmp += ' </div>'


        })
        return tmp + "</div>";
    }

    let toHtmlListNum = function (roomNum) {
        let tmp = "<ul>";

        tmp += ' 방의 총 수 =' + roomNum;


        return tmp + "</ul>";

    }

    let toHtmlroomReviewList = function (list) {
        let userIdInfo = $("#userIdInfo").text();
        console.log(userIdInfo);
        let tmp = "<ul>";
        for (const val in Object.keys(list)) {
            if (list[val].user_id != userIdInfo) {
                tmp += '<div class="form-group">'
                tmp += '<div id="radioCheckUserId' + val + '">' + list[val].user_id + '</div><br>'
                tmp += ' <input type="radio" name="chk_info' + val + '" value="1">별로에요'
                tmp += ' <input type="radio" name="chk_info' + val + '" value="2">아쉬워요'
                tmp += ' <input type="radio" name="chk_info' + val + '" value="3">보통이에요'
                tmp += ' <input type="radio" name="chk_info' + val + '" value="4">좋았어요'
                tmp += ' <input type="radio" name="chk_info' + val + '" value="5">최고에요!'
                tmp += '</br></div>'
            }

        }

        return tmp + '</ul>';
    }


    window.addEventListener('DOMContentLoaded', event => {

        // Navbar shrink function
        var navbarShrink = function () {
            const navbarCollapsible = document.body.querySelector('#mainNav');
            if (!navbarCollapsible) {
                return;
            }
            if (window.scrollY === 0) {
                navbarCollapsible.classList.remove('navbar-shrink')
            } else {
                navbarCollapsible.classList.add('navbar-shrink')
            }

        };

        // Shrink the navbar
        navbarShrink();

        // Shrink the navbar when page is scrolled
        document.addEventListener('scroll', navbarShrink);


    });

</script>
<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
<!-- * *                               SB Forms JS                               * *-->
<!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
<script src="<c:url value="https://cdn.startbootstrap.com/sb-forms-latest.js"/>"></script>
</body>
</html>
