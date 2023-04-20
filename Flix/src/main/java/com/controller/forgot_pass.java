package com.controller;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.FavoriteDAO;
import com.dao.ShareDAO;
import com.dao.UserDAO;
import com.dao.VideoDAO;
import com.entity.Share;
import com.entity.User;
import com.entity.Video;

/**
 * Servlet implementation class forgot_pass
 */
@WebServlet({"/forgot"})
public class forgot_pass extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAO userDAO;
	private VideoDAO videoDAO;
	private FavoriteDAO favoriteDAO;
	private ShareDAO shareDAO;
	private User user;
	private Video video;
	private Share share;
	private String forgotEmail = "";
   
    public forgot_pass() {
        super();
        this.userDAO = new UserDAO();
		this.videoDAO = new VideoDAO();
		this.favoriteDAO = new FavoriteDAO();
		this.shareDAO = new ShareDAO();
		this.user = new User();
		this.video = new Video();
		this.share = new Share();
		
    }





	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		
		if(uri.contains("forgot")) {
			this.forgot(request, response);
		}

		request.setAttribute("action","quenmatkhau");
		request.getRequestDispatcher("/views/index.jsp").forward(request, response);
	}

protected void forgot(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
	String emailfg = request.getParameter("email");

	
	if(this.userDAO.findByEmail(emailfg) == null) {
		request.setAttribute("check", "Tài khoản không tồn tại!");
	}else {
		User entity = this.userDAO.findByEmail(emailfg);
		String username = "lebichvicm2020@gmail.com";
		String password = "unqyrocnnjprbcud";

		Properties prop = new Properties();
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.port", "587");
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.starttls.enable", "true");
		prop.setProperty("mail.smtp.ssl.protocols", "TLSv1.2");
		Session session = Session.getInstance(prop, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});

		try {

			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("lebichvicm2020@gmail.com"));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(emailfg));
			message.setSubject("MẬT KHẨU");
			message.setText("Mật khẩu của bạn là: "+entity.getPassword());
			Transport.send(message);
			request.setAttribute("check","Gửi thành công!");

		} catch (MessagingException e) {
			request.setAttribute("check","Lỗi!");
			e.printStackTrace();
		}
	}

}

	
	
}

