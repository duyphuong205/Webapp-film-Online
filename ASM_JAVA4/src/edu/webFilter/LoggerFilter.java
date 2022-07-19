package edu.webFilter;

import java.io.IOException;
import java.util.Date;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.model.User;

@WebFilter(filterName = "logger")
//thông tin truy xuất (user, url, time)
//Ghi nhận thông tin truy xuất đến từng trang vào CSDL phục vụ cho việc tra cứu,
//tổng hợp thống kê
public class LoggerFilter implements HttpFilter {
	@Override
	public void doFilter(HttpServletRequest req, HttpServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		User user = (User) req.getSession().getAttribute("user");
		String uri = req.getRequestURI();
		Date time = new Date();
		// code
		chain.doFilter(req, resp);
	}
}