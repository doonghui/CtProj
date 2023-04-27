<%@ page import="java.util.Date" %>
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
    <meta charset="utf-8"/>
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

    <!-- Remember to include jQuery :) -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>

    <!-- jQuery Modal -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css"/>

    <!-- date range picker 사용위해서-->
    <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css"/>

    <link rel="stylesheet" type="text/css" href="<c:url value="/css/stylesmainpage.css"/>">
    <%--    <link rel="stylesheet" type="text/css" href="<c:url value="/css/stylesmaintest.css"/>">--%>

    <style>
        ul > li {
            display: table-row-group;
            color: black;
        }

        .wrapInfo {
            position: absolute;
        }

        .page-section {
            height: 800px;
        }

        .login-card {
            background-color: #4f5050;
            left: 1097px;
            top: 119px;
        }
    </style>

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
<header class="masthead" style="height: 82.8px; padding-top: 0px;">

</header>
<!-- Section-->

<section class="py-5 page-section">
    <div class="container px-4 px-lg-5 h-100">
        <div class="row h-100 text-center">

            <!-- 로그인한 유저 정보 -->
            <div class="card login-card" style="position : absolute; right: 120px;">
                <div class="text-center my-3">
                    <img class="img-fluid rounded-circle mb-4" src="https://dummyimage.com/150x150/6c757d/dee2e6.jpg"
                         alt="..."/>
                    <!-- 유저정보-->
                    <div><p id=userInformation class="text-white-50 mb-0"
                            style="width: 182px;height: 72px;font-size: inherit;"></p></div>
                </div>

            </div>

            <div id="roomInfo"></div>


            <!-- 방장 + 인원 -->
            <ul class="list-group border-primary" style="width:auto;position: absolute;left: 75%;top: 58%;">
                <div id="list-mem"></div>
            </ul>

            <!-- 현재 인원 / 제한인원 -->
            <ul class="list-group border-primary" style="width:auto;position: absolute;left: 89%;top: 58%;">
                <div id="list-num"></div>
            </ul>

            <!--강퇴버튼-->
            <button type="button" class="btn btn-primary" id="drop-Btn"
                    style="width:120px;height:50px;margin-left:80%; margin-top:20%;">강퇴하기
            </button>





            <!-- 수정버튼-->
<%--            <button type="button" id="openModalBtn" class="btn btn-outline-primary wrapInfo" style="width:80px;height:50px;left:80%; top:96%;">수정</button>--%>

            <button type="button" id="openModalBtn" class="btn btn-outline-primary"  style="width:120px;height:50px;margin-left:80%; top:96%;">수정하기</button>

            <!-- 나가기버튼-->
            <div id="roomOutIsCoin" class="wrapInfo" style="left:40%;top:96%"></div>

        </div>
    </div>



    <!-- Modal -->
    <div class="modal fade" id="modModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog " role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                    <button type="button" class="btn-close closeModalBtn" data-bs-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true"></span>
                    </button>
                </div>
                    <div class="modal-body">
                            <div class="form-group">
                                <label for="InputTitle" class="form-label mt-4">제목</label>
                                <input type="text" class="form-control rooms-title" id="InputTitle"
                                       value="${roomDto.title}">
                            </div>
                            <div class="form-group">
                                <label for="img_file" class="form-label mt-4">사진</label>
                                <input class="form-control rooms-picture" type="file" name="file" id="img_file"
                                       placeholder="입력해주세요">

                            </div>

                            <div class="form-group">
                                <label for="InputDate" class="form-label mt-4">만날 시간</label>
                                <input type="text" class="form-control rooms-meet_Date" id="InputDate"
                                       aria-describedby="emailHelp" value=""/>
                                <small id="emailHelp" class="form-text text-muted">ex) 2022-12-10 </small>
                            </div>
                            <div class="form-group">
                                <label for="InputPlace" class="form-label mt-4">만날 장소</label>
                                <input type="text" class="form-control rooms-meet_place" id="InputPlace"
                                       value="${roomDto.meet_place}">
                            </div>
                            <div class="form-group">
                                <label for="InputNotice" class="form-label mt-4">공지사항</label>
                                <input type="text" class="form-control rooms-notice" id="InputNotice"
                                       value="${roomDto.notice}">
                            </div>
                            <div class="form-group">
                                <label for="InputCategory" class="form-label mt-4">카테고리</label>
                                <select name="Category" id="InputCategory" class="form-group rooms-category">
                                    <option value="식사">식사</option>
                                    <option value="공부" selected>공부</option>
                                    <option value="운동">운동</option>
                                    <option value="여행">여행</option>
                                    <option value="거래">거래</option>
                                    <option value="기타">기타</option>
                                </select>

                            </div>
                            <div class="form-group">
                                <label for="InputLimit" class="form-label mt-4">제한 인원</label>
                                <select name="limit" id="InputLimit" class="form-group rooms-user_limit">
                                    <option value="2">2명</option>
                                    <option value="3">3명</option>
                                    <option value="4">4명</option>
                                    <option value="5">5명</option>
                                    <option value="6">6명</option>
                                    <option value="7">7명</option>
                                    <option value="8">8명</option>
                                </select>
                            </div>
                    </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="Mod-Btn">변경하기</button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소하기</button>
                </div>
            </div>
        </div>
    </div>

