<div class="row mt-3 mb-3">
                <div class="col-md-12 ">
                    <div class="card">
                        <div class="card-header text-center bg-white">
                            <h2><i class="fa fa-passport"></i> Change Password</h2>
                        </div>
                        <form action="/ASM_JAVA4/account/changepassword" method="post">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col">
                                        <div class="form-group">
                                            <label><i class="fa fa-user"></i> Username</label>
                                            <input type="text" class="form-control" name="id" value="${user.id}">
                                        </div>
                                        <div class="form-group">
                                            <label><i class="fa fa-unlock"></i> New Password</label>
                                            <input type="password" class="form-control" name="newpassword">
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="form-group">
                                            <label><i class="fa fa-key"></i> Current Password</label>
                                            <input type="password" class="form-control" name="currentpassword" value="${user.password}">
                                        </div>
                                        <div class="form-group">
                                            <label><i class="fa fa-lock"></i> Confirm New Password</label>
                                            <input type="password" class="form-control" name="confirmpassword">
                                        </div>
                                    </div>
                                </div>
                                <br>
                                <button class="btn btn-warning form-control">Change</button>
                            </div>
                        </form>
                    </div>
                    <jsp:include page="/views/nocation/thongbao.jsp"/>
                </div>
            </div>