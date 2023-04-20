package com.controller;

import java.io.IOException;
import java.util.List;
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

import org.apache.commons.beanutils.BeanUtils;

import com.dao.FavoriteDAO;
import com.dao.ShareDAO;
import com.dao.UserDAO;
import com.dao.VideoDAO;
import com.entity.Share;
import com.entity.User;
import com.entity.Video;

/**
 * Servlet implementation class share
 */
@WebServlet({"/sharevd"})
public class share extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAO userDAO;
	private VideoDAO videoDAO;
	private FavoriteDAO favoriteDAO;
	private ShareDAO shareDAO;
	private User user;
	private Video video;
	private Share share;
	long millis = System.currentTimeMillis();
	java.sql.Date day = new java.sql.Date(millis);
    /**
     * @see HttpServlet#HttpServlet()
     */
    public share() {
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
		int id = Integer.valueOf(request.getParameter("idvd"));
		
		List<Share> listshares;
		try {
			listshares = this.shareDAO.findIdUser(user.getId());
			request.setAttribute("listshares", listshares);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if (uri.contains("share")) {
			System.out.println("a");
			this.send(request, response);
			this.share(request, response);
			
			try {
				request.setAttribute("listvds", this.videoDAO.findVideolist(id));
				request.setAttribute("Videoid", this.videoDAO.FindIdVideo(id));
				request.setAttribute("action", "trangchitiet");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		request.setAttribute("action", "trangchitiet");
		request.getRequestDispatcher("/views/index.jsp").forward(request, response);
	}
	private void share(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String mailshare = request.getParameter("mailshare");
			int idVideo = Integer.valueOf(request.getParameter("idvd"));
			User user = (User) request.getSession().getAttribute("user");
			Video video = this.videoDAO.FindIdVideo(idVideo);
			Share entity = new Share();
			entity.setEmails(mailshare);
			entity.setVideo(video);
			entity.setShareDate(day());
			entity.setUser(user);
			this.shareDAO.create(entity);
			System.out.println("Thành công");
		} catch (Exception e) {
			System.out.println("Lỗi");
			System.out.println(e);
		}
	}
	private void send(HttpServletRequest request,HttpServletResponse response)throws ServletException, IOException{
		int idVideo = Integer.valueOf(request.getParameter("idvd"));
		Video entity = this.videoDAO.FindIdVideo(idVideo);
		
		String to = request.getParameter("mailshare");
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
			message.setSubject("Mail");
			message.setText(entity.getHref());
			Transport.send(message);
			System.out.println("Thành công!");
		} catch (MessagingException e) {
			System.out.println("Lỗi!");
			e.printStackTrace();
		}
	}
	public java.sql.Date day() {
		return day;
	}
}
