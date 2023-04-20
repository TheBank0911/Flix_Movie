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
 * Servlet implementation class unlike
 */
@WebServlet("/unlike")
public class unlike extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAO userDAO;
	private VideoDAO videoDAO;
	private FavoriteDAO favoriteDAO;
	private ShareDAO shareDAO;
	private User user;
	private Video video;
	private Share share;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public unlike() {
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
		User user = (User) request.getSession().getAttribute("user");
		if (uri.contains("unlike")) {
			this.unlikevd(request, response);
			
			try {
				List<Favorite> listlikes = this.favoriteDAO.findIdUser(user.getId());
				request.setAttribute("listlikes", listlikes);
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.setAttribute("action", "yeuthich");
		}
		
		request.setAttribute("action", "yeuthich");
		try {
			List<Favorite> listlikes = this.favoriteDAO.findIdUser(user.getId());
			request.setAttribute("listlikes", listlikes);
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.getRequestDispatcher("/views/index.jsp").forward(request, response);
	}
	private void unlikevd(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int idVideo = Integer.valueOf(request.getParameter("idvideo"));
		try {
			this.favoriteDAO.remove(idVideo);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
