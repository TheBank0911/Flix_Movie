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

/**
 * Servlet implementation class support
 */
@WebServlet("/support")
public class support extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public support() {
        super();
        
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String uri = request.getRequestURI();
		if (uri.contains("support")) {
			String to = request.getParameter("email");
			String body = request.getParameter("body");
			String name = request.getParameter("fullname");
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
				message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
				message.setSubject("Mail phản hồi");
				message.setText("Họ và tên : "+name+"-------"+"Phản hồi : "+body);
				Transport.send(message);
				request.setAttribute("lh","Thành công!");
			} catch (MessagingException e) {
				request.setAttribute("lh","Lỗi!");
				e.printStackTrace();
			}

		}
		request.setAttribute("action", "lienhe");
		request.getRequestDispatcher("/views/index.jsp").forward(request, response);
		}
		

}
