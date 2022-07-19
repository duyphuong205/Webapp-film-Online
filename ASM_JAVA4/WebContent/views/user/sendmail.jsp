<div class="row mt-3 mb-3">
	<div class="col-md-6 offset-md-3">
		<div class="card">
			<div class="card-header text-center bg-white">
				<h2>
					<i class="fa fa-envelope-open-text"></i> Send Video To Your Friends
				</h2>
			</div>
			<form action="/ASM_JAVA4/VideoFavorite/share" method="post">
				<div class="card-body">
					<input type="hidden" name="videoID" value="${videoID}"/>
					<div class="form-group">
						<label><i class="fa fa-at"></i> Email</label> <input type="email"
							class="form-control" name="email">
					</div>
					<div class="form-group">
						<label><i class="fa fa-file-signature"></i> Subject</label> <input
							type="text" class="form-control" name="subject">
					</div>
					<button class="btn btn-success form-control">Send</button>
				</div>
			</form>
		</div>
		<jsp:include page="/views/nocation/thongbao.jsp"></jsp:include>
	</div>
</div>