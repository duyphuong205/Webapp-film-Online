<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
						aria-selected="true"><i class="fa fa-video-plus"></i> Video Editing</a></li>
					<!--hiển thị thông tin các video ở trên bảng-->
					<li class="nav-item" role="presentation"><a class="nav-link"
						id="videoList-tab" data-toggle="tab" href="#videoList" role="tab"
						aria-controls="videoList" aria-selected="false"><i class="fa fa-video"></i> Video List</a></li>

				</ul>
				<!--hiển thị nội dung của các tab-->
				<div class="tab-content" id="myTabContent">
					<div class="tab-pane fade show active" id="videoEditing"
						role="tabpanel" aria-labelledby="videoEditing-tab">
						<form action="/ASM_JAVA4/VideomanagerServlet" method="post"
							enctype="multipart/form-data">
							<div class="card">
								<div class="card-body">
									<div class="row">
										<div class="col-3">
											<div class="border p-3">
<!-- 												<video width="250px" height="400px" controls> -->
<%-- 													<source src="/ASM_JAVA4/fileVideo/${videoEdit.poster}" type="video/mp4" class="img-fluid"> --%>
<!-- 												</video> -->
												<img src="/ASM_JAVA4/fileVideo/${videoEdit.poster}" alt="Hãy thêm hình ảnh" height="400px" width="100%"/>
												<!--chọn ảnh -->
												<div class="custom-file">
													<label for="image" class="custom-file-label">Image/Video</label>
													<input type="file" class="custom-file-input" id="image"
														name="poster" />
												</div>
											</div>
										</div>
										<div class="col-9">
											<div class="form-group">
												<label for="youtube"><i class="fab fa-youtube"></i> Youtube Id:</label> <input type="text"
													class="form-control" name="id" id="youtube"
													value="${videoEdit.id}" aria-describedby="youtubeId"
													placeholder="Youtube Id"> <small id="youtubeId"
													class="form-text text-muted">Nhap Youtube Id!!!</small>
											</div>
											<div class="form-group">
												<label for="videotitle"><i class="fa fa-signature"></i> Video Title:</label> <input
													type="text" class="form-control" name="title"
													id="videotitle" value="${videoEdit.title}"
													aria-describedby="videotitleId" placeholder="Video Title">
												<small id="videotitleId" class="form-text text-muted">Nhap
													Video Title!!!</small>
											</div>
											<div class="form-group">
												<label for="viewcount"><i class="fa fa-eye"></i> View Count:</label> <input type="text"
													class="form-control" name="views" id="viewcount"
													value="${videoEdit.views}" aria-describedby="viewcountId"
													placeholder="View Count"> <small id="viewcountId"
													class="form-text text-muted">Nhap View Count!!!</small>
											</div>
											<div class="form-check form-check-inline">
												<label class="ml-2"> <input type="radio" id="status"
													name="active" value="true" class="form-check-input"
													${videoEdit.active?'checked':''}>Active
												</label> <label class="ml-2"> <input type="radio"
													id="status" name="active" value="false"
													class="form-check-input" ${!videoEdit.active?'checked':''}>InActive
												</label>
											</div>
											<div class="form-group">
												<label for="description"><i class="fa fa-file-contract"></i> Description:</label> <input
													type="text" class="form-control" name="description"
													id="description" value="${videoEdit.description}" aria-describedby="descriptionId"
													placeholder="description"> <small
													id="descriptionId" class="form-text text-muted">Nhap
													Description!!!</small>
											</div>
										</div>
									</div>
								</div>
								<div class="card-footer text-muted bg-white" >
									<button formaction="/ASM_JAVA4/VideomanagerServlet/create"
										class="btn btn-primary">CREATE</button>
									<button formaction="/ASM_JAVA4/VideomanagerServlet/update"
										class="btn btn-success">UPDATE</button>
									<button formaction="/ASM_JAVA4/VideomanagerServlet/delete"
										class="btn btn-danger">DELETE</button>
									<button formaction="/ASM_JAVA4/VideomanagerServlet"
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
								<table class="table table-hover table-bordered">
									<tr class="bg-primary text-white">
										<td class="text-center"><i class="fa fa-sort-numeric-up"></i> No</td>
										<td class="text-center"><i class="fab fa-youtube"></i> Youtube Id</td>
										<td class="text-center"><i class="fa fa-signature"></i> Video Title</td>
										<td class="text-center"><i class="fa fa-eye"></i> View Count</td>
										<td class="text-center"><i class="fa fa-chart-line"></i> Status</td>
										<td class="text-center" colspan="2">&nbsp;</td>
									</tr>
									<c:set var="count" value="0"></c:set>
									<c:forEach var="item" items="${videoList}">
										<c:set var="count" value="${count+1}"></c:set>
										<tr class="text-table">
											<td class="text-center">${count}</td>
											<td class="text-center">${item.id}</td>
											<td class="text-center">${item.title}</td>
											<td class="text-center">${item.views}</td>
											<td class="text-center">${item.active?'Yes':'No'}</td>
											<td class="text-center boxedit"><a
												href="/ASM_JAVA4/VideomanagerServlet/edit?id=${item.id}"><i
													class="fa fa-edit"></i></a></td>
											<td class="text-center boxdelete"><a
												href="/ASM_JAVA4/VideomanagerServlet/delete?id=${item.id}"><i
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