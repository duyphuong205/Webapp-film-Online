<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="search mt-3">
	<form class="form-inline my-22 my-lg-0 "
		action="/ASM_JAVA4/SearchVideoByTitleSevlet" method="post">
		<input class="ml-auto form-control mr-sm-2" type="search"
			placeholder="Search by title" aria-label="Search" name="title">
		<button class="btn btn-dark my-2 my-sm-0" type="submit">Search</button>
	</form>
</div>
<div class="row">
	<div class="col-md-12 product">
		<div class="row">
			<c:forEach var="item" items="${listVideo}">
				<div class="col-md-3 mt-5">
					<div class="card">
						<img src="/ASM_JAVA4/fileVideo/${item.poster}" height="300px;"
							width="100%">
						<div class="card-footer bg-white text-center">
							<h5>${item.title}</h5>
							<a href="/ASM_JAVA4/HomeServlet/index?name=${item.id}"> <fmt:setLocale
									value="${sessionScope.lang}" scope="request" /> <fmt:setBundle
									basename="edu.i18n.home" scope="request" />

								<button class="btn form-control movie">
									<fmt:message key="title.index" />
								</button>
							</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>