<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ page session="true" %>
<c:set var="loginId"
       value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('id')}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? 'Login' : 'Logout'}"/>

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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>

    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic"
          rel="stylesheet" type="text/css"/>
    <!-- SimpleLightbox plugin CSS-->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.css" rel="stylesheet"/>


    <link rel="stylesheet" type="text/css" href="<c:url value="/css/stylesmaintest.css"/>">

    <style>
        ul > li {
            display: table-row-group;
            color: black;
        }
    </style>

</head>
<body id="page-top">

<!-- Header -->
<header id="header">
    <div class="logo container">
        <div>
            <h1><a href="<c:url value='/'/>">With Us</a></h1>
        </div>
    </div>
</header>



<!-- Nav -->
<nav id="nav">
    <ul >
        <li ><a href="<c:url value='/'/>">홈</a></li>
        <li><a href="<c:url value='/room/in-mem'/>">방 입장</a></li>
        <li class="current"><a href="<c:url value='/room/find'/>">방 찾기</a></li>
        <li><a href="<c:url value='/room/make'/>">방 생성</a></li>
        <li><a href="<c:url value='/room/list'/>">나의 방</a></li>



        <div id="userInformation"></div>
        <!-- 로그인-->
        <a href="<c:url value='${loginOutLink}'/>">
            <button type="button" class="btn btn-outline-danger loginBtn">${loginOut}</button></a>
        <a href="<c:url value='/register/add'/>">
            <button type="button" class="btn btn-outline-danger loginBtn">회원가입</button>
        </a>


    </ul>

</nav>