<%--    <!-- Modal(수정화면) -->--%>
<%--    <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"--%>
<%--         aria-labelledby="staticBackdropLabel" aria-hidden="true"--%>
<%--         style="display: block;background: transparent;margin-left: 35%;box-shadow:none;">--%>
<%--        <div class="modal-dialog" role="document">--%>
<%--            <div class="modal-content">--%>
<%--                <div class="modal-header">--%>
<%--                    <h5 class="modal-title">수정창</h5>--%>
<%--                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">--%>
<%--                        <span aria-hidden="true"></span>--%>
<%--                    </button>--%>
<%--                </div>--%>
<%--                <div class="modal-body">--%>
<%--                    <fieldset style="padding-left:40px">--%>
<%--                        <div class="form-group">--%>
<%--                            <label for="InputTitle" class="form-label mt-4">제목</label>--%>
<%--                            <input type="text" class="form-control rooms-title" id="InputTitle"--%>
<%--                                   value="${roomDto.title}">--%>
<%--                        </div>--%>
<%--                        <div class="form-group">--%>
<%--                            <label for="img_file" class="form-label mt-4">사진</label>--%>
<%--                            <input class="form-control rooms-picture" type="file" name="file" id="img_file"--%>
<%--                                   placeholder="입력해주세요">--%>

<%--                        </div>--%>

<%--                        <div class="form-group">--%>
<%--                            <label for="InputDate" class="form-label mt-4">만날 시간</label>--%>
<%--                            <input type="text" class="form-control rooms-meet_Date" id="InputDate"--%>
<%--                                   aria-describedby="emailHelp" value=""/>--%>
<%--                            <small id="emailHelp" class="form-text text-muted">ex) 2022-12-10 </small>--%>
<%--                        </div>--%>
<%--                        <div class="form-group">--%>
<%--                            <label for="InputPlace" class="form-label mt-4">만날 장소</label>--%>
<%--                            <input type="text" class="form-control rooms-meet_place" id="InputPlace"--%>
<%--                                   value="${roomDto.meet_place}">--%>
<%--                        </div>--%>
<%--                        <div class="form-group">--%>
<%--                            <label for="InputNotice" class="form-label mt-4">공지사항</label>--%>
<%--                            <input type="text" class="form-control rooms-notice" id="InputNotice"--%>
<%--                                   value="${roomDto.notice}">--%>
<%--                        </div>--%>
<%--                        <div class="form-group">--%>
<%--                            <label for="InputCategory" class="form-label mt-4">카테고리</label>--%>
<%--                            <select name="Category" id="InputCategory" class="form-group rooms-category">--%>
<%--                                <option value="식사">식사</option>--%>
<%--                                <option value="공부" selected>공부</option>--%>
<%--                                <option value="운동">운동</option>--%>
<%--                                <option value="여행">여행</option>--%>
<%--                                <option value="거래">거래</option>--%>
<%--                                <option value="기타">기타</option>--%>
<%--                            </select>--%>

