package edu.servlet.user;

import java.io.IOException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.dao.ShareDAO;
import edu.dao.VideoDAO;
import edu.model.Share;
import edu.model.User;
import edu.model.Video;

/**
 * Servlet implementation class ShareVideoServlet
 */
@WebServlet(urlPatterns = { "/VideoFavorite/share" })
public class ShareVideoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String videoID = request.getParameter("videoID");
		if (videoID == null) {
			response.sendRedirect("HomeServlet/index");
			return;
		}
		request.setAttribute("videoID", videoID);
		request.getRequestDispatcher("/HomeServlet/sendmail").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("user");
		String videoID = request.getParameter("videoID");
		String to = request.getParameter("email");
		String subject = request.getParameter("subject");
		Properties pro = new Properties();
		pro.put("mail.smtp.auth", "true");
		pro.put("mail.smtp.starttls.enable", "true");
		pro.put("mail.smtp.host", "smtp.gmail.com");
		pro.put("mail.smtp.port", 587);
		final String from = "phuongduy220502@gmail.com";
		final String password = "zapdcabmcqylvkgx";
		Session session = Session.getDefaultInstance(pro, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(from, password);
			}
		});
		try {
			MimeMessage message = new MimeMessage(session);
			// to
			message.setRecipients(javax.mail.Message.RecipientType.TO, to);
			// tieu de
			VideoDAO vdao = new VideoDAO();
			Video video = vdao.findbyId(videoID);
			message.setSubject(subject, "UTF-8");
			// noi dung
			message.setText("Link Phim:" + video.getId());
			// gui
			Transport.send(message);
			ShareDAO sdao = new ShareDAO();
			Share share = new Share();
			share.setEmail(to);
			share.setSharedate(new Date());
			user.setId(user.getId());
			share.setUser(user);
			video.setId(videoID);
			share.setVideo(video);
			sdao.insert(share);
			request.setAttribute("message", "Chia Se Thanh Cong!");
			request.getRequestDispatcher("/HomeServlet/sendmail").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
