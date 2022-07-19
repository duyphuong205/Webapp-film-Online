//package edu.servlet.user;
//
//import java.io.IOException;
//import java.util.Date;
//import java.util.Properties;
//
//import javax.mail.Message;
//import javax.mail.MessagingException;
//import javax.mail.Message.RecipientType;
//import javax.mail.PasswordAuthentication;
//import javax.mail.Session;
//import javax.mail.Transport;
//import javax.mail.internet.MimeMessage;
//import javax.servlet.RequestDispatcher;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import edu.dao.FavoriteDAO;
//import edu.dao.ShareDAO;
//import edu.dao.VideoDAO;
//import edu.model.Favorite;
//import edu.model.Share;
//import edu.model.User;
//import edu.model.Video;
//
///**
// * Servlet implementation class VideoServlet
// */
//@WebServlet(urlPatterns = { "/VideoFavorite/like", "/VideoFavorite/unlike", "/VideoFavorite/share" })
//public class VideoServlet extends HttpServlet {
//	@Override
//	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		String uri = req.getRequestURI();
//		if (uri.contains("like")) {
//			likeVideo(req, resp);
//		} else if (uri.contains("share")) {
//			shareVideo(req, resp);
//		}
//	}
//
//	protected void likeVideo(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		Favorite fa = new Favorite();
//		FavoriteDAO fdao = new FavoriteDAO();
//		User user = (User) req.getSession().getAttribute("user");
//		String videoID = req.getParameter("videoID");
//		if (user != null) {
//			if (fdao.isLike(user.getId(), videoID)) {
//				fdao.unLike(user.getId(), videoID);
//			} else {
//				fdao.insertLike(user.getId(), videoID);
//			}
//		} else {
//			resp.sendRedirect("/ASM_JAVA4/LoginServlet");
//		}
//		RequestDispatcher request = req.getRequestDispatcher("/HomeServlet/index");
//		request.forward(req, resp);
//	}
//
//	protected void shareVideo(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		String method = req.getMethod();
//		if (method.equalsIgnoreCase("POST")) {
//			User user = (User) req.getSession().getAttribute("user");
//			String videoID = req.getParameter("videoID");
//			String toEmail = req.getParameter("email");
//			String subject = req.getParameter("subject");
//			Properties pro = new Properties();
//			pro.put("mail.smtp.auth", "true");
//			pro.put("mail.smtp.starttls.enable", "true");
//			pro.put("mail.smtp.host", "smtp.gmail.com");
//			pro.put("mail.smtp.port", 587);
//			final String fromEmail = "phuongduy220502@gmail.com";
//			final String password = "duyphuong205";
//			Session session = Session.getDefaultInstance(pro, new javax.mail.Authenticator() {
//				protected PasswordAuthentication getPasswordAuthentication() {
//					return new PasswordAuthentication(fromEmail, password);
//				}
//			});
//			try {
//				MimeMessage message = new MimeMessage(session);
//				// den
//				message.setRecipients(Message.RecipientType.TO, toEmail);
//				// tieu de
//				message.setSubject(subject, "UTF-8");
//				// noi dung
////				VideoDAO vdao = new VideoDAO();
////				Video video = vdao.findbyId(videoID);
////				User user= new User();
//				message.setText("Link Phim:" + videoID);
//				// gui
//				Transport.send(message);
//
//				ShareDAO sdao = new ShareDAO();
//				Share share = new Share();
//				sdao.insertShare(user.getId(), videoID, toEmail);
//
//				req.setAttribute("message", "Chia Sẻ Thành Công");
//				req.getRequestDispatcher("/HomeServlet/sendmail").forward(req, resp);
//			} catch (MessagingException e) {
//				e.printStackTrace();
//				req.setAttribute("error", "Chia Sẻ Thất Bại!");
//			}
//		}
//
//	}
//}
