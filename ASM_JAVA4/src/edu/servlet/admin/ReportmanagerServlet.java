package edu.servlet.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.dao.ReportDAO;
import edu.dao.VideoDAO;
import edu.model.Report;

/**
 * Servlet implementation class ReportmanagerServlet
 */
@WebServlet("/ReportmanagerServlet")
public class ReportmanagerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Report report = new Report();
		ReportDAO rdao = new ReportDAO();
		request.setAttribute("favoritesCount", rdao.ReportFavorites());
		ReportFavoriteUsers(request, response);
		ReportShareFriends(request, response);
		request.getRequestDispatcher("/views/admin/reportmanager.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	protected void ReportFavoriteUsers(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String videoID = request.getParameter("videoID");
			ReportDAO rdao = new ReportDAO();
			VideoDAO vdao = new VideoDAO();
			request.setAttribute("videoList", vdao.findAll());
			request.setAttribute("videoID", videoID);
			request.setAttribute("favoriteUser", rdao.ReportFavoriteUser(videoID));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void ReportShareFriends(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String videoID = request.getParameter("videoID");
			ReportDAO rdao = new ReportDAO();
			VideoDAO vdao = new VideoDAO();
			request.setAttribute("videoList", vdao.findAll());
			request.setAttribute("videoID", videoID);
			request.setAttribute("shareFriends", rdao.ReportShareFriends(videoID));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
