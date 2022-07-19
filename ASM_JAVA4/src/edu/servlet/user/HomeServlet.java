package edu.servlet.user;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.dao.VideoDAO;
import edu.model.Video;

/**
 * Servlet implementation class HomeServlet
 */
@WebServlet(urlPatterns = { "/HomeServlet/index", "/HomeServlet/detail", "/HomeServlet/changepassword",
		"/HomeServlet/editprofile", "/HomeServlet/favorite", "/HomeServlet/sendmail", "/HomeServlet/address" })
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final int VIDEO_MAX_PAGE = 8;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String uri = req.getRequestURI();
		if (uri.contains("index") || uri.contains("detail")) {
			VideoDAO vdao = new VideoDAO();
			List<Video> list = vdao.findAll();
			req.setAttribute("listVideo", list);
			String name = req.getParameter("name");
			if (name != null) {
				for (Video video : list) {
					if (video.getId().equalsIgnoreCase(name)) {
						req.setAttribute("item", video);
						req.setAttribute("view", "/views/user/detail.jsp");
					}
				}
			} else {
				req.setAttribute("view", "/views/user/index.jsp");
			}
		} else if (uri.contains("changepassword")) {
			req.setAttribute("view", "/views/user/changepassword.jsp");
		} else if (uri.contains("editprofile")) {
			req.setAttribute("view", "/views/user/editprofile.jsp");
		} else if (uri.contains("favorite")) {
			VideoDAO vdao = new VideoDAO();
			req.setAttribute("fvideoList", vdao.favoriteVideo());
			req.setAttribute("view", "/views/user/favorite.jsp");
		} else if (uri.contains("sendmail")) {
			req.setAttribute("view", "/views/user/sendmail.jsp");
		} else if (uri.contains("address")) {
			req.setAttribute("view", "/views/user/address.jsp");
		}
		req.getRequestDispatcher("/views/user/layout.jsp").forward(req, resp);
	}


}
