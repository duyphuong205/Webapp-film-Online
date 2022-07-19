<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="en">
<head>
<title>Title</title>
<!-- Required meta tags -->
<meta charset="utf-8">
<link rel="stylesheet" href="./css/index.css">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
<link rel="stylesheet" href="views/css/index.css">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<style>
.navbar-brand>img {
	padding-left: 10px;
	width: 65px;
}

.carousel-inner img {
	width: 100%;
	height: 800px;
}

.card>.card-body>img {
	width: 100%;
}

/* p { */
/* 	padding-top: 15px; */
/* 	color: yellow; */
/* 	font-size: 20px; */
/* 	font-weight: bold; */
/* } */



.container-fuild {
	background-color: white;
}

.row>.col-md-3>.card>.card-footer>.btn>i {
	font-size: 30px;
	color: black;
}

.row>.col-md-3>.card>.card-footer>.btn>i.unlike {
	font-size: 30px;
	color: red;
}

.row>.col-md-3>.card>.card-footer>.btn>i.unlike:hover {
	font-size: 31px;
	color: black;
	transition: all .2s ease-in;
}

.row>.col-md-3>.card>.card-footer>.btn>i.like:hover {
	font-size: 31px;
	color: red;
	transition: all .2s ease-in;
}


.row>.col-md-3>.card>.card-footer>h5 {
	font-family: Impact, Haettenschweiler, 'Arial Narrow Bold', sans-serif;
	color: black;
	letter-spacing: 1px;
	transition: all .2s ease-in;
}

.row>.col-md-3>.card>.card-footer>.btn>i.shares:hover {
	font-size: 31px;
	color: rgb(0, 132, 255);
	transition: all .2s ease-in;
}

ul.navbar-nav>li>a {
	color:black;
	font-weight:bold;
	font-size:20px;
}

ul.navbar-nav>li>a:hover {
	color: green;
}

.movie {
	background-color: black;
	border-radius: 20px;
	color: white;
}

.movie:hover {
	background-color: white;
	color: black;
}

