package edu.servlet.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.dao.UserDAO;
import edu.model.User;
import edu.utils.CookieUtils;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = CookieUtils.get("id", request);
		String password = CookieUtils.get("password", request);

		request.setAttribute("id", username);
		request.setAttribute("password", password);
		request.getRequestDispatcher("/views/user/login.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String method = request.getMethod();
		if (method.equalsIgnoreCase("POST")) {
			String id = request.getParameter("id");
			String password = request.getParameter("password");
			String remember = request.getParameter("remember");

			try {
				UserDAO udao = new UserDAO();
				User user = udao.findbyId(id);
				if (!user.getPassword().equals(password)) {
					request.setAttribute("error", "Sai mật khẩu!");
					RequestDispatcher req = request.getRequestDispatcher("/views/user/login.jsp");
					req.forward(request, response);
				} else {
					System.out.println("Dang nhap thanh cong");
					HttpSession session = request.getSession();
					session.setAttribute("user", user);
					if (remember != null) {
						CookieUtils.add(response, "id", id, 24);
						CookieUtils.add(response, "password", password, 24);
					} else {
						CookieUtils.add(response, "id", id, 0);
						CookieUtils.add(response, "password", password, 0);
					}
					response.sendRedirect("HomeServlet/index");
				}
			} catch (Exception e) {
				request.setAttribute("error", "Sai tên đăng nhâp!");
				RequestDispatcher req = request.getRequestDispatcher("/views/user/login.jsp");
				req.forward(request, response);
				System.out.println("Sai ten dang nhap");
				e.printStackTrace();
			}
		} else {
			RequestDispatcher req = request.getRequestDispatcher("/views/user/login.jsp");
			req.forward(request, response);
		}
	}
}
