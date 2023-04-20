package com.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;

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
import com.entity.Favorite;
import com.entity.Share;
import com.entity.User;
import com.entity.Video;
import com.untils.CookieUtils;

/**
 * Servlet implementation class indexServlet
 */
@WebServlet({ "/indexServlet" })
public class indexServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAO userDAO;
	private VideoDAO videoDAO;
	private FavoriteDAO favoriteDAO;
	private ShareDAO shareDAO;
	private User user;
	private Video video;
	private Share share;

	public indexServlet() {
		super();
		this.userDAO = new UserDAO();
		this.videoDAO = new VideoDAO();
		this.favoriteDAO = new FavoriteDAO();
		this.shareDAO = new ShareDAO();
		this.user = new User();
		this.video = new Video();
		this.share = new Share();
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String action = request.getParameter("action");
		User user = (User) request.getSession().getAttribute("user");
		try {
			List<Video> lists = this.videoDAO.findVideoAll();
			request.setAttribute("lists", lists);
			request.setAttribute("videolist", this.videoDAO.findVideoAll());
			
			List<User> listusers = this.userDAO.findAll();
			request.setAttribute("listusers", listusers);
		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		}
		String uri = request.getRequestURI();
		if ("logout".equals(action)) {
			request.getSession().setAttribute("user", null);
		}

		if (action != null) {
			if (action.equals("trangchitiet")) {
				this.watchVd(request, response);
			}
		}
		try {
			List<Share> listshares = this.shareDAO.findIdUser(user.getId());
			request.setAttribute("listshares", listshares);
			List<Favorite> listlikes = this.favoriteDAO.findIdUser(user.getId());
			request.setAttribute("listlikes", listlikes);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String username = CookieUtils.get("username", request);
		String password = CookieUtils.get("password", request);
		request.setAttribute("usernamelg", username);
		request.setAttribute("passwordlg", password);
		request.setAttribute("action", action);
		request.getRequestDispatcher("/views/index.jsp").forward(request, response);
	}

	private void logout(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("action", "trangchu");
		req.getSession().setAttribute("user", null);
	}

	private void watchVd(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int idVideo = Integer.valueOf(request.getParameter("idvideo"));
		try {
			Video entity = this.videoDAO.FindIdVideo(idVideo);
			entity.setViews(entity.getViews() + 1);
			this.videoDAO.update(entity);
			request.setAttribute("Videoid", entity);
			List<Video> listvdct = this.videoDAO.findVideolist(idVideo);
			request.setAttribute("listvds", listvdct);
//			request.setAttribute("listVideos", this.videoDAO.loadVideo(idVideo));
//			this.historyVideo(request, response, idVideo);

		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		}
	}

}