<!-- Section-->
<section id="main" style="background: #f4f4f4;;">
    <div id="category-icon">
        <ul>
            <li class="categoryBtn active">
                <div class="icon solid fa-globe cate-small"><span>전체</span></div>
            </li>
            <li class="categoryBtn">
                <div class="icon solid fa-book-reader cate-small"><span>공부</span></div>
            </li>
            <li class="categoryBtn">
                <div class="icon solid fa-utensils cate-small"><span>식사</span></div>
            </li>
            <li class="categoryBtn">
                <div class="icon solid fa-dumbbell cate-small "><span>운동</span></div>
            </li>
            <li class="categoryBtn">
                <div class="icon solid fa-passport cate-small "><span>여행</span></div>
            </li>
            <li class="categoryBtn">
                <div class="icon solid fa-dollar-sign cate-small "><span>거래</span></div>
            </li>
            <li class="categoryBtn" style="padding-right:5%;">
                <div class="icon solid fa-cog cate-small "><span>기타</span></div>
            </li>


        </ul>
    </div>
    <section id="menu" class="menu section-bg">
        <div class="container " data-aos="fade-up">
            <article class="post-find-in">
                    <%--        키워드로 제목 검색--%>
                    <div class="search d-flex" style="padding: 15px 0; margin-bottom: 0px;">

                        <select id="search-option" style="margin-right: 0.5rem !important;" name="option">
                            <option value="T" selected> 제목</option>
                            <option value="C">작성자</option>
                        </select>
                        <input type="text" id="search-input" class="form-search-control" placeholder="Keyword...!"
                               value=''>
                        <button id="searchBtn" class="btn btn-secondary my-2 my-sm-0">선택</button>


                    </div>
                    <div id="roomList" style="padding: 20px;border-top: solid 1px rgba(160, 160, 160, 0.3);">
                    </div>        <!-- 방 정보를 가져와서 집어넣을 예정이다-->

                    <div>
                        <ul class="pagination pagination-lg page-style">
                            <li class="page-item">
                                <button class="page-link" href="#">&laquo;</button>
                            </li>
                            <li class="page-item active">
                                <button class="page-link" value="1">1</button>
                            </li>
                            <li class="page-item ">
                                <button class="page-link" value="2">2</button>
                            </li>
                            <li class="page-item">
                                <button class="page-link" value="3">3</button>
                            </li>
                            <li class="page-item">
                                <button class="page-link" value="4">4</button>
                            </li>
                            <li class="page-item">
                                <button class="page-link" value="5">5</button>
                            </li>
                            <li class="page-item">
                                <button class="page-link" value="6">6</button>
                            </li>
                            <li class="page-item">
                                <button class="page-link" href="#">&raquo;</button>
                            </li>
                        </ul>
                    </div>
            </article>
        </div>
    </section>
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

        let maincate = "${maintocate}";     // main 페이지에서 카테고리를 눌렀을 때만 존재
        let page = 1;
        if (maincate == "") {
            $.ajax({
                type: 'GET',       // 요청 메서드
                url: '/CtProj/rooms/list?page=' + page,  // 요청 URI
                success: function (result) {
                    $("#roomList").html(toHtml(result));    // 서버로부터 응답이 도착하면 호출될 함수

                },
                error: function () {
                    alert("error")
                } // 에러가 발생했을 때, 호출될 함수
            }); // $.ajax()

        } else {
            $.ajax({
                type: 'GET',       // 요청 메서드
                url: '/CtProj/rooms-category?category=' + maincate,  // 요청 URI

                success: function (result) {
                    console.log(maincate);
                    $(".categoryBtn").removeClass("active");
                    $(".categoryBtn").each(function () {
                        console.log($(this).children().children().text())
                        if ($(this).children().children().text() == maincate) {
                            $(this).addClass("active");
                        }
                    });
                    console.log(result)

                    $("#roomList").html(toHtml(result));    // 서버로부터 응답이 도착하면 호출될 함수
                },
                error: function () {

                } // 에러가 발생했을 때, 호출될 함수
            }); // $.ajax()
        }

    }

    $(document).ready(function () {
        showList();

        $(".page-link").on("click", function () {
            let page = $(this).val();
            $.ajax({
                type: 'GET',       // 요청 메서드
                url: '/CtProj/rooms/list?page=' + page,  // 요청 URI
                success: function (result) {
                    $("#roomList").html(toHtml(result));    // 서버로부터 응답이 도착하면 호출될 함수

                },
                error: function () {
                    alert("error")
                } // 에러가 발생했을 때, 호출될 함수
            }); // $.ajax()
        })

        $("#roomList").on("click", ".delBtn", function () {
            let bno = $(this).parent().attr("data-bno");

            $.ajax({
                type: 'DELETE',       // 요청 메서드
                url: '/CtProj/enter/' + bno,  // 요청 URI
                success: function (result) {
                    alert(result);
                    showList();          // 삭제된 이후에 목록에 다시 갱신해주며 보여주기
                },
                error: function () {
                    alert("실패하였습니다.")
                } // 에러가 발생했을 때, 호출될 함수
            }); // $.ajax()
        });

        $("#roomList").on("click", ".entBtn", function () {
            let bno = $(this).parent().attr("data-bno");
            let id = null;
            console.log(bno)
            if (confirm("입장하시겠습니까?")) {
                $.ajax({
                    type: 'POST',       // 요청 메서드
                    url: '/CtProj/enter/',  // 요청 URI
                    headers: {"content-type": "application/json"}, // 요청 헤더
                    data: JSON.stringify({
                        user_id: id,
                        room_bno: bno

                    }),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
                    success: function (result) {
                        alert("입장 완료했습니다.");
                        showList();
                    },
                    error: function () {
                        alert("입장에 실패했습니다..!")
                    } // 에러가 발생했을 때, 호출될 함수
                }); // $.ajax()
            }


        });

        $(".categoryBtn").on("click", function () {
            let categoryOption = $(this).children().children().text();
            console.log(categoryOption)

            if (categoryOption == "전체") {
                $.ajax({
                    type: 'GET',       // 요청 메서드
                    url: '/CtProj/rooms',  // 요청 URI
                    success: function (result) {
                        $("#roomList").html(toHtml(result));    // 서버로부터 응답이 도착하면 호출될 함수
                        console.log(result)
                    },
                    error: function () {
                        alert("error")
                    } // 에러가 발생했을 때, 호출될 함수
                }); // $.ajax()
            } else {
                $.ajax({
                    type: 'GET',       // 요청 메서드
                    url: '/CtProj/rooms-category?category=' + categoryOption,  // 요청 URI
                    success: function (result) {
                        $("#roomList").html(toHtml(result));    // 서버로부터 응답이 도착하면 호출될 함수
                    },
                    error: function () {

                    } // 에러가 발생했을 때, 호출될 함수
                }); // $.ajax()
            }


        });

        $("#searchBtn").on("click", function () {
            let option = $('#search-option').val();
            let keyword = $('#search-input').val();
            let category = $('.categoryBtn.active').children().children().text();
            $.ajax({
                type: 'GET',
                url: '/CtProj/rooms-search?keyword=' + keyword + '&option=' + option + '&category=' + category,
                success: function (result) {
                    $("#roomList").html(toHtml(result));    // 서버로부터 응답이 도착하면 호출될 함수
                },
                error: function () {

                } // 에러가 발생했을 때, 호출될 함수
            })

        });


    });



    let toUserHtml = function (userInfo) {
        let tmp = '<div>'
        tmp +=  userInfo.nickname + '    Coin: <tab>'
        tmp +=  userInfo.coin +  '    Lv:    '
        tmp +=  Math.floor(userInfo.level)


        return tmp + '</div>';
    }


    let toHtml = function (rooms) {

        let tmp = ' <section id="courses" class="courses">'
        tmp += ' <div class="row" data-aos="zoom-in" data-aos-delay="100" style="margin-left:0px" >'
        console.log(rooms[0].nickname);
        console.log(rooms[0].meet_Date);

        rooms.forEach(function (room) {
            const dateFormat = new Date(room.meet_Date);
            const meet_date_format = dateFormat.getTime()
            const meet_date = dateFormat.getFullYear() + '년 ' + (dateFormat.getMonth() + 1) + '월 ' + dateFormat.getDate() + '일' + dateFormat.getHours() + '시 ' + dateFormat.getMinutes() + '분';
            tmp += ' <div class="d-flex align-items-stretch">'
            tmp += '    <div class="course-item">'
            tmp += '      <img class="img-fluid" src="${pageContext.request.contextPath}' + room.filepath + '" alt="대체" />'
            tmp += '           <div class="course-content">'
            tmp += '<div class="d-flex justify-content-between align-items-center mb-3">'
            tmp += '   <h4>' + room.category + '</h4>'
            tmp += '             <p class="price">' + room.user_cnt + '/' + room.user_limit + '</p>'
            tmp += '  </div>'
            tmp += '  <h3 style="padding-top:15px">' + room.title + '</h3>'
            tmp += '  장소: ' + room.meet_place + '</br>'
            tmp += ' 시간: ' + meet_date + '</br>'
            tmp += '    공지사항:' + room.notice + '</br>'
            tmp += '     <div class="trainer d-flex justify-content-between align-items-center">'
            tmp += '     <div class="trainer-profile d-flex align-items-center">'
            tmp += ' <span>' + room.nickname + '</span>'
            tmp += ' <span>Lv'+Math.floor(room.wri_level)+'</span>'
            tmp += ' </div>'
            tmp += '<div class="trainer-rank d-flex align-items-center"  data-bno=' + room.bno + '>'
            tmp += '<button type="button" class="btn btn-outline-danger btn-myroom entBtn" style="width: 120px;height:50px;font-size:17px">입장</button>'

            tmp += '</div></div></div></div></div> <!-- End Course Item-->'


        })
        tmp += '</div>'

        return tmp + "</section>";

    }

    $(".page-item").on("click", function (e) {
        let pastActive = $(e.target).closest('li');
        pastActive.siblings('li').removeClass("active");
        pastActive.addClass("active");

    });

    $(".categoryBtn").on("click", function (e) {
        let pastActive = $(e.target).closest('li');
        pastActive.siblings('li').removeClass("active");
        pastActive.addClass("active");

    });



</script>
<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
<!-- * *                               SB Forms JS                               * *-->
<!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
<script src="<c:url value="https://cdn.startbootstrap.com/sb-forms-latest.js"/>"></script>
<!-- Scripts -->

</body>
</html>
