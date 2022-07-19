package edu.servlet.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import edu.dao.UserDAO;
import edu.model.User;

/**
 * Servlet implementation class UsermanagerServlet
 */
@WebServlet({ "/UsermanagerServlet", "/UsermanagerServlet/create", "/UsermanagerServlet/update",
		"/UsermanagerServlet/delete", "/UsermanagerServlet/reset", "/UsermanagerServlet/edit" })
public class UsermanagerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		User user = new User();
		UserDAO udao = new UserDAO();
		String url = request.getRequestURL().toString();
		if (url.contains("edit")) {
			String id = request.getParameter("id");
			user = udao.findbyId(id);
			request.setAttribute("userEdit", user);
			request.setAttribute("message", "Hiển Thị Thành Công");
		} else if (url.contains("create")) {
			try {
				BeanUtils.populate(user, request.getParameterMap());
				udao.insert(user);
				request.setAttribute("userEdit", user);
				request.setAttribute("message", "Thêm Thành Công");
			} catch (Exception e) {
				e.printStackTrace();
				request.setAttribute("error", "Thêm Thất Bại" + e.getMessage());
			}
		} else if (url.contains("update")) {
			try {
				BeanUtils.populate(user, request.getParameterMap());
				udao.update(user);
				request.setAttribute("userEdit", user);
				request.setAttribute("message", "Cập Nhật Thành Công");
			} catch (Exception e) {
				e.printStackTrace();
				request.setAttribute("error", "Cập Nhật Thất Bại" + e.getMessage());
			}
		} else if (url.contains("delete")) {
			try {
				String id = request.getParameter("id");
				udao.detele(id);
				request.setAttribute("message", "Xóa Thành Công");
			} catch (Exception e) {
				e.printStackTrace();
				request.setAttribute("error", "Xóa Thất Bại" + e.getMessage());
			}
		}
		request.setAttribute("userList", udao.findAll());
		request.getRequestDispatcher("/views/admin/usermanager.jsp").forward(request, response);
	}

}
