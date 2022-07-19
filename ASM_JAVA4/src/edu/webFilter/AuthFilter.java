package edu.webFilter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.model.User;

@WebFilter(filterName = "auth", urlPatterns = { "/UsermanagerServlet/*", "/account/signout","/account/changepassword",
		"/account/editprofile","/ReportmanagerServlet", "/VideomanagerServlet/*" })
//hạn chế quyền truy cập(bao mat)
//Kiểm tra session để biết được quyền truy cập của user hiện tại
public class AuthFilter implements HttpFilter {
	@Override
	public void doFilter(HttpServletRequest req, HttpServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		String uri = req.getRequestURI();
		User user = (User) req.getSession().getAttribute("user");
		String error = "";
		// chua login
		if (user == null) {
			error = resp.encodeURL("Vui Long Dang Nhap!");
			System.out.println("Vui Long Dang Nhap!");
			// khong phai admin
		} else if (!user.getAdmin() && uri.contains("/UsermanagerServlet/*") && uri.contains("/ReportmanagerServlet/*")
				&& uri.contains("/VideomanagerServlet/*")) {
			error = resp.encodeURL("Vui Long Dang Nhap Voi Vai Tro Admin!");
			System.out.println("Vui Long Dang Nhap Voi Vai Tro Admin!");
		}
		// truy cap khong hop le
		if (!error.isEmpty()) {
			req.getSession().setAttribute("securi", uri);
			resp.sendRedirect("/ASM_JAVA4/LoginServlet?error=" + resp.encodeURL(error));
			System.out.println("Truy Cap Khong Hop Le!");
		}
		// truy cap hop le
		else {
			chain.doFilter(req, resp);
		}
	}
}
