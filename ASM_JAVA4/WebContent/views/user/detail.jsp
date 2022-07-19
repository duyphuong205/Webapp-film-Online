<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
.card-header>.btn>i {
	font-size: 30px;
	color: black;
}

.card-header>.btn>i.unlike {
	font-size: 30px;
	color: red;
}

.card-header>.btn>i.like:hover {
	font-size: 31px;
	color: red;
	transition: all .2s ease-in;
}

.card-header>.btn>i.unlike:hover {
	font-size: 31px;
	color: black;
	transition: all .2s ease-in;
}

.card-header>.btn>i.shares:hover {
	font-size: 31px;
	color: rgb(0, 132, 255);
	transition: all .2s ease-in;
}

.box {
	background-color: black;
}

b {
	color: #FF4500;
	padding-left: 20px;
	font-size: 20px;
	font-variant: inherit;
}

.col-md-7>h3 {
	color: white;
}
</style>
<div class="row">
	<div class="col-md-8 offset-md-2">
		<div class="card mt-3 ">
			<img src="/ASM_JAVA4/fileVideo/${item.poster}" alt="" width="100%"
				height="700px">
			<div class="card-header text-center bg-white">
				<h3>${item.title}</h3>
				<a href="/ASM_JAVA4/VideoFavorite/like?videoID=${item.id}"
					class="btn btn-default"> <c:if
						test="${item.favorites == null || item.favorites.size() ==0}">
						<i class="fa fa-heart mr-5 like"></i>
					</c:if> <c:if test="${item.favorites != null && item.favorites.size() >0}">
						<i class="fa fa-heart mr-5 unlike"></i>
					</c:if>
				</a> <a href="/ASM_JAVA4/HomeServlet/sendmail?videoID=${item.id}"
					class="btn btn-default"><i
					class="fa fa-share-alt-square ml-5 shares"></i></a>
			</div>
			<div class="card-footer text-white bg-white">
				<b>Thông Tin Về Phim: ${item.description}.</b><br />
				<jsp:useBean id="now" class="java.util.Date" />
				<b>Năm Phát Hành: <fmt:formatDate value="${now}"
						pattern="yyyy-MM-dd" />
				</b> <br /> <b>Độ Phân Giải: HD</b>
			</div>
		</div>
		<div class="card mt-3 mb-3">
			<iframe width="100%" height="315"
				src="https://www.youtube.com/embed/${item.id}"
				title="YouTube video player" frameborder="0"
				allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
				allowfullscreen></iframe>
		</div>
	</div>
</div>