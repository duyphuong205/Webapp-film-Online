package edu.servlet.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.dao.FavoriteDAO;
import edu.model.Favorite;
import edu.model.User;

/**
 * Servlet implementation class LikeVideoServlet
 */
@WebServlet(urlPatterns = { "/VideoFavorite/like" })
public class LikeVideoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("user");
		if (user == null) {
			response.sendRedirect("/ASM_JAVA4/LoginServlet");
			return;
		} else {
			Favorite fa = new Favorite();
			FavoriteDAO fdao = new FavoriteDAO();
			String videoID = request.getParameter("videoID");
			if (fdao.isLike(user.getId(), videoID)) {
				fdao.unLike(user.getId(), videoID);
			} else {
				fdao.insertLike(user.getId(), videoID);
			}
		}
		request.getRequestDispatcher("/HomeServlet/index").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