<%--                        </div>--%>
<%--                        <div class="form-group">--%>
<%--                            <label for="InputLimit" class="form-label mt-4">제한 인원</label>--%>
<%--                            <select name="limit" id="InputLimit" class="form-group rooms-user_limit">--%>
<%--                                <option value="2">2명</option>--%>
<%--                                <option value="3">3명</option>--%>
<%--                                <option value="4">4명</option>--%>
<%--                                <option value="5">5명</option>--%>
<%--                                <option value="6">6명</option>--%>
<%--                                <option value="7">7명</option>--%>
<%--                                <option value="8">8명</option>--%>
<%--                            </select>--%>
<%--                        </div>--%>
<%--                    </fieldset>--%>
<%--                </div>--%>
<%--                <div class="modal-footer">--%>
<%--                    <button type="button" class="btn btn-primary" id="Mod-Btn">변경하기</button>--%>
<%--                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소하기</button>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>


<%--    <!-- Modal(후기 남기기 화면) -->--%>
<%--    <div class="modal fade" id="staticBackdropReview" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"--%>
<%--         aria-labelledby="staticBackdropReviewLabel" aria-hidden="true"--%>
<%--         style="display: block;background: transparent;margin-left: 35%;box-shadow:none;">--%>
<%--        <div class="modal-dialog" role="document">--%>
<%--            <div class="modal-content" style="height:700px">--%>
<%--                <div class="modal-header">--%>
<%--                    <h5 class="modal-title">후기창1</h5>--%>
<%--                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">--%>
<%--                        <span aria-hidden="true"></span>--%>
<%--                    </button>--%>
<%--                </div>--%>
<%--                <div class="modal-body">--%>
<%--                    <fieldset style="padding-left:40px">--%>


<%--                        <div id="roomReviewList" class="wrapInfo"></div>--%>

