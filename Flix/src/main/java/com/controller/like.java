package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.FavoriteDAO;
import com.dao.ShareDAO;
import com.dao.UserDAO;
import com.dao.VideoDAO;
import com.entity.Favorite;
import com.entity.Share;
import com.entity.User;
import com.entity.Video;

/**
 * Servlet implementation class like
 */
@WebServlet({"/like"})
public class like extends HttpServlet {
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

	public like() {
		super();
		this.userDAO = new UserDAO();
		this.videoDAO = new VideoDAO();
		this.favoriteDAO = new FavoriteDAO();
		this.shareDAO = new ShareDAO();
		this.user = new User();
		this.video = new Video();
		this.share = new Share();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uri = request.getRequestURI();
		User user = (User) request.getSession().getAttribute("user");
		int idVideo = Integer.valueOf(request.getParameter("idvideo"));
		if (uri.contains("like")) {
			this.likevd(request, response);
			try {
				request.setAttribute("listvds", this.videoDAO.findVideolist(idVideo));
				request.setAttribute("Videoid", this.videoDAO.FindIdVideo(idVideo));
				request.setAttribute("action", "trangchitiet");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} 
		request.setAttribute("action", "trangchitiet");
		request.getRequestDispatcher("/views/index.jsp").forward(request, response);

	}

	private void likevd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idVideo = Integer.valueOf(request.getParameter("idvideo"));
		try {
			User user = (User) request.getSession().getAttribute("user");
			Video video = this.videoDAO.FindIdVideo(idVideo);
			Favorite favorite = new Favorite();
			favorite.setVideo(video);
			favorite.setUser(user);
			favorite.setLikeDate(day());
			this.favoriteDAO.create(favorite);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	
	public java.sql.Date day() {
		return day;
	}
}