.navbar {
	background-color: white;
}
</style>
</head>
<body>
	<div class="container-fuild">
		<nav class="row">
			<nav class="navbar navbar-expand-sm col-md-12 fixed-top">
				<a class="navbar-brand" href="#"><img src="views/image/logo.png"
					alt=""></a>
				<button class="navbar-toggler d-lg-none" type="button"
					data-toggle="collapse" data-target="#collapsibleNavId"
					aria-controls="collapsibleNavId" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<fmt:setLocale value="${sessionScope.lang}" scope="request" />
				<fmt:setBundle basename="edu.i18n.global" scope="request" />

				<div class="collapse navbar-collapse" id="collapsibleNavId">
					<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
						<li class="nav-item active"><a class="nav-link"
							href="/ASM_JAVA4/HomeServlet/index"><i class="fa fa-home"></i>
								<fmt:message key="menu.home" /> <span class="sr-only">(current)</span></a>
						</li>
						<c:if test="${sessionScope.user.admin}">
							<li class="nav-item"><a class="nav-link"
								href="/ASM_JAVA4/UsermanagerServlet"><i class="fa fa-tasks"></i>
									<fmt:message key="menu.management" /></a></li>
						</c:if>
						<li class="nav-item"><a class="nav-link"
							href="/ASM_JAVA4/HomeServlet/address"><i
								class="fa fa-info-circle"></i> <fmt:message key="menu.address" /></a>
						</li>
						<li class="nav-item"><a class="nav-link"
							href="/ASM_JAVA4/HomeServlet/favorite"><i class="fa fa-heart"></i>
								<fmt:message key="menu.favorite" /></a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="dropdownId"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i
								class="fa fa-list-alt"></i> <fmt:message key="menu.genre" /></a>
							<div class="dropdown-menu" aria-labelledby="dropdownId">
								<a class="dropdown-item" href="#">Hanh Dong</a> <a
									class="dropdown-item" href="#">Tinh Cam</a> <a
									class="dropdown-item" href="#">Gia Dinh</a> <a
									class="dropdown-item" href="#">Tai Lieu</a>
							</div></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="dropdownId"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i
								class="fa fa-globe-americas"></i> <fmt:message
									key="menu.language" /></a>
							<div class="dropdown-menu" aria-labelledby="dropdownId">
								<a class="dropdown-item" href="?lang=vi"><img
									src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/21/Flag_of_Vietnam.svg/2000px-Flag_of_Vietnam.svg.png"
									style="height: 18px; width: 30px;"> VIETNAMESE</a> <a
									class="dropdown-item" href="?lang=en"><img
									src="https://cdn.pixabay.com/photo/2013/07/13/12/03/flag-159070_1280.png"
									style="height: 18px; width: 30px;" /> ENGLISH</a>
							</div></li>
					</ul>
				</div>
				<ul class="navbar-nav" style="padding-right: 100px;">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="dropdownId"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i
							class="fa fa-user-circle"></i> <fmt:message key="menu.account" /></a>
						<div class="dropdown-menu" aria-labelledby="dropdownId">
							<a class="dropdown-item" href="#"
								style="color: red; font-weight: bold;"><fmt:message
									key="menu.hello" /> ${sessionScope.user.fullname}!</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="/ASM_JAVA4/LoginServlet"><i
								class="fa fa-sign-in"></i> <fmt:message key="menu.signin" /></a> <a
								class="dropdown-item" href="/ASM_JAVA4/account/signup"><i
								class="fa fa-user-plus"></i> <fmt:message key="menu.signup" /></a> <a
								class="dropdown-item" href="/ASM_JAVA4/account/signout"><i
								class="fa fa-sign-out-alt"></i> <fmt:message key="menu.signout" /></a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item"
								href="/ASM_JAVA4//HomeServlet/changepassword"><i
								class="fa fa-key"></i> <fmt:message key="menu.changepassword" /></a>
							<a class="dropdown-item"
								href="/ASM_JAVA4/HomeServlet/editprofile"><i
								class="fa fa-user-edit"></i> <fmt:message key="menu.editprofile" /></a>
							<a class="dropdown-item" href="/ASM_JAVA4/account/forgotpassword"><i
								class="fa fa-lock-alt"></i> <fmt:message
									key="menu.forgotpassword" /></a>
						</div></li>
				</ul>
			</nav>
		</nav>

		<div id="carouselId" class="carousel slide " data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#carouselId" data-slide-to="0" class="active"></li>
				<li data-target="#carouselId" data-slide-to="1"></li>
				<li data-target="#carouselId" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner" role="listbox">
				<div class="carousel-item active">
					<img src="/ASM_JAVA4/views/image/film3.png" alt="First slide">
				</div>
				<div class="carousel-item">
					<img src="/ASM_JAVA4/views/image/film1.jpg" alt="Second slide">
				</div>
				<div class="carousel-item">
					<img src="/ASM_JAVA4/views/image/film2.jpg" alt="Third slide">
				</div>
			</div>
			<a class="carousel-control-prev" href="#carouselId" role="button"
				data-slide="prev"> <span class="carousel-control-prev-icon"
				aria-hidden="true"></span> <span class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselId" role="button"
				data-slide="next"> <span class="carousel-control-next-icon"
				aria-hidden="true"></span> <span class="sr-only">Next</span>
			</a>
		</div>