<%--                    </fieldset>--%>
<%--                </div>--%>
<%--                <div class="modal-footer" style="padding-left:40px">--%>
<%--                    <button type="button" id="reviewBtn" class="btn btn-primary">확인</button>--%>
<%--                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소하기</button>--%>
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
        $('#openModalBtn').click(function (e) {
            e.preventDefault();
            $('#modModal').modal("show");
        });
        $('.closeModalBtn').on('click', function () {
            $('#modModal').modal('hide');
        });


        let userId = "${loginId}";
        if (userId == '') {
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

        <%--$.ajax({--%>
        <%--    type: 'GET',       // 요청 메서드--%>
        <%--    url: '/CtProj/room/review/?bno=' +${roomDto.bno},  // 요청 URI--%>
        <%--    async: false,--%>
        <%--    success: function (result) {--%>
        <%--        console.log(result.is_coin_return);--%>
        <%--        $("#roomOutIsCoin").html(toHtmlIsCoinReturn(result));    // 서버로부터 응답이 도착하면 호출될 함수--%>
        <%--    },--%>
        <%--    error: function () {--%>
        <%--        alert("error")--%>
        <%--    } // 에러가 발생했을 때, 호출될 함수--%>
        <%--}); // $.ajax()--%>


        $.ajax({
            type: 'GET',       // 요청 메서드
            url: '/CtProj/room?bno=' +${roomDto.bno},  // 요청 URI
            async: false,
            success: function (result) {
                console.log("카운트!")
                console.log(result.user_cnt)
                console.log(result.meet_Date)
                cnt = result.user_cnt // 수정할때를 위해서 전역변수로 넘겨준다
                $("#roomInfo").html(toHtmlRoomInfo(result));    // 서버로부터 응답이 도착하면 호출될 함수
                $("#roomOutIsCoin").html(toHtmlIsCoinReturn(result));    // 서버로부터 응답이 도착하면 호출될 함수
            },
            error: function () {
                alert("error")
            } // 에러가 발생했을 때, 호출될 함수
        }); // $.ajax()


        $.ajax({
            type: 'GET',       // 요청 메서드
            url: '/CtProj/room_in/list/mem?bno=' +${roomDto.bno},  // 요청 URI
            success: function (result) {

                console.log(result)
                $("#list-mem").html(toHtmlMem(result));
            },
            error: function () {
                alert("error")
            } // 에러가 발생했을 때, 호출될 함수
        }); // $.ajax()

        <%--$.ajax({--%>
        <%--    type: 'GET',       // 요청 메서드--%>
        <%--    url: '/CtProj/room_in/list/mem/review?bno=' +${roomDto.bno},  // 요청 URI--%>
        <%--    success: function (result) {--%>
        <%--        $("#roomReviewList").html(toHtmlroomReviewList(result));--%>
        <%--    },--%>
        <%--    error: function () {--%>
        <%--        alert("안됨..")--%>
        <%--    } // 에러가 발생했을 때, 호출될 함수--%>
        <%--}); // $.ajax()--%>

        $.ajax({
            type: 'GET',       // 요청 메서드
            url: '/CtProj/room?bno=' +${roomDto.bno},  // 요청 URI
            success: function (result) {
                $("#list-num").html(toHtmlListNum(result));
            },
            error: function () {
                alert("error")
            } // 에러가 발생했을 때, 호출될 함수
        }); // $.ajax()


        $(".room-out").html(toHtmlRoomOut());    // 서버로부터 응답이 도착하면 호출될 함수


    }

    $(document).ready(function () {
        showList();


        $("#Mod-Btn").click(function () {
            let title = $(".rooms-title").val();
            let meet_Date = $(".rooms-meet_Date").val();
            let meet_place = $(".rooms-meet_place").val();
            let notice = $(".rooms-notice").val();
            let category = $(".rooms-category").val();
            let user_limit = $(".rooms-user_limit").val();
            let user_cnt = cnt
            let bno = ${roomDto.bno};
            const meetDate = new Date(meet_Date); // meet_Date Date 객체로 변환
            // let roomMeetDate = meetDate.toISOString(); // meet_Date room.meet_Date 값으로 변환

            let formData = new FormData();
            console.log(formData)
            let input_file = $("input[name='file']")[0].files[0];

            console.log(input_file)
            formData.append("bno", bno)
            formData.append("meet_Date", meet_Date)
            formData.append("meet_place", meet_place)
            formData.append("notice", notice)
            formData.append("category", category)
            formData.append("user_limit", user_limit)
            formData.append("title", title)
            formData.append("user_cnt", user_cnt)
            formData.append("uploadFile", input_file);

            console.log("유저카운트")
            console.log(user_cnt)

            if (title.trim() === '' || meet_Date.trim() === '' || meet_place.trim() === '' || category.trim() === '' || user_limit.trim() === '') {     // 공백을 입력할때 주의 주기!!
                alert("입력해주세요!!!");
                return;
            }
            if (user_limit < user_cnt) {
                alert("입장한 인원이 제한인원보다 많습니다.")
                return;
            }

            if (input_file == null) {
                $.ajax({
                    type: 'PATCH',       // 요청 메서드
                    url: '/CtProj/rooms/' + bno,  // 요청 URI /ch4/comments?bno=1085 POST
                    headers: {"content-type": "application/json"}, // 요청 헤더
                    data: JSON.stringify({
                        title: title,
                        meet_Date: meetDate,
                        meet_place: meet_place,
                        notice: notice,
                        category: category,
                        user_cnt: user_cnt,
                        user_limit: user_limit,
                    }),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
                    success: function (result) {
                        console.log("방 변경후")
                        alert("수정이 완료하였습니다.");
                        showList();

                    },
                    error: function () {

                        alert("다시 입력해주세요.")

                    } // 에러가 발생했을 때, 호출될 함수
                }); // $.ajax()
            } else {
                $.ajax({
                    type: 'POST',       // 요청 메서드
                    url: '/CtProj/room_in/upload',  // 요청 URI /ch4/comments?bno=1085 POST
                    processData: false,
                    contentType: false,
                    data: formData,
                    success: function (result) {
                        alert("수정이 완료되었습니다.");
                        showList();

                    },
                    error: function () {

                        alert("실패요..")

                    } // 에러가 발생했을 때, 호출될 함수
                }); // $.ajax()
            }

            // 모달 창 닫기
            $('#modModal').modal('hide');

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


        $('#drop-Btn').click(function () {
            let bno = ${roomDto.bno};
            user_id = []
            if ($("input:checkbox[name='flexCheckChecked']:checked").length === 0) {
                alert("강퇴할 인원이 없습니다.")
                return;
            }
            if (confirm("정말로 강퇴하시겠습니까?")) {
                $("input:checkbox[name='flexCheckChecked']:checked").each(function () {
                    user_id.push($(this).val());
                });
            } else {
                return false;
            }

            for (const val in Object.values(user_id)) {
                console.log(val)
                $.ajax({
                    type: 'DELETE',       // 요청 메서드
                    url: '/CtProj/room_in/drop/mem/' + bno + '/' + user_id[val] + '/' + user_id.length,  // 요청 URI
                    success: function (result) {
                        showList();          // 삭제된 이후에 목록에 다시 갱신해주며 보여주기
                    },
                    error: function () {
                        alert("삭제에 실패하였습니다.")
                        return false;
                    } // 에러가 발생했을 때, 호출될 함수
                }); // $.ajax()
            }
            alert("삭제되었습니다.")
        });

        $('#confirmBtn').click(function () {
            let bno = ${roomDto.bno};
            let writer = ${roomDto.writer}
                let
            meet_Date = $(".rooms-meet_Date").val();
            const now = new Date();
            const dateFormat = new Date(meet_Date); // meet_Date Date 객체로 변환
            console.log(dateFormat)
            console.log(now)
            let meetDateComparison = (dateFormat - now) / (60 * 60 * 1000);
            console.log(meetDateComparison)
            user_id = []
            if (meetDateComparison > 0) {
                return;
            }
            if ($("input:checkbox[name='flexCheckChecked']:checked").length === 0) {
                return;
            }
            if (confirm("해당인원들이 모임에 참석하였습니까?")) {
                $("input:checkbox[name='flexCheckChecked']:checked").each(function () {
                    user_id.push($(this).val());
                });
            } else {
                return false;
            }
            user_id.push(writer);

            new Promise((succ, fail) => {
                for (const val in Object.values(user_id)) {
                    $.ajax({
                        type: 'POST',       // 요청 메서드
                        url: '/CtProj/room_in/mem/confirm',  // 요청 URI /ch4/comments?bno=1085 POST
                        headers: {"content-type": "application/json"}, // 요청 헤더
                        data: JSON.stringify({
                            user_id: user_id[val],
                            room_bno: bno,
                        }),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
                        success: function (result) {
                            succ(result);
                            alert("확인이 완료하였습니다.");
                            showList();

                        },
                        error: function () {
                            fail("failed..");
                            alert("다시 입력해주세요.")
                        } // 에러가 발생했을 때, 호출될 함수
                    }); // $.ajax()
                }
            }).then((arg) => {    // 두번째 ajax를 실행한다.
            $.ajax({
                type: 'DELETE',       // 요청 메서드
                url: '/CtProj/room_in/mem/confirm/' + bno,  // 요청 URI
                success: function (result) {
                    console.log("확인후 나갑니다.")
                    window.location.href = 'http://localhost:8080/CtProj/';
                },
                error: function () {
                    alert("삭제에 실패하였습니다.")
                    return false;
                } // 에러가 발생했을 때, 호출될 함수
            }); // $.ajax()
        });
        });

        $('#InputDate').daterangepicker({
            "singleDatePicker": true,
            "timePicker": true,
            "timePicker24Hour": true,
            "locale": {
                "applyLabel": "확인",
                "cancelLabel": "취소",
                "format": 'YYYY-MM-DD HH:mm',
                "daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
                "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
            },
        });
    });



    let toUserHtml = function (userInfo) {
        let tmp = '<div>'
        tmp += '닉네임 =<div id="userIdInfo">' + userInfo.id + '</div><br>'
        tmp += '포인트 =' + userInfo.coin + '<br>'
        tmp += '레벨 =' + Math.floor(userInfo.level) + '<br>'


        return tmp + '</div>';
    }

    let toHtmlRoomOut = function () {
        let tmp = '<form action = "/CtProj/room_in/delete/host" onsubmit="return btnCheck()" method = "post">'
        tmp += '<input type = "hidden" name = "room_num" value ="' + ${roomDto.bno}+'" />'
        tmp += '<input type = "submit"  class="btn btn-outline-primary" value="나가기"/>'
        return tmp + '</form>';

    }


    <%--let toHtmlroomReviewList = function (list) {--%>
    <%--    let userIdInfo = $("#userIdInfo").text()--%>
    <%--    let tmp = "<ul>";--%>
    <%--    console.log(userIdInfo);--%>
    <%--    for (const val in Object.keys(list)) {--%>
    <%--        if (list[val].user_id != userIdInfo) {--%>
    <%--            tmp += '<div class="form-group">'--%>
    <%--            tmp += '<div id="radioCheckUserId' + val + '">' + list[val].user_id + '</div><br>'--%>
    <%--            tmp += ' <input type="radio" name="chk_info' + val + '" value="1">별로에요'--%>
    <%--            tmp += ' <input type="radio" name="chk_info' + val + '" value="2">아쉬워요'--%>
    <%--            tmp += ' <input type="radio" name="chk_info' + val + '" value="3">보통이에요'--%>
    <%--            tmp += ' <input type="radio" name="chk_info' + val + '" value="4">좋았어요'--%>
    <%--            tmp += ' <input type="radio" name="chk_info' + val + '" value="5">최고에요!'--%>
    <%--            tmp += '</br></div>'--%>
    <%--        }--%>

    <%--    }--%>


    <%--    &lt;%&ndash;tmp += '<li class="list-group-item d-flex justify-content-between align-items-center list-group-item-danger">방장: ' + ${roomDto.writer} +'</li>'&ndash;%&gt;--%>
    <%--    &lt;%&ndash;for (const val in Object.keys(list)) {&ndash;%&gt;--%>
    <%--    &lt;%&ndash;    tmp += '<li class="list-group-item d-flex justify-content-between align-items-center">'&ndash;%&gt;--%>
    <%--    &lt;%&ndash;    tmp += list[val].user_id&ndash;%&gt;--%>
    <%--    &lt;%&ndash;    tmp += list[val] + '<input class="form-check-input" type="checkbox" name="flexCheckChecked"  value="' + list[val] + '"> </li> ';&ndash;%&gt;--%>
    <%--    &lt;%&ndash;}&ndash;%&gt;--%>
    <%--    return tmp + '</ul>';--%>
    <%--}--%>

    let toHtmlIsCoinReturn = function (roomInfo) {
        const now = new Date();
        console.log("모임시간"+roomInfo.meet_Date);
        console.log("현재시간"+now.getTime());

        if (roomInfo.meet_Date < now.getTime()) {
            let tmp = '<button type="button" class="btn btn-primary" id="confirmBtn" style="width:120px;height:50px;">모임확인'
            return tmp + '</button>';
        } else {
            let tmp = '<div class="wrapInfo room-out" style="left:40%;top:96%">'
            return tmp + '</div>';
        }

    }

    function btnCheck() {
        if (confirm("정말로 나가시겠습니까?")) {
            alert("완료되었습니다.");
        } else {
            return false;
        }
    }

    let toHtmlRoomInfo = function (room) {

        const dateFormat = new Date(room.meet_Date);
        const meet_date = dateFormat.getFullYear() + '년 ' + (dateFormat.getMonth() + 1) + '월 ' + dateFormat.getDate() + '일 ' + (dateFormat.getHours() > 9 ? dateFormat.getHours() : '0' + dateFormat.getHours()) + '시 ' + (dateFormat.getMinutes() > 9 ? dateFormat.getMinutes() : '0' + dateFormat.getMinutes()) + '분';
        meetDateFormat = dateFormat.getFullYear() + '-' + (dateFormat.getMonth() + 1) + '-' + dateFormat.getDate() + ' ' + (dateFormat.getHours() > 9 ? dateFormat.getHours() : '0' + dateFormat.getHours()) + ':' + (dateFormat.getMinutes() > 9 ? dateFormat.getMinutes() : '0' + dateFormat.getMinutes());
        $('input[id=InputDate]').attr('value', meetDateFormat);
        console.log(meetDateFormat)
        console.log(room.meet_Date);
        console.log(dateFormat);
        let tmp = ' <div class="card border-primary mb-3 wrapInfo" style="max-width: 50rem;height:100px;padding: 0">';

        tmp += '<!-- 방 제목 -->'
        tmp += ' <div class="card-header">방제목</div>'
        tmp += '<div class="card-body">'
        tmp += '<h4 class="card-title">' + room.title + '</h4>'
        tmp += '</div>'
        tmp += ' </div>'

        tmp += '<!-- 공지 사항 -->'
        tmp += '<div class="card border-primary mb-3 wrapInfo" style="margin-top: 150px; max-width: 50rem;height:100px;padding: 0">'
        tmp += '<div class="card-header">공지사항</div>'
        tmp += '<div class="card-body">'
        tmp += '<h4 class="card-title">' + room.notice + '</h4>'
        tmp += ' </div>'
        tmp += '</div>'
        tmp += '<div class="card border-primary mb-3 wrapInfo" style="margin-top: 150px;max-width: 20rem;height:100px;padding: 0;top:36%">'
        tmp += '<div class="card-header">장소</div>'
        tmp += '<div class="card-body">'
        tmp += '<h4 class="card-title">' + room.meet_place + '</h4>'
        tmp += '</div>'
        tmp += '</div>'
        tmp += '<div class="card border-primary mb-3 wrapInfo" style="margin-top: 150px;max-width: 20rem;height:100px;padding: 0;top:36%;left:35%">'
        tmp += '<div class="card-header">시간</div>'
        tmp += '<div class="card-body">'
        tmp += '<h4 class="card-title" data-meet_date =' + room.meet_Date + '>' + meet_date + '</h4>'
        tmp += '</div>'
        tmp += '</div>'
        tmp += '<div class = "rooms-user_cnt" style="display:none;">' + room.user_cnt + '</div>'
        tmp += '<!-- 지도 보여주기-->'
        tmp += '<div class="card border-primary mb-3 wrapInfo" style="margin-top: 150px;max-width: 20rem;padding: 0;height:200px;top: 55%">'
        tmp += '<div class="card-header">지도</div>'
        tmp += '<div class="card-body">'
        tmp += '<h4 class="card-title"></h4>'
        tmp += '</div>'
        tmp += '</div>'

        tmp += '<!-- 채팅창-->'
        tmp += '<div class="card border-primary mb-3 wrapInfo" style="margin-top: 150px;max-width: 35rem;height:350px;padding: 0;top: 55%; left:35%">'
        tmp += '<div class="card-header">채팅창</div>'
        tmp += '<h4 class="card-title"></h4>'
        tmp += '</div>'
        return tmp + '</div>';
    }


    <%--let toHtmlModal = function (list) {--%>
    <%--    let tmp = "<ul>";--%>
    <%--    tmp += '<li class="list-group-item d-flex justify-content-between align-items-center list-group-item-danger">방장: ' + ${roomDto.writer} +'</li>'--%>
    <%--    for (const val in Object.keys(list)) {--%>
    <%--        tmp += '<li class="list-group-item d-flex justify-content-between align-items-center">'--%>
    <%--        tmp += list[val] + '<input class="form-check-input" type="checkbox" name="flexCheckChecked"  value="' + list[val] + '"> </li> ';--%>
    <%--    }--%>
    <%--    return tmp + '</ul>';--%>
    <%--}--%>

    let toHtmlMem = function (list) {
        let tmp = "<ul>";
        tmp += '<li class="list-group-item d-flex justify-content-between align-items-center list-group-item-danger">방장: ' + ${roomDto.writer} +'</li>'
        for (const val in Object.keys(list)) {
            tmp += '<li class="list-group-item d-flex justify-content-between align-items-center">'
            tmp += list[val] + '<input class="form-check-input" type="checkbox" name="flexCheckChecked"  value="' + list[val] + '"> </li> ';
        }
        return tmp + '</ul>';
    }

    let toHtmlListNum = function (room) {
        let tmp = '<li class="list-group-item d-flex justify-content-between align-items-center">'
        tmp += '<div id="totalUserNum">' + room.user_cnt + '</div>';
        tmp += ' / ' + room.user_limit
        return tmp + "</li> ";

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
