 <div class="row mt-3 mb-3">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header text-center bg-white">
                            <h2><i class="fa fa-user-edit"></i> Edit Profile</h2>
                        </div>
                        <form action="/ASM_JAVA4/account/editprofile" method="post">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col">
                                        <div class="form-group">
                                            <label><i class="fa fa-user"></i> Username</label>
                                            <input type="text" class="form-control" name="id" value="${user.id}">
                                        </div>
                                        <div class="form-group">
                                            <label><i class="fa fa-signature"></i> Fullname</label>
                                            <input type="text" class="form-control" name="fullname" value="${user.fullname}">
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="form-group">
                                            <label><i class="fa fa-key"></i> Password</label>
                                            <input type="password" class="form-control" name="password" value="${user.password}">
                                        </div>
                                        <div class="form-group">
                                            <label><i class="fa fa-at"></i> Email Address</label>
                                            <input type="email" class="form-control" name="email" value="${user.email}">
                                        </div>
                                        <div class="form-group">
									     <input type="hidden" class="form-control" name="admin"
										  value="${user.admin}">
								</div>
                                    </div>
                                </div>
                                <br>
                                <button class="btn btn-danger form-control">Edit</button>
                            </div>
                        </form>
                    </div>
                    <jsp:include page="/views/nocation/thongbao.jsp"/>
                </div>
            </div>