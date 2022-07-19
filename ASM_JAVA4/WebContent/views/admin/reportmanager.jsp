<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="en">

<head>
<title>Title</title>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css">
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

.navbar {
	background-image: linear-gradient(to left bottom, #800080, #4169E1);
}

ul.navbar-nav>li>a {
	color: orangered;
	font-size: 17px;
	font-weight: bold;
	text-shadow: 2px 2px 4px black;
}

ul.navbar-nav>li>a:hover {
	color: yellow;
}
.text-table {
	font-weight: bold;
}
</style>
</head>

<body>
	<div class="container-fuild">
		<nav class="row">
			<nav class="navbar navbar-expand-sm col-md-12 ">
				<a class="navbar-brand" href="#"><img src="./image/logo.png"
					alt=""></a>
				<button class="navbar-toggler d-lg-none" type="button"
					data-toggle="collapse" data-target="#collapsibleNavId"
					aria-controls="collapsibleNavId" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="collapsibleNavId">
					<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
						<li class="nav-item active"><a class="nav-link" href="/ASM_JAVA4/HomeServlet/index"><i
								class="fa fa-home"></i> Trang Chu <span class="sr-only">(current)</span></a>
						</li>
						<li class="nav-item"><a class="nav-link" href="/ASM_JAVA4/VideomanagerServlet"><i
								class="fa fa-video"></i> Videos</a></li>
						<li class="nav-item"><a class="nav-link" href="/ASM_JAVA4//UsermanagerServlet"><i
								class="fa fa-users"></i> Users</a></li>
						<li class="nav-item"><a class="nav-link" href="/ASM_JAVA4/ReportmanagerServlet"><i
								class="fa fa-flag"></i> Reports</a></li>
					</ul>
				</div>
			</nav>
		</nav>
		<section class="row">
			<div class="col">
				<!-- để thực hiện đổi tab để hiển thị nội dung thì cần đến script #mytab -->
				<ul class="nav nav-tabs" id="myTab" role="tablist">
					<!--hiển thị thông tin các video lên trên form-->
					<li class="nav-item" role="presentation"><a
						class="nav-link active" id="videoEditing-tab" data-toggle="tab"
						href="#favorite" role="tab" aria-controls="videoEditing"
						aria-selected="true"><i class="fa fa-heart"></i> Favorites</a></li>
					<!--hiển thị thông tin các video ở trên bảng-->
					<li class="nav-item" role="presentation"><a class="nav-link"
						id="videoList-tab" data-toggle="tab" href="#favoriteUser" role="tab"
						aria-controls="videoList" aria-selected="false"><i class="fa fa-users"></i> Favorite Users</a></li>
						<li class="nav-item" role="presentation"><a class="nav-link"
						id="videoList-tab" data-toggle="tab" href="#shareFriend" role="tab"
						aria-controls="videoList" aria-selected="false"><i class="fa fa-users"></i> Shared Friends</a></li>
				</ul>
				<!--hiển thị nội dung của các tab-->
				<div class="tab-content" id="myTabContent">
					<div class="tab-pane fade show active" id="favorite"
						role="tabpanel" aria-labelledby="videoEditing-tab">
						<table class="table table-bordered table-hover mt-3">
							<tr class="bg-primary text-white">
							    <td class="text-center"><i class="fa fa-sort-numeric-down"></i> No</td>
								<td class="text-center"><i class="fa fa-file-signature"></i> Video Title</td>
								<td class="text-center"><i class="fa fa-heart"></i> Favorites Count</td>
								<td class="text-center"><i class="fa fa-calendar-alt"></i> Newest Date</td>
								<td class="text-center"><i class="fa fa-calendar-alt"></i> Oldest Date</td>
							</tr>
							<c:set var="count" value="0"></c:set>
							<c:forEach var="item" items="${favoritesCount}">
							<c:set var="count" value="${count+1}"></c:set>
								<tr class="text-table">
								    <td class="text-center">${count}</td>
									<td class="text-center">${item.videoTitle}</td>
									<td class="text-center">${item.countLike}</td>
									<td class="text-center"><fmt:formatDate value="${item.newest}" pattern="dd-MM-yyyy"/></td>
									<td class="text-center"><fmt:formatDate value="${item.oldest}" pattern="dd-MM-yyyy"/></td>
								</tr>
							</c:forEach>
						</table>
					</div>
					<div class="tab-pane fade" id="favoriteUser" role="tabpanel"
						aria-labelledby="videoList-tab">
						<form action="" method="post">
							<div class="row mt-3">
								<div class="col">
									<!--hiển thị form(combobox)-->
									<div class="form-inline">
										<div class="form-group">
											<label class="ml-4">Video Title <select name="videoID"
												id="videoID" class="form-control ml-3">
													<c:forEach var="item" items="${videoList}">
														<option value="${item.id}" ${item.id == videoID?'selected':''}>${item.title}</option>
													</c:forEach>
											</select>
											</label>
											<button class="btn btn-secondary ml-3">Report</button>
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col mt-3">
									<table class="table table-bordered">
										<tr class="bg-primary text-white">
										    <td class="text-center"><i class="fa fa-sort-numeric-down"></i> No</td>
											<td class="text-center"><i class="fa fa-id-badge"></i> UserName</td>
											<td class="text-center"><i class="fa fa-users"></i> FullName</td>
											<td class="text-center"><i class="fa fa-envelope"></i> Email</td>
											<td class="text-center"><i class="fa fa-calendar-alt"></i> LikeDate</td>
										</tr>
										<c:set var="count" value="0"></c:set>
										<c:forEach var="item" items="${favoriteUser}">
										<c:set var="count" value="${count+1}"></c:set>
											<tr class="text-table">
											    <td class="text-center">${count}</td>
												<td class="text-center">${item.id}</td>
												<td class="text-center">${item.fullname}</td>
												<td class="text-center">${item.email}</td>
												<td class="text-center"><fmt:formatDate value="${item.favoriteDate}" pattern="dd-MM-yyyy"/> </td>
											</tr>
										</c:forEach>
									</table>
								</div>
							</div>
						</form>
					</div>
					<div class="tab-pane fade" id="shareFriend" role="tabpanel"
						aria-labelledby="videoList-tab">
						<form action="" method="post">
							<div class="row mt-3">
								<div class="col">
									<!--hiển thị form(combobox)-->
									<div class="form-inline">
										<div class="form-group">
											<label class="ml-4">Video Title <select name="videoID"
												id="videoID" class="form-control ml-3">
													<c:forEach var="item" items="${videoList}">
														<option value="${item.id}" ${item.id == videoID?'selected':''}>${item.title}</option>
													</c:forEach>
											</select>
											</label>
											<button class="btn btn-secondary ml-3">Report</button>
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col mt-3">
									<table class="table table-bordered">
										<tr class="bg-primary text-white">
										    <td class="text-center"><i class="fa fa-sort-numeric-down"></i> No</td>
											<td class="text-center"><i class="fa fa-id-badge"></i> Sender Name</td>
											<td class="text-center"><i class="fa fa-envelope"></i> Sender Email</td>
											<td class="text-center"><i class="fa fa-envelope"></i> Receiver Email</td>
											<td class="text-center"><i class="fa fa-calendar-alt"></i> Sent Date</td>
										</tr>
										<c:set var="count" value="0"></c:set>
										<c:forEach var="item" items="${shareFriends}">
										<c:set var="count" value="${count+1}"></c:set>
											<tr class="text-table">
											    <td class="text-center">${count}</td>
												<td class="text-center">${item.senderName}</td>
												<td class="text-center">${item.senderEmail}</td>
												<td class="text-center">${item.receiverEmail}</td>
												<td class="text-center"><fmt:formatDate value="${item.sendDate}" pattern="dd-MM-yyyy"/></td>
											</tr>
										</c:forEach>
									</table>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</section>
	</div>
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous">
		
	</script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous">
		
	</script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous">
		
	</script>
</body>

</html>