package edu.servlet.admin;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.beanutils.BeanUtils;

import edu.dao.UserDAO;
import edu.dao.VideoDAO;
import edu.model.User;
import edu.model.Video;

/**
 * Servlet implementation class UsermanagerServlet
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10, // 10MB
maxRequestSize = 1024 * 1024 * 50) // 50MB
@WebServlet({ "/VideomanagerServlet", "/VideomanagerServlet/create", "/VideomanagerServlet/update",
		"/VideomanagerServlet/delete", "/VideomanagerServlet/reset", "/VideomanagerServlet/edit" })
public class VideoManagerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		Video video = new Video();
		VideoDAO vdao = new VideoDAO();
		String url = request.getRequestURL().toString();
		if (url.contains("edit")) {
			String id = request.getParameter("id");
			video = vdao.findbyId(id);
			request.setAttribute("videoEdit", video);
			request.setAttribute("message", "Hiển Thị Thành Công");
		} else if (url.contains("create")) {
			try {
				File dir = new File(request.getServletContext().getRealPath("/fileVideo"));
				if (!dir.exists()) {
					dir.mkdirs();
				}
				System.out.println("" + dir);
				Part photo = request.getPart("poster");
				File photofile = new File(dir, photo.getSubmittedFileName());
				photo.write(photofile.getAbsolutePath());
				video.setPoster(photofile.getName());

				BeanUtils.populate(video, request.getParameterMap());
				vdao.insert(video);

				request.setAttribute("videoEdit", video);
				request.setAttribute("message", "Thêm Thành Công");
			} catch (Exception e) {
				e.printStackTrace();
				request.setAttribute("error", "Thêm Thất Bại" + e.getMessage());
			}
		} else if (url.contains("update")) {
			try {
				File dir = new File(request.getServletContext().getRealPath("/fileVideo"));
				if (!dir.exists()) {
					dir.mkdirs();
				}
				System.out.println("" + dir);
				Part photo = request.getPart("poster");
				File photofile = new File(dir, photo.getSubmittedFileName());
				photo.write(photofile.getAbsolutePath());
				video.setPoster(photofile.getName());
				
				BeanUtils.populate(video, request.getParameterMap());
				vdao.update(video);
				
				request.setAttribute("videoEdit", video);
				request.setAttribute("message", "Cập Nhật Thành Công");
			} catch (Exception e) {
				e.printStackTrace();
				request.setAttribute("error", "Cập Nhật Thất Bại" + e.getMessage());
			}
		} else if (url.contains("delete")) {
			try {
				String id = request.getParameter("id");
				vdao.detele(id);
				request.setAttribute("message", "Xóa Thành Công");
			} catch (Exception e) {
				e.printStackTrace();
				request.setAttribute("error", "Xóa Thất Bại" + e.getMessage());
			}
		}
		request.setAttribute("videoList", vdao.findAll());
		request.getRequestDispatcher("/views/admin/videomanager.jsp").forward(request, response);
	}

}
