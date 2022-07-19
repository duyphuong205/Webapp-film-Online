package edu.servlet.user;

import java.io.IOException;
import java.util.Properties;

import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import edu.dao.UserDAO;
import edu.model.User;
import edu.utils.CookieUtils;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet({ "/account/signup", "/account/signout", "/account/forgotpassword", "/account/changepassword",
		"/account/editprofile" })
public class AccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = request.getRequestURL().toString();
		if (url.contains("signup")) {
			signUp(request, response);
		} else if (url.contains("signout")) {
			signOut(request, response);
		} else if (url.contains("forgotpassword")) {
			forgotPassword(request, response);
		} else if (url.contains("changepassword")) {
			changePassword(request, response);
		} else if (url.contains("editprofile")) {
			editProfile(request, response);
		}
	}

	protected void signUp(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		String method = req.getMethod();
		if (method.equals("POST")) {
			try {
				User user = new User();
				UserDAO udao = new UserDAO();
				BeanUtils.populate(user, req.getParameterMap());
				udao.insert(user);
				req.setAttribute("message", "Dang Ky Thanh Cong");
			} catch (Exception e) {
				e.printStackTrace();
				req.setAttribute("error", "Dang Ky That Bai");
			}
		}
		req.getRequestDispatcher("/views/user/register.jsp").forward(req, resp);
	}

	protected void signOut(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getSession().invalidate();
		request.getSession().getAttribute("user");
		CookieUtils.add(response, "id", null, 0);
		CookieUtils.add(response, "password", null, 0);
		System.out.println("Dang Xuat Thanh Cong");
		response.sendRedirect("/ASM_JAVA4/LoginServlet");
	}

	protected void changePassword(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String username = req.getParameter("id");
		String currentpassword = req.getParameter("currentpassword");
		String newpassword = req.getParameter("newpassword");
		String confirmpassword = req.getParameter("confirmpassword");
		String method = req.getMethod();
		if (method.equals("POST")) {
			try {
				User user = (User) req.getSession().getAttribute("user");
				UserDAO udao = new UserDAO();
				udao.findbyId(username);
				if (!currentpassword.equals(user.getPassword())) {
					req.setAttribute("error", "Mat khau Hien Tai Khong Dung!");
				} else if (!newpassword.equalsIgnoreCase(confirmpassword)) {
					req.setAttribute("error", "2 Mat khau Khong Trung!");
				} else {
					user.setPassword(newpassword);
					udao.update(user);
					req.setAttribute("message", "Doi Mat khau Thanh Cong!");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		RequestDispatcher request = req.getRequestDispatcher("/HomeServlet/changepassword");
		request.forward(req, resp);
	}

	protected void forgotPassword(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String method = req.getMethod();
		if (method.equalsIgnoreCase("POST")) {
			String id = req.getParameter("id");
			String email = req.getParameter("email");

			Properties props = new Properties();
			props.setProperty("mail.smtp.auth", "true");
			props.setProperty("mail.smtp.starttls.enable", "true");
			props.setProperty("mail.smtp.host", "smtp.gmail.com");
			props.setProperty("mail.smtp.port", "587");
			Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("phuongduy220502@gmail.com", "duyphuong205");
				}
			});
			try {
				MimeMessage message = new MimeMessage(session);
				// to
				message.setRecipients(javax.mail.Message.RecipientType.TO, email);
				UserDAO udao = new UserDAO();
				User user = udao.findbyId(id);
				if (!user.getEmail().equals(email)) {
					req.setAttribute("error", "Email Không Chính Xác!");
				} else {
					// tiêu đề
					message.setSubject("Your Pasword");
					// nội dung
					message.setText("Password:" + user.getPassword());
					// gửi đi
					Transport.send(message);
					req.setAttribute("message", "Gửi thành công!");
				}
			} catch (MessagingException e) {
				req.setAttribute("error", "Username Không Chính Xác!");
				throw new RuntimeException(e);
			}
		}
		req.getRequestDispatcher("/views/user/forgotpassword.jsp").forward(req, resp);
	}

	protected void editProfile(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		String method = req.getMethod();
		User user = (User) req.getSession().getAttribute("user");
		if (method.equals("POST")) {
			try {
				UserDAO udao = new UserDAO();
				BeanUtils.populate(user, req.getParameterMap());
				udao.update(user);
				req.setAttribute("message", "Chinh Sua Thanh Cong!");
			} catch (Exception e) {
				e.printStackTrace();
				req.setAttribute("error", "Chinh sua that bai!");
			}
		}
		RequestDispatcher request = req.getRequestDispatcher("/HomeServlet/editprofile");
		request.forward(req, resp);
	}
}
