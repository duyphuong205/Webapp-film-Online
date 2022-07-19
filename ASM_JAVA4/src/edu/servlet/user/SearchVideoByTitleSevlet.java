package edu.servlet.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.dao.VideoDAO;

/**
 * Servlet implementation class SearchVideoByTitleSevlet
 */
@WebServlet("/SearchVideoByTitleSevlet")
public class SearchVideoByTitleSevlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		VideoDAO vdao= new VideoDAO();
		String title = request.getParameter("title");
		request.setAttribute("listVideo", vdao.searchByTitle(title));
		request.getRequestDispatcher("/views/user/layout.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
