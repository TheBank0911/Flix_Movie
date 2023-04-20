package com.controller;

import java.io.IOException;
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
 * Servlet implementation class login
 */
@WebServlet( "/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAO userDAO;
	private VideoDAO videoDAO;
	private FavoriteDAO favoriteDAO;
	private ShareDAO shareDAO;
	private User user;
	private Video video;
	private Share share;

	public login() {
		super();
		this.userDAO = new UserDAO();
		this.videoDAO = new VideoDAO();
		this.favoriteDAO = new FavoriteDAO();
		this.shareDAO = new ShareDAO();
		this.user = new User();
		this.video = new Video();
		this.share = new Share();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String uri = request.getRequestURI();
		if (uri.contains("login")) {
			this.login(request, response);
		}
		request.setAttribute("action", "dangnhap");
		request.getRequestDispatcher("/views/index.jsp").forward(request, response);
	}

	protected void login(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String method = request.getMethod();
		String username = request.getParameter("usernamelg");
		String password = request.getParameter("passwordlg");
		String remember = request.getParameter("remember");
		if ("".equals(username) || "".equals(password)) {
			request.setAttribute("messagelg", "Vui lòng nhập đầy đủ thông tin!");
		} else {
			try {
				UserDAO dao = new UserDAO();
				this.user = dao.findById(username);
				if (!user.getPassword().equals(password)) {
					request.setAttribute("messagelg", "Sai mật khẩu!");
				} else {
					request.setAttribute("messagelg", "Đăng nhập thành công");
					request.getSession().setAttribute("user", user);
					int hours = (remember == null) ? 0 : 30 * 24;
					CookieUtils.add("username", username, hours, response);
					CookieUtils.add("password", password, hours, response);
					
				}
			} catch (Exception e) {
				request.setAttribute("messagelg", "Tài khoản không tồn tại!");
			}
		}

	}
	
	
	
	}

