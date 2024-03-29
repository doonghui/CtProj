<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
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
    <!-- ajax -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
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
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/stylesmaintest.css"/>">

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
        <li class="current"><a href="<c:url value='/'/>">홈</a></li>
        <li><a href="<c:url value='/room/in-mem'/>">방 입장</a></li>
        <li><a href="<c:url value='/room/find'/>">방 찾기</a></li>
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

<!-- Banner -->
<section id="banner">
    <div class="content">
        <h2>오늘 어디서 만날까?</h2>
        <p>삶 전체에 있어서 가장 참된 것은 만남이다. -마르틴 부버- </p>
        <a href="#main" class="button scrolly">카테고리 선택</a>
    </div>
</section>

<!-- Main -->
<section id="main">
    <div class="container">
        <div class="row gtr-200">
            <div class="col-12">
                                <!-- Highlight -->
                <section class="box highlight">
                    <ul class="special">
                        <li>
                            <form action="/CtProj/room/find/category" method="get" style="display: inline-block">
                                <input type="hidden" name="category" value="공부"/>
                                <button type="submit" style="background: transparent"><i
                                        class="icon solid fa-book-reader" style=""> </i></button>
                            </form>
                            <h3>공부</h3>
                        </li>
                        <li>
                            <form action="/CtProj/room/find/category" method="get" style="display: inline-block">
                                <input type="hidden" name="category" value="식사"/>
                                <button type="submit" style="background: transparent"><i class="icon solid fa-utensils"
                                                                                         style=""> </i></button>
                            </form>
                            <h3>식사</h3>
                        </li>
                        <li>
                            <form action="/CtProj/room/find/category" method="get" style="display: inline-block">
                                <input type="hidden" name="category" value="운동"/>
                                <button type="submit" style="background: transparent"><i class="icon solid fa-dumbbell"
                                                                                         style=""> </i></button>
                            </form>
                            <h3>운동</h3>
                        </li>
                        <li>
                            <form action="/CtProj/room/find/category" method="get" style="display: inline-block">
                                <input type="hidden" name="category" value="여행"/>
                                <button type="submit" style="background: transparent"><i class="icon solid fa-passport"
                                                                                         style=""> </i></button>
                            </form>
                            <h3>여행</h3>
                        </li>
                        <li>
                            <form action="/CtProj/room/find/category" method="get" style="display: inline-block">
                                <input type="hidden" name="category" value="거래"/>
                                <button type="submit" style="background: transparent"><i
                                        class="icon solid fa-dollar-sign" style=""> </i></button>
                            </form>
                            <h3>거래</h3>
                        </li>
                        <li>
                            <form action="/CtProj/room/find/category" method="get" style="display: inline-block">
                                <input type="hidden" name="category" value="기타"/>
                                <button type="submit" style="background: transparent"><i
                                        class="icon solid fa-cog" style=""> </i></button>
                            </form>
                            <h3>기타</h3>
                        </li>

                    </ul>
                </section>
            </div>
        </div>
    </div>
</section>



<!-- Footer-->
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
    let msg = "${msg}";
    if (msg == "WRT_OK") alert("방을 생성하였습니다.");
    else if (msg == "WRT_ERR")
        alert("방생성에 실패하였습니다.");
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


    }

    $(document).ready(function () {
        showList();


    });

    let toUserHtml = function (userInfo) {
        let tmp = '<div>'
        tmp +=  userInfo.nickname + '    Coin: <tab>'
        tmp +=  userInfo.coin +  '    Lv:    '
        tmp +=  Math.floor(userInfo.level)


        return tmp + '</div>';
    }

</script>
<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
<!-- * *                               SB Forms JS                               * *-->
<!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
<script src="<c:url value="https://cdn.startbootstrap.com/sb-forms-latest.js"/>"></script>
<!-- Scripts -->
<script src="<c:url value="/resources/assets/js/jquery.min.js"/>"></script>
<script src="<c:url value="/resources/assets/js/jquery.dropotron.min.js"/>"></script>
<script src="<c:url value="/resources/assets/js/jquery.scrolly.min.js"/>"></script>
<script src="<c:url value="/resources/assets/js/browser.min.js"/>"></script>
<script src="<c:url value="/resources/assets/js/breakpoints.min.js"/>"></script>
<script src="<c:url value="/resources/assets/js/util.js"/>"></script>
<script src="<c:url value="/resources/assets/js/main.js"/>"></script>



</body>
</html>



