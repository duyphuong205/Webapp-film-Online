package edu.webListener;

import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.List;

import javax.servlet.Servlet;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

@WebListener
public class AppListener implements HttpSessionListener, ServletContextListener {
	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		// ghi số đếm trong application scope vào file
		// tạo đối tượng
		ServletContext application = sce.getServletContext();
		// ép kiểu và đọc giá trị từ application ra
		Integer visitors = (Integer) application.getAttribute("visitors");
		try {
			// đường dẫn tệp tin
			String path = application.getRealPath("/visitors.txt");
			byte[] data = String.valueOf(visitors).getBytes();
			// ghi file xuống
			Files.write(Paths.get(path), data, StandardOpenOption.CREATE);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		// đọc số đếm trước đây từ file vào application scope
		// tạo đối tượng application
		ServletContext application = sce.getServletContext();
		// khai báo biến đếm
		Integer visitors = 0;
		try {
			// đặt tại webroot
			// đương dẫn tệp tin
			String path = application.getRealPath("/visitors.txt");
			// đọc tất cả các dòng
			List<String> lines = Files.readAllLines(Paths.get(path));
			// đọc và ép kiểu
			visitors = Integer.valueOf(lines.get(0));
		} catch (Exception e) {
			// tạo số đếm nếu file k tồn tại
			visitors = 1;
		}
		// gán giá trị vào biến application
		application.setAttribute("visitors", visitors);
	}

	@Override
	public void sessionCreated(HttpSessionEvent se) {
		// tăng số đếm trong application scope lên một
		// tạo đối tượng session
		HttpSession session = se.getSession();
		ServletContext application = session.getServletContext();
		// ép kiểu và lấy giá trị từ application ra
		Integer visitors = (Integer) application.getAttribute("visitors");
		// gán giá trị vào lại application
		application.setAttribute("visitors", visitors + 1);
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		// TODO Auto-generated method stub

	}
}
