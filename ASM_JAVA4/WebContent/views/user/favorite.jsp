<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.row>.col-md-3>.card>.card-footer>h5 {
	font-family: Impact, Haettenschweiler, 'Arial Narrow Bold', sans-serif;
	color: black;
	letter-spacing: 1px;
	transition: all .2s ease-in;
}

.row>.col-md-3>.card>.card-footer>i {
	font-size: 30px;
}

.row>.col-md-3>.card>.card-footer>i.shares:hover {
	font-size: 31px;
	color: rgb(0, 132, 255);
	transition: all .2s ease-in;
}

.row>.col-md-3>.card>.card-footer>i.unlike:hover {
	font-size: 31px;
	color: black;
	transition: all .2s ease-in;
}

.row>.col-md-3>.card>.card-footer>i.unlike {
	color: red;
}
</style>
<div class="row">
<c:forEach var="item" items="${fvideoList}">
	<div class="col-md-3 mt-3 mb-3">
		<div class="card">
			<img src="/ASM_JAVA4/fileVideo/${item.poster}" alt="" height="300px;" width="100%">
			<div class="card-footer bg-white text-center">
				<h5>${item.title}</h5>
				<a href="/ASM_JAVA4/VideoFavorite/like?videoID=${item.id}" class="btn btn-default">
                 <c:if test="${item.favorites == null || item.favorites.size() ==0}"><i class="fa fa-heart mr-5 like"></i></c:if>
                 <c:if test="${item.favorites != null && item.favorites.size() >0}"><i class="fa fa-heart mr-5 unlike"></i></c:if>
                 </a>
				<a href="/ASM_JAVA4/HomeServlet/sendmail?videoID=${item.id}"
					class="btn btn-default"><i
					class="fa fa-share-alt-square ml-5 shares"></i></a>
			</div>
		</div>
	</div>
	</c:forEach>
</div>