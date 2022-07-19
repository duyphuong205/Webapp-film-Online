<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

.boxedit>a>i {
	color: #FFD700;
	font-size: 20px;
}

.boxdelete>a>i {
	color: red;
	font-size: 20px;
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
						href="#videoEditing" role="tab" aria-controls="videoEditing"
						aria-selected="true"><i class="fa fa-user-edit"></i> User Editing</a></li>
					<!--hiển thị thông tin các video ở trên bảng-->
					<li class="nav-item" role="presentation"><a class="nav-link"
						id="videoList-tab" data-toggle="tab" href="#videoList" role="tab"
						aria-controls="videoList" aria-selected="false"><i class="fa fa-users"></i> User List</a></li>

				</ul>
				<!--hiển thị nội dung của các tab-->
				<div class="tab-content" id="myTabContent">
					<div class="tab-pane fade show active" id="videoEditing"
						role="tabpanel" aria-labelledby="videoEditing-tab">
						<form action="/ASM_JAVA4/UsermanagerServlet" method="post">
							<div class="card">
								<div class="card-body">
									<div class="row">
										<div class="col">
											<div class="form-group">
												<label for="username"><i class="fa fa-user"></i> Username:</label> <input type="text"
													class="form-control" name="id" id="username"
													value="${userEdit.id}" aria-describedby="usernameId"
													placeholder="Username"> <small id="usernameId"
													class="form-text text-muted">Nhap Username!!!</small>
											</div>
											<div class="form-group">
												<label for="fullname"><i class="fa fa-signature"></i> Fullname:</label> <input type="text"
													class="form-control" name="fullname" id="fullname"
													value="${userEdit.fullname}" aria-describedby="fullnameId"
													placeholder="Fullname"> <small id="fullnameId"
													class="form-text text-muted">Nhap Fullname!!!</small>
											</div>
										</div>
										<div class="col">
											<div class="form-group">
												<label for="password"><i class="fa fa-key"></i> Password:</label> <input type="text"
													class="form-control" name="password" id="password"
													value="${userEdit.password}" aria-describedby="passwordId"
													placeholder="Password"> <small id="passwordId"
													class="form-text text-muted">Nhap Password!!!</small>
											</div>
											<div class="form-group">
												<label for="email"><i class="fa fa-at"></i> Email:</label> <input type="email"
													class="form-control" name="email" id="email"
													value="${userEdit.email}" aria-describedby="emailId"
													placeholder="Email"> <small id="emailId"
													class="form-text text-muted">Nhap Email!!!</small>
											</div>
										</div>
									</div>
								</div>
								<div class="card-footer text-muted bg-white">
									<button formaction="/ASM_JAVA4/UsermanagerServlet/create"
										class="btn btn-primary">CREATE</button>
									<button formaction="/ASM_JAVA4/UsermanagerServlet/update"
										class="btn btn-success">UPDATE</button>
									<button formaction="/ASM_JAVA4/UsermanagerServlet/delete"
										class="btn btn-danger">DELETE</button>
									<button formaction="/ASM_JAVA4/UsermanagerServlet"
										class="btn btn-warning">RESET</button>
								</div>
							</div>
							 <jsp:include page="/views/nocation/thongbao.jsp"></jsp:include>
						</form>
					</div>
					<div class="tab-pane fade" id="videoList" role="tabpanel"
						aria-labelledby="videoList-tab">
						<div class="row">
							<div class="col">
								<!-- table.table.table-stripe -->
								<table class="table table-stripe table-hover table-bordered">
									<tr class="bg-primary text-white">
										<td class="text-center"><i class="fa fa-sort-numeric-up"></i>
											No</td>
										<td class="text-center"><i class="fa fa-users"></i>
											Username</td>
										<td class="text-center"><i class="fa fa-lock-alt"></i>
											Password</td>
										<td class="text-center"><i class="fa fa-envelope"></i>
											Email</td>
										<td class="text-center"><i class="fa fa-signature"></i>
											Fullname</td>
										<td class="text-center"><i class="fad fa-user-shield"></i> Role</td>
										<td class="text-center" colspan="2">&nbsp;</td>
									</tr>
									<c:set var="count" value="0"></c:set>
									<c:forEach var="item" items="${userList}">
										<c:set var="count" value="${count+1}"></c:set>
										<tr class="text-table">
											<td class="text-center">${count}</td>
											<td class="text-center">${item.id}</td>
											<td class="text-center">${item.password}</td>
											<td class="text-center">${item.email}</td>
											<td class="text-center">${item.fullname}</td>
											<td class="text-center">${item.admin?'Admin':'User'}</td>
											<td class="text-center boxedit"><a
												href="/ASM_JAVA4/UsermanagerServlet/edit?id=${item.id}"><i
													class="fa fa-edit"></i></a></td>
											<td class="text-center boxdelete"><a
												href="/ASM_JAVA4/UsermanagerServlet/delete?id=${item.id}"><i
													class="fa fa-trash"></i></a></td>
										</tr>
									</c:forEach>
								</table>
							</div>
						</div>
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