<!-- 		<div class="col-md-12 bg-dark" id="chuchay"> -->
<!-- 			<form> -->
<!-- 				<marquee> -->
<%-- 					<c:if test="${sessionScope.user.admin == false}"> --%>
<!-- 						<p> -->
<!-- 							CHÚC BẠN XEM PHIM VUI VẺ.<b>MỌI THÔNG TIN CHI TIẾT XIN LIÊN -->
<!-- 								HỆ HOTLINE:0392292432</b> -->
<!-- 						</p> -->
<%-- 					</c:if> --%>
<%-- 					<c:if test="${sessionScope.user.admin == true}"> --%>
<!-- 						<p>SỐ LƯỢNG KHÁCH HÀNG ĐÃ TRUY CẬP TRANG WEB: -->
<%-- 							${applicationScope.visitors}</p> --%>
<%-- 					</c:if> --%>
<!-- 				</marquee> -->
<!-- 			</form> -->
<!-- 		</div> -->
		<section class="container">
			<jsp:include page="${view}" />
		</section>
		
		<footer class="row">
			 <footer class="text-center text-lg-start bg-white text-muted w-100">
                <!-- Section: Social media -->
                <section class="d-flex justify-content-center justify-content-lg-between p-4 border-bottom">
                    <!-- Left -->

                    <!-- Left -->

                    <!-- Right -->
                    <div>
                        <a href="" class="me-4 text-reset">
                            <i class="fab fa-facebook-f"></i>
                        </a>
                        <a href="" class="me-4 text-reset">
                            <i class="fab fa-twitter"></i>
                        </a>
                        <a href="" class="me-4 text-reset">
                            <i class="fab fa-google"></i>
                        </a>
                        <a href="" class="me-4 text-reset">
                            <i class="fab fa-instagram"></i>
                        </a>
                        <a href="" class="me-4 text-reset">
                            <i class="fab fa-linkedin"></i>
                        </a>
                        <a href="" class="me-4 text-reset">
                            <i class="fab fa-github"></i>
                        </a>
                    </div>
                    <!-- Right -->
                </section>
                <!-- Section: Social media -->

                <!-- Section: Links  -->
                <section class="">
                    <div class="container text-center text-md-start mt-5">
                        <!-- Grid row -->
                        <div class="row mt-3">
                            <!-- Grid column -->
                            <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
                                <!-- Content -->
                                <h6 class="text-uppercase fw-bold mb-4">
                                    <i class="fas fa-gem me-3"></i>Company name
                                </h6>
                                <p>
                                    Here you can use rows and columns to organize your footer content. Lorem ipsum
                                    dolor sit amet, consectetur adipisicing elit.
                                </p>
                            </div>
                            <!-- Grid column -->

                            <!-- Grid column -->
                            <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
                                <!-- Links -->
                                <h6 class="text-uppercase fw-bold mb-4">
                                    Products
                                </h6>
                                <p>
                                    <a href="#!" class="text-reset">Angular</a>
                                </p>
                                <p>
                                    <a href="#!" class="text-reset">React</a>
                                </p>
                                <p>
                                    <a href="#!" class="text-reset">Vue</a>
                                </p>
                                <p>
                                    <a href="#!" class="text-reset">Laravel</a>
                                </p>
                            </div>
                            <!-- Grid column -->

                            <!-- Grid column -->
                            <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
                                <!-- Links -->
                                <h6 class="text-uppercase fw-bold mb-4">
                                    Useful links
                                </h6>
                                <p>
                                    <a href="#!" class="text-reset">Pricing</a>
                                </p>
                                <p>
                                    <a href="#!" class="text-reset">Settings</a>
                                </p>
                                <p>
                                    <a href="#!" class="text-reset">Orders</a>
                                </p>
                                <p>
                                    <a href="#!" class="text-reset">Help</a>
                                </p>
                            </div>
                            <!-- Grid column -->

                            <!-- Grid column -->
                            <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
                                <!-- Links -->
                                <h6 class="text-uppercase fw-bold mb-4">
                                    Contact
                                </h6>
                                <p><i class="fas fa-home me-3"></i> New York, NY 10012, US</p>
                                <p>
                                    <i class="fas fa-envelope me-3"></i>
                                    info@example.com
                                </p>
                                <p><i class="fas fa-phone me-3"></i> + 01 234 567 88</p>
                                <p><i class="fas fa-print me-3"></i> + 01 234 567 89</p>
                            </div>
                            <!-- Grid column -->
                        </div>
                        <!-- Grid row -->
                    </div>
                </section>
                <!-- Section: Links  -->

                <!-- Copyright -->
                <div class="text-center p-4" style="background-color: rgba(0, 0, 0, 0.05);">
                    © 2021 Copyright:
                    <a class="text-reset fw-bold" href="https://mdbootstrap.com/">MDBootstrap.com</a>
                </div>
                <!-- Copyright -->
            </footer>
		</footer>
	</div>
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
</body>
</html>